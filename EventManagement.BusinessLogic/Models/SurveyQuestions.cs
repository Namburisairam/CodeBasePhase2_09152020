using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Models
{
    public class SurveyQuestions
    {
        public int QID { get; set; }
        public string QuestionText { get; set; }
        public int QuestionResponseType { get; set; }
        public List<OptionData> options { get; set; }
    }
}
