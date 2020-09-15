using EventManagement.BusinessLogic.Business;
using EventManagement.DataAccess.DataBase.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TransportERP.Base;

namespace EventManagement.Controllers
{
    public class UserEventsController : BaseController
    {
        Entities db = new Entities();
        // GET: UserEvents
        public ActionResult Create(int? id, int eventID)
        {
            var group = id == null ? new GroupInfo() : db.GroupInfoes.Find(id);
            ViewBag.eventAttendees = db.Attendes.Where(x => x.AttendesEvents.Any(y=>y.EventID == eventID));
            return View(group);
        }
        /// <summary>
        /// Add attendees to groups
        /// </summary>
        /// <param name="groupInfo"></param>
        /// <param name="attendees"></param>
        /// <returns></returns>

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(GroupInfo groupInfo, List<int> attendees)
        {
            Firechatlogic firechatlogic = new Firechatlogic();
            int channelId = default;
            if (groupInfo.ID > 0)
            {
                var selectedGroup = db.GroupInfoes.Find(groupInfo.ID);
                selectedGroup.GroupName = groupInfo.GroupName;
                selectedGroup.GroupDescription = groupInfo.GroupDescription;
                if (attendees == null)
                {
                    var removeAttendees = db.AttendeeGroups.Where(x => x.GroupID == groupInfo.ID);
                    int channelUserId = removeAttendees.FirstOrDefault().AttendeeID.Value;
                    
                    if (groupInfo.IsChatAllowed == true)
                    {
                        channelId = db.Channels.FirstOrDefault(s => s.GroupId == groupInfo.ID).channelid;

                        if (channelId != default)
                        {
                            foreach (AttendeeGroup removeAttendee in removeAttendees)
                            {
                                firechatlogic.LeaveGroup(removeAttendee.AttendeeID.Value, channelId);
                            }
                        }
                    }
                    db.AttendeeGroups.RemoveRange(removeAttendees);
                }
                else
                {
                    List<AttendeeGroup> removeAttendees = db.AttendeeGroups.Where(x => x.GroupID == groupInfo.ID && !attendees.Contains(x.AttendeeID.Value)).ToList();
                    db.AttendeeGroups.RemoveRange(removeAttendees);
                    db.SaveChanges();

                    int channelUserId = db.AttendeeGroups.Where(x => x.GroupID == groupInfo.ID).FirstOrDefault().AttendeeID.Value;
                    
                    if (groupInfo.IsChatAllowed == true)
                    {
                        channelId = db.Channels.FirstOrDefault(s => s.GroupId == groupInfo.ID).channelid;

                        if (channelId != default)
                        {
                            foreach (AttendeeGroup removeAttendee in removeAttendees)
                            {
                                firechatlogic.LeaveGroup(removeAttendee.AttendeeID.Value, channelId);
                            }                            
                        }
                    }

                    List<int> newlyAddedReceivers = new List<int>();
                                        
                    List<int> getchannelRecievers = new List<int>();

                    if (groupInfo.IsChatAllowed == true)
                    {
                        if (channelId != default)
                        {
                            getchannelRecievers = firechatlogic.GetChannelRecieversToSendNotification(channelId, channelUserId);

                            getchannelRecievers.Add(channelUserId);
                        }                        
                    }
                    
                    foreach (int attendeeID in attendees)
                    {
                        if (!db.AttendeeGroups.Where(x => x.GroupID == groupInfo.ID).Any(x => x.AttendeeID == attendeeID))
                        {
                            db.AttendeeGroups.Add(new AttendeeGroup() { AttendeeID = attendeeID, GroupID = groupInfo.ID });
                            
                            if (groupInfo.IsChatAllowed)
                            {
                                firechatlogic.AddusersToChannel(attendeeID, getchannelRecievers, groupInfo.EventID.Value, channelId);

                                getchannelRecievers.Add(attendeeID);
                            }
                        }
                    }
                    
                }
            }
            else
            {
                if (attendees != null && attendees.Count > 0)
                {
                    groupInfo.AttendeeGroups = attendees.Select(x => new AttendeeGroup() { AttendeeID = x }).ToList();
                }

                groupInfo.CreatedBy = CurrentUserSession.AttendesID;
                groupInfo.CreatedDate = DateTime.Now;
                db.GroupInfoes.Add(groupInfo);
                db.SaveChanges();

                if (groupInfo.IsChatAllowed)
                {
                    channelId = firechatlogic.CreateChatChannel(CurrentUserSession.AttendesID.Value, attendees, groupInfo.EventID.Value, true, groupInfo.ID, ImageSavePath);
                }                
            }
            db.SaveChanges();
            return Redirect(Url.Action("Create", "Events", new { Id = groupInfo.EventID }) + "#UserGroups");
        }
        /// <summary>
        /// Delete existing group
        /// </summary>
        /// <param name="ID"></param>
        /// <param name="eventID"></param>
        /// <returns></returns>
        public ActionResult DeleteUser(int ID,int eventID)
        {
            //var group = db.GroupInfoes.Find(ID);
            //db.GroupInfoes.Remove(group);
            db.DeleteGroups(ID, eventID);
            db.SaveChanges();
            return Redirect(Url.Action("Create", "Events", new { Id = eventID }) + "#UserGroups");
        } 


    }
}