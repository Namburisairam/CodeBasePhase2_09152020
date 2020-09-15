using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EventManagement.Areas.API.Models
{
    public class OptionsSelected
    {
        public int Rating { get; set; }
        public string FavouriteActivity { get; set; }
        public string EnjoyedShow { get; set; }
        public string[] ActivitiesLiked { get; set; }


    }
}