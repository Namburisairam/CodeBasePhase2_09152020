using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Models
{
    public class SurveyReport
    {
        public string Question { get; set; }
        public string Responses { get; set; }
        public int Count { get; set; }
        public double Average { get; set; }
    }
}
