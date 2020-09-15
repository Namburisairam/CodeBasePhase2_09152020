using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Models
{
    public class ChatMessaging
    {
        public int SendersID { get; set; }
        public string Text { get; set; }
        public int ReceiversID { get; set; }

    }
}
