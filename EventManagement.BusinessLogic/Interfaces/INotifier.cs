using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Interfaces
{
    interface INotifier
    {
      void SendEmail(string fromAddress, params Stream[] stream);
    }
}
