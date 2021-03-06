﻿using CommonHelpers;
using EventManagement.BusinessLogic.BussinessBase;
using EventManagement.BusinessLogic.Models;
using EventManagement.DataAccess.DataBase.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Business
{
    public class FloorDirectionsLogic : BaseLogic
    {
        public List<FloorMap> GetEventFloorMaps(int eventID, Func<string, string> imageConvertionHandler)
        {
            var floormap = Db.FloorMappings.Where(x => x.EventID == eventID).ToList()
                                            .Select(x => CreateFloorMapObj(x, eventID, imageConvertionHandler)).ToList();

            return floormap;
        }

        public FloorMap GetFloorMapByID(int floorMapID, int eventID, Func<string, string> imageConvertionHandler)
        {
            var floorMap = Db.FloorMappings.Find(floorMapID);
            return CreateFloorMapObj(floorMap, eventID, imageConvertionHandler);
        }

        public FloorMap CreateFloorMapObj(FloorMapping floorMapping, int eventID, Func<string, string> imageConvertionHandler)
        {
            FloorMap test = new FloorMap
            {
                ID = floorMapping.ID,
                FloorName= floorMapping.FloorName,
                PhotoWidth = floorMapping.PhotoWidth,
                PhotoHeight = floorMapping.PhotoHeight,
                PhotoURL = floorMapping.PhotoURL,
                MarkedLocations = floorMapping.FloorRegionMappings.Select(y => new
                {
                    y.ID,
                    y.X,
                    y.Y,
                    LocationName = y?.FloorMapLocation?.Location,
                    Activities = y?.FloorMapLocation?.Activites.Select(z =>
                    new
                    {
                        z.ID,
                        z.Name,
                        z.StartTime,
                        z.EndTime
                    }),
                    Sponsors = y?.FloorMapLocation?.SponsorsEvents.Where(z => z.EventID == eventID).Select(z => z.Sponsor).Select(z => new
                    {
                        z.ID,
                        z.Name
                    }),
                    Exhibitors = y?.FloorMapLocation?.ExhibitorsEvents.Where(z => z.EventID == eventID).Select(z => z.Exhibitor).Select(z => new
                    {
                        z.ID,
                        z.Name
                    }),
                    Vendors = y?.FloorMapLocation?.VendorsEvents.Where(z => z.EventID == eventID).Select(z => z.Vendor).Select(z => new
                    {
                        z.ID,
                        z.Name
                    })
                })
            };
            return test;
        }
      }
  }
