using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EventManagement.BusinessLogic.Business;
using EventManagement.DataAccess.DataBase.Model;
using CommonHelpers;
using EventManagement.Filter;
using TransportERP.Base;

namespace EventManagement.Controllers
{
    [AuthFilter(IsWebCall = true)]
    public class ConfigsController : BaseController
    {
        Configs logic = new Configs();
        Entities db = new Entities();
        // GET: Configs
        public async Task<ActionResult> Index()
        {
          var record = await  logic.GetAllConfig();
            return View(record);
        }

      
        public async Task<ActionResult> Details(int? id)
        {
        
            return View();
        }

       
        //public ActionResult Create()
        //{
        //    return View();
        //}
        public async Task<ActionResult> Create(int? id)
        {
         var rec = await   logic.GetConfigByID(id);
           
            return View(rec);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Config config)
        {
            try
            {
                await logic.AddUpdateConfig(config);

                return RedirectToAction("Index");
            }

            catch(Exception ex)
            {
                Helpers.LogError("Configuration Error", ex);
                ViewBag.error = Literals.ErrorMessage;
                return View(config);
            }
         
            

            
        }

        

        // GET: Configs/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
           
            return View();
        }

        // POST: Configs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
         
            return RedirectToAction("Index");
        }

        public async Task<ActionResult> DeleteConfig(int id)
        {
            Config config = await db.Configs.FindAsync(id);
            db.Configs.Remove(config);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

    }
}
