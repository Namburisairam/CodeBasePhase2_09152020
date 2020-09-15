using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Models
{
    public class Preferences
    {
        public int? AttendeeID { get; set; }
        public bool? EnableMessaging { get; set; }
        public bool? EnableAlertEmails { get; set; }
        public bool? EnableAttendeeMessagingEmails { get; set; }

    }
}
