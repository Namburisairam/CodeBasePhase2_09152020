using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Models
{
    public class EventQuestions
    {
        public int QID { get; set; }
        public string QuestionText { get; set; }
        public string QuestionResponseType { get; set; }
        public System.DateTime CreateDate { get; set; }
        public bool? HideorShowQuestion { get; set; }
    }
}
