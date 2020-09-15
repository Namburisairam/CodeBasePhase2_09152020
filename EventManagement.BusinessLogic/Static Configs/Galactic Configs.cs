using CommonHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Static_Configs
{
   public static class GalacticConfigs
    {
        public static string GalacticApiBaseUrl
        {
            get
            {
                if (!string.IsNullOrEmpty(Helpers.GetAppSetting("GalacticApi")))
                    return Helpers.GetAppSetting("GalacticApi");
                else return "https://ws.galacticps.com/";
            }
        }
    }
}
