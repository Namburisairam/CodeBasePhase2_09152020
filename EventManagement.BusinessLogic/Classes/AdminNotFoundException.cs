using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Classes
{
    public class AdminNotFoundException: Exception
    {
        public AdminNotFoundException(): base("No Admin assigned to this event. Please contact Admin")
        {

        }

        public AdminNotFoundException(string message): base(message)
        {

        }
    }
}
