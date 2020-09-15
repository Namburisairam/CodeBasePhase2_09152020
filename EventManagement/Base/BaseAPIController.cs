using CommonHelpers;
using EventManagement.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using TransportERP.Base;
using EventManagement.BusinessLogic.Business;

namespace EventManagement.Base
{
    public class BaseAPIController : BaseController
    {
        public const string ErrorMessage = "An unknown error has occurred , Please contact your system administrator";

        
        protected new JsonResult Json(object data)
        {
            var jsonResult = base.Json(data);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        protected new JsonResult Json(object data, JsonRequestBehavior jsonRequestBehavior)
        {
            var jsonResult = base.Json(data, jsonRequestBehavior);
            jsonResult.MaxJsonLength = int.MaxValue;
            return jsonResult;
        }

        protected override void OnException(ExceptionContext filterContext)
        {
            Helpers.LogError("API Error: ", filterContext.Exception);
            var errorService = new Error();
            errorService.LogErrorToDB(filterContext.Exception, "Api");
            var apiexception = filterContext.Exception as APIException;
            string message = "" + filterContext.Exception;
            if (apiexception != null)
                message = apiexception.Message;
            filterContext.HttpContext.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
            filterContext.Result = new JsonResult
            {
                Data = new { error = ErrorMessage }
                ,
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
            filterContext.ExceptionHandled = true;
            base.OnException(filterContext);
        }
    }
}