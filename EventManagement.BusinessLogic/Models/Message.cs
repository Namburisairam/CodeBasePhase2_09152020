using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Models
{
    public class Message
    {
        public int SenderID { get; set; }
        public int ChannelId { get; set; }
        public int EventId { get; set; }
        public string MessageText { get; set; }
        public string AttendeeName { get; set; }
        public string NotificationType { get; set; }
        public bool status { get; set; }
        public string type { get; set; }
    }
}
