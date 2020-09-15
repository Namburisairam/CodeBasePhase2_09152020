using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Classes
{
   public class GalacticEventExistsException: Exception
    {
        public GalacticEventExistsException()
        {

        }
        public GalacticEventExistsException(string message):base(message)
        {

        }

    }
}
