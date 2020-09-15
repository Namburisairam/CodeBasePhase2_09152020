using EventManagement.BusinessLogic.BussinessBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using EventManagement.DataAccess.DataBase.Model;
using EventManagement.BusinessLogic.Models;
using System.Globalization;
using RestSharp;
using System.Net;
using System.Collections.Specialized;
using System.IO;
using EventManagement.BusinessLogic.Models.APIDTOOjbects;
using Newtonsoft.Json;
using EventManagement.BusinessLogic.Models.Enums;

namespace EventManagement.BusinessLogic.Business
{
    public class ReportsLogic : BaseLogic
    {
        Entities db = new Entities();
        public async Task Appdownloads(int UserID)
        {
            Db.AppDownloads.Add(new AppDownload
            {
                UserName = Db.Attendes.Find(UserID).FirstName,
                DownloadDate = DateTime.Now
            });
            await db.SaveChangesAsync();
        }

        public async Task GetAllAttendees()
        {
            db.Attendes.Select(x => x.FirstName).ToList();
        }
    }
}
