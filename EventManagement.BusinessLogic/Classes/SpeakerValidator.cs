using EventManagement.BusinessLogic.Interfaces;
using EventManagement.DataAccess.DataBase.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Classes
{
   public class SpeakerValidator : IEntityValidity<Attende>
    {
        public Expression<Func<Attende, bool>> CheckValidity
        {
            get { return x => x.IsSpeaker; }
        }
    }
}
