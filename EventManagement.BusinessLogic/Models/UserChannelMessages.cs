using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Models
{
    public class UserChannelMessages
    {
        public int ChannelId { get; set; }
        
        public long MessageIndex { get; set; }
        
        public int AttendeeId { get; set; }
        
        public string AttendeeName { get; set; }
        
        public int EventId { get; set; }
        
        public DateTime DateCreated { get; set; }
        
        public string AttendeImage { get; set; }
        
        public string MessageText { get; set; }

        public bool HasLeft { get; set; }

        public string type { get; set; }

    }
}
