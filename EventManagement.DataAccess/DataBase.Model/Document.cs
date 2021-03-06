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
    
    public partial class Document
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Document()
        {
            this.DocumentFavourites = new HashSet<DocumentFavourite>();
        }
    
        public int ID { get; set; }
        public string FilePath { get; set; }
        public Nullable<int> ActivityID { get; set; }
        public Nullable<int> sponsorID { get; set; }
        public Nullable<int> exhibitorID { get; set; }
        public Nullable<int> EventID { get; set; }
        public string DocumentName { get; set; }
        public Nullable<int> AttendeeID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DocumentFavourite> DocumentFavourites { get; set; }
        public virtual Event Event { get; set; }
        public virtual Exhibitor Exhibitor { get; set; }
        public virtual Sponsor Sponsor { get; set; }
        public virtual Activite Activite { get; set; }
        public virtual Attende Attende { get; set; }
    }
}
