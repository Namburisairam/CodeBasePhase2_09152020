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
    
    public partial class QRCode
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public QRCode()
        {
            this.QRHistories = new HashSet<QRHistory>();
            this.QRHistories1 = new HashSet<QRHistory>();
        }
    
        public int ID { get; set; }
        public Nullable<int> EventID { get; set; }
        public string Description { get; set; }
        public Nullable<int> AtivitityID { get; set; }
        public string WebURL { get; set; }
        public Nullable<System.DateTime> GeneratedON { get; set; }
        public Nullable<int> GeneratedBY { get; set; }
        public bool Status { get; set; }
        public string CodePath { get; set; }
        public Nullable<int> SponsorID { get; set; }
    
        public virtual Activite Activite { get; set; }
        public virtual Activite Activite1 { get; set; }
        public virtual Event Event { get; set; }
        public virtual Event Event1 { get; set; }
        public virtual Sponsor Sponsor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QRHistory> QRHistories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QRHistory> QRHistories1 { get; set; }
    }
}
