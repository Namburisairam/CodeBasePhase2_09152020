﻿using CommonHelpers;
using EventManagement.Base;
using EventManagement.BusinessLogic.Business;
using EventManagement.Filter;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace EventManagement.Areas.API.Controllers
{
    [AuthFilter]
    public class SponsorsController : BaseAPIController
    {
        // GET: API/Sponsors
        
       
        public async Task<ActionResult> Index(string Token,string term ="")
        {
            SponsorsLogic SponsorBusiness = new SponsorsLogic();
            var data = await SponsorBusiness.GetSponsors(term);

            return Json(new
            {
                data = (await SponsorBusiness.GetSponsors(term)).Select(x => new
                {
                    Description = x.Description,
                    DocURL = x.DocURL,
                    ID = x.ID,
                    Name = x.Name,
                    //Package = x.UserPackageType.Name,
                    Status = x.Status,
                    Thumbnail = imageToUrlConvertionHandler(x.Thumbnail),
                    //Helpers.ImageToBase64(MvcCustom.APiImagePath(x.Thumbnail)),
                })
            },JsonRequestBehavior.AllowGet);
        }
        /// <summary>
        /// Get sponsors information for specific event
        /// </summary>
        /// <param name="Token"></param>
        /// <param name="eventId"></param>
        /// <returns>Returns sponsors data</returns>
        [HttpGet]
        public async Task<ActionResult> GetSponsorsForSpecificEvent(string Token, int eventId)
        {
            SponsorsLogic SponsorBusiness = new SponsorsLogic();
            var data =  SponsorBusiness.GetSponsorsForSpecificEvent(eventId);
            
            return Json(new { data = data.Select(x => new
            {
                x.ID,
                x.Name,
                Thumbnail = imageToUrlConvertionHandler(x.Thumbnail),
                //Helpers.ImageToBase64(MvcCustom.APiImagePath(x.Thumbnail)),
                x.Status,
                iconimage = imageToUrlConvertionHandler(x.SponsorsEvents.FirstOrDefault(y => y.EventID == eventId && y.SponsorID == x.ID)?.UserPackageType?.iconimage),
                //Helpers.ImageToBase64(MvcCustom.APiImagePath(x.SponsorsEvents.FirstOrDefault(y => y.EventID == eventId && y.SponsorID == x.ID)?.UserPackageType?.iconimage)),
                x.Description,
                x.DocURL,
                SponsorPackageType = x.SponsorsEvents.FirstOrDefault(y => y.EventID == eventId && y.SponsorID == x.ID)?.UserPackageType?.Name,
                Documents = x.Documents.Select(y => new
                {
                    y.ID,
                    y.DocumentName,
                    FilePath = string.Format("{0}://{1}{2}", Request.Url.Scheme, Request.Url.Authority, MvcCustom.ApiDocumentPath(y.FilePath))
                }),
                x.SponsorsEvents.FirstOrDefault(y => y.EventID == eventId)?.BoothNo,
            })
            }, JsonRequestBehavior.AllowGet);
        }
        /// <summary>
        /// Get Sponsor information for given event and id
        /// </summary>
        /// <param name="Token"></param>
        /// <param name="id"></param>
        /// <param name="eventID"></param>
        /// <returns>Returns sponsor data</returns>
        [HttpGet]
        public async Task<ActionResult> SponserById(string Token, int id, int eventID)
        {
            SponsorsLogic attendesBusiness = new SponsorsLogic();
            var x = await attendesBusiness.GetSponsorById(id);
            var sponsorsEvent = x.SponsorsEvents.FirstOrDefault(y => y.EventID == eventID);
            var floorMapping = sponsorsEvent?.FloorMapLocation?.FloorRegionMappings.FirstOrDefault();
            return Json(new
            {
                data = new
                {
                    x.ID,
                    x.Name,
                    x.Description,
                    x.DocURL,
                    x.WebsiteURL,
                    Thumbnail = imageToUrlConvertionHandler(x.Thumbnail),
                    //Helpers.ImageToBase64(MvcCustom.APiImagePath(x.Thumbnail)),
                    x.Status,
                    SponsorPackageType = x.SponsorsEvents.FirstOrDefault(y => y.EventID== eventID)?.UserPackageType?.Name,
                    Documents = x.Documents.Select(y => new
                    {
                        y.ID,
                        y.DocumentName,
                        FilePath = string.Format("{0}://{1}{2}", Request.Url.Scheme, Request.Url.Authority, MvcCustom.ApiDocumentPath(y.FilePath))
                    }),
                    sponsorsEvent?.BoothNo,
                    sponsorsEvent?.StartTime,
                    sponsorsEvent?.EndTime,
                    Note = x.Notes.FirstOrDefault(y => y.UserID == CurrentUserSession.AttendesID.Value && y.EventID == eventID)?.Text,
                    FloorMap = floorMapping != null ? new
                    {
                        floorMapping?.FloorMapping?.ID,
                        FloorName = sponsorsEvent?.FloorMapLocation?.Location
                    } : null
                }
            }, JsonRequestBehavior.AllowGet);
        }

    }
}