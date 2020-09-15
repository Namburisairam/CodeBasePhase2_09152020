using CommonHelpers;
using EventManagement.BusinessLogic.Business;
using EventManagement.DataAccess.DataBase.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace EventScheduleApp
{
   public class Program
    {
        public static async Task Main(string[] args)
        {
            try
            {
                EventLogic eventLogic = new EventLogic();
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
                await eventLogic.SendScheduledActivityNotifications();
                await eventLogic.SendSurveyNotifications();
            }
            catch (Exception ex)
            {
                Error error = new Error();
                error.LogErrorToDB(ex, "Job");
                Helpers.LogError(ex.Message, ex);
                Environment.Exit(0);
            }
        }
    }
}
