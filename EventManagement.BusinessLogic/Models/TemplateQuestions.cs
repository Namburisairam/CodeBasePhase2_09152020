using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Models
{
    public class TemplateQuestions
    {
        public int TQID { get; set; }
        public string TQuestionText { get; set; }
        public int TQuestionResponseType { get; set; }
        public List<OptionData> TQoptions { get; set; }
    }
}
