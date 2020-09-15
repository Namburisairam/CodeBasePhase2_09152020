using CommonHelpers;
using EventManagement.Base;
using EventManagement.BusinessLogic;
using EventManagement.BusinessLogic.Business;
using EventManagement.BusinessLogic.Models;
using EventManagement.Filter;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace EventManagement.Areas.API.Controllers
{
    public class ReportsController : BaseAPIController
    {

        ReportsLogic reportsLogic = new ReportsLogic();
        public async Task Appdownloads(string Token)
        {
            await reportsLogic.Appdownloads(CurrentUserSession.AttendesID.Value);
        }

    }
}