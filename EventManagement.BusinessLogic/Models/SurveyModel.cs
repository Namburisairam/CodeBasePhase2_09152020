using EventManagement.DataAccess.DataBase.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Models
{
    public class SurveyModel
    {
        public int SurveyID { get; set; }
        public string SurveyName { get; set; }
        public string SurveyDescription { get; set; }
        public string SurveyLevel { get; set; }
        public int? EventID { get; set; }
        public int? ActivityID { get; set; }
        public int? TemplateID { get; set; }
        public List<SurveyQuestions> QuestionsOptions { get; set; }
        
    }
}
