//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EventManagement.DataAccess.DataBase.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class SponsorsEvent
    {
        public int ID { get; set; }
        public int SponsorID { get; set; }
        public int EventID { get; set; }
        public string BoothNo { get; set; }
        public Nullable<System.DateTime> StartTime { get; set; }
        public Nullable<System.DateTime> EndTime { get; set; }
        public Nullable<int> FloorMapLocationID { get; set; }
        public Nullable<int> packagetype { get; set; }
    
        public virtual Event Event { get; set; }
        public virtual FloorMapLocation FloorMapLocation { get; set; }
        public virtual Sponsor Sponsor { get; set; }
        public virtual Sponsor Sponsor1 { get; set; }
        public virtual UserPackageType UserPackageType { get; set; }
    }
}
