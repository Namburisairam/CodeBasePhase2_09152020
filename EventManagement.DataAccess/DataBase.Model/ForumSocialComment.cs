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
    
    public partial class ForumSocialComment
    {
        public int ID { get; set; }
        public int PostID { get; set; }
        public int AttendesID { get; set; }
        public Nullable<System.DateTime> ApprovedON { get; set; }
        public Nullable<int> ApprovedBY { get; set; }
        public Nullable<System.DateTime> CommentedON { get; set; }
        public string Comment { get; set; }
    
        public virtual Attende Attende { get; set; }
        public virtual Attende Attende1 { get; set; }
        public virtual SocialForum SocialForum { get; set; }
        public virtual SocialForum SocialForum1 { get; set; }
    }
}
