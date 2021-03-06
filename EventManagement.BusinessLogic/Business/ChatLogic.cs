﻿using CommonHelpers;
using EventManagement.BusinessLogic.Business.Email_Notifier;
using EventManagement.BusinessLogic.BussinessBase;
using EventManagement.BusinessLogic.Classes;
using EventManagement.BusinessLogic.Models;
using EventManagement.DataAccess.DataBase.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Twilio;
using Twilio.Base;
using Twilio.Jwt.AccessToken;
using Twilio.Rest.Chat.V2.Service;
using Twilio.Rest.Chat.V2.Service.Channel;
using Twilio.Rest.Chat.V2.Service.User;

namespace EventManagement.BusinessLogic.Business
{

    public class ChatLogic : BaseLogic
    {
        string accountSid { get; }
        string authToken { get; }
        //const string serviceId = "ISa8ceef9657eb427aa5d19dd04746c86a";
        string serviceId { get; }
        AttendesLogic attendesLogic = new AttendesLogic();
        public ChatLogic()
        {
            accountSid = TwilioConfiguration.AccountSID;
            authToken = TwilioConfiguration.AuthToken;
            serviceId = TwilioConfiguration.ChatServiceSid;
            TwilioClient.Init(accountSid, authToken);
        }

        public int createChannel(int FromuserId, int TouserId)
        {
            try
            {
                //using (var context = new nobhubCustomContext())
                //{
                    var uchannel = Db.UserChatChannels.FirstOrDefault(x => x.userid == FromuserId && x.touserid == TouserId);

                    if (uchannel != null)
                    {
                        return uchannel.channelid;
                    }
                    else
                    {
                        Channel channels = new Channel();
                        Db.Channels.Add(channels);
                        Db.SaveChanges();

                        UserChatChannel uc = new UserChatChannel();
                        uc.channelid = channels.channelid;
                        uc.userid = FromuserId;
                        uc.touserid = TouserId;
                        uc.hasleft = false;
                        uc.isdeleted = false;
                        Db.UserChatChannels.Add(uc);

                        var uc1 = new UserChatChannel();
                        uc1.userid = TouserId;
                        uc1.touserid = FromuserId;
                        uc1.hasleft = false;
                        uc1.isdeleted = false;
                        uc1.channelid = channels.channelid;
                        Db.UserChatChannels.Add(uc1);
                        Db.SaveChanges();
                        return channels.channelid;
                    }
                //}
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //public List<string> GetChannelUserTokens(int ChannelId, string LoginUserFcmToken)
        //{

        //    try
        //    {
        //        var userTokens = ((from c in Db.UserChatChannels.Where(c => c.channelid == ChannelId)
        //                           from d in Db.DeviceFcmTokens.Where(i => i.userid == c.userid && i.fcmtoken != LoginUserFcmToken)
        //                           select d.fcmtoken).ToList());

        //        return userTokens;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        public ChannelMessage SaveChannelMessage(channelmsgs _msg)
        {
            ChannelMessage newMsg = new ChannelMessage();

            try
            {
                newMsg.channelid = _msg.channelId;
                newMsg.userid = _msg.FromuserId;
                newMsg.sentdate = DateTime.Now;
                newMsg.messagetype = unchecked((byte)_msg.msgtype);
                newMsg.message = "";
                
                Db.ChannelMessages.Add(newMsg);
                Db.SaveChanges();

                if (_msg.msgtype == 1)
                {
                    newMsg.message = _msg.strmessage;
                    Db.SaveChanges();
                }
                if (_msg.msgtype == 2)
                {
                    newMsg.message = newMsg.id + "." + _msg.ImgExt;
                    Db.SaveChanges();
                }
                if (_msg.msgtype == 1)
                {
                    var ch = Db.Channels.FirstOrDefault(x => x.channelid == _msg.channelId);
                    //ch.latestmsgid = (int)newMsg.id;
                    Db.SaveChanges();
                }

                Db.UserChatChannels.Where(c => c.channelid == _msg.channelId &&
                                           c.userid != _msg.FromuserId).ToList().ForEach(k =>
                {
                    k.unreadmsgcount = k.unreadmsgcount + 1;
                    Db.SaveChanges();
                });

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return newMsg;

        }

        public int SendNotification(List<string> userTokens, string bodymsg, string Type, string Title, int channelId, string LoginuserToken, int? fromuserId, byte? MsgType, int? ToUserId)
        {
            try
            {
                String sResponseFromServer = "-1";

                WebRequest tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send");
                tRequest.Method = "post";
                tRequest.Headers.Add(HttpRequestHeader.Authorization, $"key={TwilioConfiguration.FirebaseSID}");
                //tRequest.Headers.Add(string.Format("Sender: id={0}", "735466763409"));
                tRequest.ContentType = "application/json";
                var payload = new
                {
                    registration_ids = userTokens,
                    priority = "high",
                    content_available = true,
                    notification = new
                    {
                        body = bodymsg,
                        title = Title,
                    },
                    data = new
                    {
                        text = bodymsg,
                        ChannelId = channelId,
                        type = Type,
                        fromFcmToken = LoginuserToken,
                        fromUserId = fromuserId,
                        MessageType = MsgType,
                    }
                };

                string postbody = JsonConvert.SerializeObject(payload).ToString();
                Byte[] byteArray = Encoding.UTF8.GetBytes(postbody);
                tRequest.ContentLength = byteArray.Length;
                using (Stream dataStream = tRequest.GetRequestStream())
                {
                    dataStream.Write(byteArray, 0, byteArray.Length);
                    using (WebResponse tResponse = tRequest.GetResponse())
                    {
                        using (Stream dataStreamResponse = tResponse.GetResponseStream())
                        {
                            if (dataStreamResponse != null) using (StreamReader tReader = new StreamReader(dataStreamResponse))
                            {
                                    sResponseFromServer = tReader.ReadToEnd();
                                    //result.Response = sResponseFromServer;
                            }
                        }
                    }
                }

                var data = JsonConvert.DeserializeObject<EventLogic.FcmResponse>(sResponseFromServer.ToString());
                return data.success;
            }
            catch (Exception ex)
            {
                throw;
            }
        }


        public string GetChatToken(string device, string identity)
        {
            if (device == null || identity == null) return null;

            const string appName = "TwilioChatDemo";
            var endpointId = string.Format("{0}:{1}:{2}", appName, identity, device);

            var grants = new HashSet<IGrant>
            {
                new IpMessagingGrant {EndpointId = endpointId, ServiceSid = TwilioConfiguration.ChatServiceSid, PushCredentialSid = TwilioConfiguration.PushCredentialSid }
            };

            return new Token(
                 TwilioConfiguration.AccountSID,
                 TwilioConfiguration.ApiKey,
                 TwilioConfiguration.ApiSecret,
                 identity,
                 grants: grants).ToJwt();
        }

        public async Task<string> startAdminToAttendeeConversation(int ReceiverID, int eventID)
        {
            var senderIdentity = "CMSAdmin";
            var receiverIdentity = Db.Attendes.Find(ReceiverID).Email;

            var adminChannelUsers = GetAdminChannelsByEventID(eventID);
            var attendeeChannelUsers = GetAttendeeChannelByEventID(ReceiverID, eventID);

            // var joinedChannelMembers = senderChannels.Join(recieverChannels, x => x.ChannelSid, y => y.ChannelSid, (x, y) => x).Select(x => GetChannelUsers(x.ChannelSid)).FirstOrDefault(x => x.Count() == 2);

            var commonChannels = adminChannelUsers.Join(attendeeChannelUsers, x => x.ChannelID, y => y.ChannelID, (x, y) => x);

            if (commonChannels.Count() > 0)
            {
                return commonChannels.ToList()[0].ChatChannel.ChannelID;
            }
            var channel = ChannelResource.Create(
                friendlyName: senderIdentity + '_' + receiverIdentity,
                pathServiceSid: serviceId,
               type: "private",
               attributes: Newtonsoft.Json.JsonConvert.SerializeObject(new
               {
                   isGroup = true,
                   GroupMembers = new object[] { new { name = "Admin" }, new { name = Db.Attendes.Find(ReceiverID).FirstName, id = ReceiverID } },
                   eventID
               })
            );
            await SaveAdminChannelInDB(channel.Sid, receiverIdentity, ReceiverID, eventID);
            return channel.Sid;
        }

        public async Task SaveAdminChannelInDB(string channelID, string receiverIdentity, int receiverID, int eventID)
        {
            var eventAdmins = await GetEventAdmins(eventID);

            if (eventAdmins.Count == 0)
            {
                throw new AdminNotFoundException("No Admin assigned to this event. Please contact Admin");
            }

            var channelUsers = new List<ChannelUser>();

            eventAdmins.ForEach(
               x =>
               {
                   var adminMemberID = createMember(x.Email, channelID, attributes: Newtonsoft.Json.JsonConvert.SerializeObject(new
                   {
                       Name = x.FirstName,
                       id = x.ID
                   }));
                   channelUsers.Add(
                        new ChannelUser()
                        {
                            AttendeeID = x.ID,
                            MemberSID = adminMemberID
                        });
               }
           );
            var receiverMemberID = createMember(receiverIdentity, channelID, Newtonsoft.Json.JsonConvert.SerializeObject(new
            {
                Name = Db.Attendes.Find(receiverID).FirstName,
                id = receiverID
            }));
            channelUsers.Add(
                        new ChannelUser()
                        {
                            AttendeeID = receiverID,
                            MemberSID = receiverMemberID
                        });
            Db.ChatChannels.Add(
                new ChatChannel()
                {
                    ChannelID = channelID,
                    ChannelUsers = channelUsers,
                    EventID = eventID,
                    IsAdminChannel = true
                });

            await Db.SaveChangesAsync();
        }

        public async Task<List<Attende>> GetEventAdmins(int eventID)
        {
            var adminUsers = await attendesLogic.GetAttendes(checkAttendeeValidity: new AdminValidator());
            return adminUsers.Where(x => x.AttendesEvents.Any(y => y.EventID == eventID)).ToList();
        }

        public List<Attende> GetChannelMembers(string channelID)
        {
            var channel = Db.ChatChannels.FirstOrDefault(x => x.ChannelID == channelID);
            if (channel == null)
            {
                throw new Exception("Channel not found");
            }
            return channel.ChannelUsers.Select(x => x.Attende).ToList();
        }

        public string startOneToOneConversation(int SenderID, int ReceiverID, int eventID)
        {
            //TwilioClient.Init(accountSid, authToken);
            var senderIdentity = Db.Attendes.Find(SenderID).Email;
            var receiverIdentity = Db.Attendes.Find(ReceiverID).Email;
            var senderName = Db.Attendes.Find(SenderID).FirstName;
            var receiverName = Db.Attendes.Find(ReceiverID).FirstName;
            var senderChannels = GetAttendeeChannelByEventID(SenderID, eventID);
            var receiverChannels = GetAttendeeChannelByEventID(ReceiverID, eventID);
            var commonChannels = senderChannels.Join(receiverChannels, x => x.ChannelID, y => y.ChannelID, (x, y) => x);
            if (commonChannels.Count() > 0)
            {
                return commonChannels.ToList()[0].ChatChannel.ChannelID;
            }

            var channel = ChannelResource.Create(
                friendlyName: senderIdentity + '_' + receiverIdentity,
                pathServiceSid: serviceId,
               type: "private",
               attributes: Newtonsoft.Json.JsonConvert.SerializeObject(new
               {
                   isGroup = false,
                   GroupMembers = new object[] { new { name = senderName, id = SenderID }, new { name = receiverName, id = ReceiverID } },
                   eventID
               })
            );

            var senderMemberID = createMember(senderIdentity, channel.Sid, Newtonsoft.Json.JsonConvert.SerializeObject(new
            {
                Name = senderName,
                id = SenderID
            }));

            var recieverMemberID = createMember(receiverIdentity, channel.Sid, Newtonsoft.Json.JsonConvert.SerializeObject(new
            {
                Name = receiverName,
                id = ReceiverID
            }));
            var channelUsers = new List<ChannelUser>();

            channelUsers.Add(
                        new ChannelUser()
                        {
                            AttendeeID = SenderID,
                            MemberSID = senderMemberID
                        });

            channelUsers.Add(
                        new ChannelUser()
                        {
                            AttendeeID = ReceiverID,
                            MemberSID = recieverMemberID
                        });


            Db.ChatChannels.Add(
                new ChatChannel()
                {
                    ChannelID = channel.Sid,
                    ChannelUsers = channelUsers,
                    EventID = eventID
                });

            Db.SaveChanges();
            return channel.Sid;
        }

        public string createMember(string identity, string channelSId, string attributes)
        {
                var memberResource = MemberResource.Create(
                                                        identity: identity,
                                                        pathServiceSid: serviceId,
                                                        pathChannelSid: channelSId,
                                                        attributes: attributes
                                                    );

                return memberResource.Sid;
        }

        public void AddNewAdminToChannel(Attende attende, int channelDbID)
        {
            var channelSID = Db.ChatChannels.Find(channelDbID).ChannelID;
            var memberSID = createMember(attende.Email, channelSID, Newtonsoft.Json.JsonConvert.SerializeObject(new
            {
                Name = attende.FirstName
            }));
            Db.ChannelUsers.Add(new ChannelUser() { AttendeeID = attende.ID, ChannelID = channelDbID, MemberSID = memberSID });
        }

        public void AddNewAdminToEventChannels(Attende attende, int eventID)
        {
            var eventObj = Db.Events.Find(eventID);
            var eventAdminChannels = eventObj.ChatChannels.Where(y => y.IsAdminChannel);
            foreach (var channel in eventAdminChannels)
            {
                AddNewAdminToChannel(attende, channel.ID);
            }
            Db.SaveChanges();
        }

        public int? getAdminGroupID()
        {
            return Db.GroupInfoes.FirstOrDefault(x => x.IsAdminGroup)?.ID;
        }

        public ResourceSet<UserChannelResource> UserChannels(string userIdentity)
        {
            //TwilioClient.Init(accountSid, authToken);

            return UserChannelResource.Read(
             pathServiceSid: serviceId,
             pathUserSid: userIdentity,
             limit: 20
         );
        }

        public List<ChannelUser> GetChannelUsers(string ChannelId)
        {
            //TwilioClient.Init(accountSid, authToken);

            //return MemberResource.Read(
            //    pathServiceSid: serviceId,
            //    pathChannelSid: ChannelId,
            //    limit: 20
            //);

            return Db.ChatChannels.FirstOrDefault(x => x.ChannelID == ChannelId).ChannelUsers.ToList();
        }

        public ResourceSet<MessageResource> ChannelMessages(string CID)
        {
            return MessageResource.Read(
    pathServiceSid: serviceId,
    pathChannelSid: CID,
    limit: 20
);
        }


        public async Task sendMessageFromAdminToGroup(string chatMessage, string channelID, int adminID, Func<string, string> imageConvertionHandler, int eventID)
        {

            //TwilioClient.Init(accountSid, authToken);

            var currentAdmin = Db.Attendes.Find(adminID);

            MessageResource.Create(
                           body: chatMessage,
                           pathServiceSid: serviceId,
                           pathChannelSid: channelID,
                           from: currentAdmin.Email,
                           attributes: Newtonsoft.Json.JsonConvert.SerializeObject(new
                           {
                               senderID = currentAdmin.ID,
                               isAdmin = true,
                               DispalyName = currentAdmin.FirstName,
                               // image = imageConvertionHandler(currentAdmin.Thumbnail)
                           })
                       );

            Db.TextChats.Add(new TextChat()
            {
                GroupID = getAdminGroupID(),
                SenderID = adminID,
                IsGroup = true,
                TextMessage = chatMessage,
                Createdate = DateTime.Now,
                ChannelID = Db.ChatChannels.FirstOrDefault(x => x.ChannelID == channelID)?.ID
            });

            Db.SaveChanges();

            #region Async Emailing

            var channelMemebers = GetChannelMembers(channelID).Where(x => x.ID != adminID);
            var attendeeLogic = new AttendesLogic();
            foreach (var member in channelMemebers)
            {
                var isMessagingEnabled = attendeeLogic.checkIfAttendeeMessagingEnabled(member);
                if (!isMessagingEnabled)
                {
                    continue;
                };
                await sendAttendeeChatEmails(member.ID, chatMessage, currentAdmin.FirstName);
                await sendAttendeeChatNotifications(member.ID, chatMessage, eventID, currentAdmin.FirstName);
            }
            #endregion
        }

        public async Task sendAttendeeMessage(string chatMessage, string channelID, int attendeeID, bool isAdminGroup, Func<string, string> imageConvertionHandler, int eventID, int? receiverID = null)
        {
            try
            {
                TwilioClient.Init(accountSid, authToken);
                //TwilioClient.Init(accountSid, authToken);
                var attendee = Db.Attendes.Find(attendeeID);
                MessageResource.Create(
                               body: chatMessage,
                               pathServiceSid: serviceId,
                               pathChannelSid: channelID,
                               from: attendee.Email,
                               attributes: Newtonsoft.Json.JsonConvert.SerializeObject(new
                               {
                                   senderID = attendeeID,
                                   isAdmin = false,
                                   DispalyName = attendee.FirstName,
                                   // image = imageConvertionHandler(attendee.Thumbnail)
                               })
                           );
                Db.TextChats.Add(new TextChat()
                {
                    SenderID = attendeeID,
                    GroupID = isAdminGroup ? getAdminGroupID() : null,
                    ReceiverID = !isAdminGroup ? receiverID : (int?)null,
                    IsGroup = isAdminGroup,
                    TextMessage = chatMessage,
                    Createdate = DateTime.Now,
                    ChannelID = Db.ChatChannels.FirstOrDefault(x => x.ChannelID == channelID)?.ID
                });

                Db.SaveChanges();

                #region Async Emailing
                if (!isAdminGroup)
                {
                    var isMessagingEnabled = new AttendesLogic().checkIfAttendeeMessagingEnabled(receiverID.Value);
                    if (!isMessagingEnabled)
                    {
                        throw new Exception("Reciever is not accepting message at this moment");
                    };
                    await sendAttendeeChatEmails(receiverID.Value, chatMessage, attendee.FirstName);
                    await sendAttendeeChatNotifications(receiverID.Value, chatMessage, eventID, attendee.FirstName);
                }
                else
                {
                    var admins = await GetEventAdmins(Db.ChatChannels.FirstOrDefault(x => x.ChannelID == channelID)?.EventID ?? throw new NullReferenceException("Event ID is null"));
                    foreach (var admin in admins)
                    {
                        await sendAttendeeChatEmails(admin.ID, chatMessage, attendee.FirstName);
                        await sendAttendeeChatNotifications(admin.ID, chatMessage, eventID, attendee.FirstName);
                    }
                }
                #endregion
            }

            catch (Exception ex)
            {
                Helpers.LogError(ex.Message, ex);
                throw;
            }

        }

        public async Task sendAttendeeChatEmails(int receiverID, string message, string senderName)
        {
            EventLogic eventLogic = new EventLogic();
            if (attendesLogic.checkIfAttendeeMessagingEmailEnabled(receiverID))
            {
                var attendee = Db.Attendes.Find(receiverID) ?? throw new Exception("Specified AttendeeID does not exists.");
                string ReceiverEmail = attendee?.Email;
                using (var emailSender = new EmailSender(ReceiverEmail, "Message received from '" + senderName + "'"))
                {
                    await emailSender.SendEmailAsync(message);
                }
            }
        }

        public async Task sendAttendeeChatNotifications(int receiverID, string message, int eventID, string from)
        {

            EventLogic eventLogic = new EventLogic();
            var sessions = eventLogic.GetAttendeeSessions(receiverID);
            var subject = $"{from}";
            var body = message;
            foreach (var session in sessions)
            {
                eventLogic.SendNotificationFromFirebaseCloud(session.DeviceToken, subject, body);
                // await eventLogic.SendNotificationAndLogInDB(session.DeviceToken, subject, body, eventID, session.AttendesID.Value, 0);
            }
        }

        public List<ChannelUser> GetAdminChannelsByEventID(int eventID)
        {
            return Db.ChannelUsers.Where(x => x.Attende.IsAdmin && x.Attende.AttendesEvents.Any(y => y.EventID == eventID) && x.ChatChannel.EventID == eventID).ToList();
        }

        public List<ChannelUser> GetAttendeeChannelByEventID(int attendeeID, int eventID)
        {
            return Db.ChannelUsers.Where(x => x.AttendeeID == attendeeID && x.ChatChannel.EventID == eventID).ToList();
        }
    }
}
