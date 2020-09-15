using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EventManagement.DataAccess.DataBase.Model;

namespace EventManagement.BusinessLogic.Models
{
   public class TemplateModel
    {
        public string TemplateName { get; set; }
        public string TemplateDescription { get; set; }
        public string  TemplateLevel { get; set; }
        public int? EventID { get; set; }
        public int? ActivityID { get; set; }
        public List<TemplateQuestions> QuestionsOptions { get; set; }
    }
}
