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
    
    public partial class Photo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Photo()
        {
            this.PhotoLikes = new HashSet<PhotoLike>();
        }
    
        public int ID { get; set; }
        public Nullable<int> EventID { get; set; }
        public string URL { get; set; }
        public Nullable<System.DateTime> UploadON { get; set; }
        public Nullable<int> UploadBY { get; set; }
        public string Description { get; set; }
        public bool Status { get; set; }
        public bool isSync { get; set; }
        public Nullable<int> AlbumID { get; set; }
        public bool isDeleted { get; set; }
    
        public virtual Event Event { get; set; }
        public virtual PhotoAlbum PhotoAlbum { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhotoLike> PhotoLikes { get; set; }
    }
}
