using EventManagement.BusinessLogic.BussinessBase;
using EventManagement.DataAccess.DataBase.Model;
using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Business
{
    public class Notifications : BaseLogic
    {

        public List<UserNotificationEntity> GetAllUserNotificationsForEvent(int attendeeID, int eventID)
        {
            var userNotifications = Db.Notifications.Where(x => x.UserNotifications.Any(y => y.AttendeeID == attendeeID) && x.EventID == eventID).ToList();

            return userNotifications.Select(S => new UserNotificationEntity(
                  S.ID,
                 S.Event.EventName,
                 S.Text,
                S.description,
                S.AddedON,
                S.UserNotifications.FirstOrDefault(x => x.AttendeeID == attendeeID)?.ReadDate,
                S.UserNotifications.FirstOrDefault(x => x.AttendeeID == attendeeID)?.Isread ?? false
             )).ToList();
        }

        public List<UserNotificationEntity> GetUnreadUserNotificationsForEvent(int attendeeID, int eventID)
        {
            return GetAllUserNotificationsForEvent(attendeeID, eventID).Where(x => !x.IsRead).ToList();
        }

        public bool ReadNotifications(int attendeeID, int notificationID)
        {
            var notification = Db.Notifications.Find(notificationID);
            var userNotification = notification.UserNotifications.FirstOrDefault(x => x.AttendeeID == attendeeID);
            userNotification.Isread = true;
            userNotification.ReadDate = DateTime.Now;
            Db.SaveChanges();
            return true;
        }

        public bool UnReadNotifications(int attendeeID, int notificationID)
        {
            var notification = Db.Notifications.Find(notificationID);
            var userNotification = notification.UserNotifications.FirstOrDefault(x => x.AttendeeID == attendeeID);
            userNotification.Isread = false;
            Db.SaveChanges();
            return true;
        }

        public async Task<int> MaintainNotificationHistory(int eid, string message, string description, int? userid)
        {

            Notification SaveNotification = new Notification();
            SaveNotification.EventID = eid;
            SaveNotification.Text = message;
            SaveNotification.description = description;
            SaveNotification.Status = true;
            SaveNotification.AddedON = DateTime.Now;
            SaveNotification.AddedBY = userid;
            Db.Notifications.Add(SaveNotification);
            await Db.SaveChangesAsync();
            return SaveNotification.ID;

        }

        public void MaintainUserNotificationHistory(int notificationID, int attendeeID)
        {
            if (!Db.UserNotifications.Any(x => x.AttendeeID == attendeeID && x.NotificationID == notificationID))
            {
                Db.UserNotifications.Add(new UserNotification()
                {
                    AttendeeID = attendeeID,
                    NotificationID = notificationID,
                    Isread = false,
                    CreatedDate = DateTime.Now
                });
                Db.SaveChanges();
            }
        }

    }



    public class UserNotificationEntity
    {
        public int id { get; }
        public string Event { get; }
        public string Title { get; }
        public string Text { get; }
        public DateTime? SentDate { get; }
        public DateTime? ReadDate { get; }
        public bool IsRead { get; }

        public UserNotificationEntity(int id, string @event, string title, string text, DateTime? sentDate, DateTime? readDate, bool isRead)
        {
            this.id = id;
            Event = @event;
            Title = title;
            Text = text;
            SentDate = sentDate;
            ReadDate = readDate;
            IsRead = isRead;
        }

        public override bool Equals(object obj)
        {
            return obj is UserNotificationEntity other &&
                   id == other.id &&
                   Event == other.Event &&
                   Title == other.Title &&
                   Text == other.Text &&
                   EqualityComparer<DateTime?>.Default.Equals(SentDate, other.SentDate) &&
                   EqualityComparer<DateTime?>.Default.Equals(ReadDate, other.ReadDate) &&
                   EqualityComparer<bool?>.Default.Equals(IsRead, other.IsRead);
        }

        public override int GetHashCode()
        {
            var hashCode = 772753967;
            hashCode = hashCode * -1521134295 + id.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Event);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Title);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Text);
            hashCode = hashCode * -1521134295 + EqualityComparer<DateTime?>.Default.GetHashCode(SentDate);
            hashCode = hashCode * -1521134295 + EqualityComparer<DateTime?>.Default.GetHashCode(ReadDate);
            hashCode = hashCode * -1521134295 + EqualityComparer<bool?>.Default.GetHashCode(IsRead);
            return hashCode;
        }
    }
}
