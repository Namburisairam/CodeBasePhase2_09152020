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
    
    public partial class TextChat
    {
        public int ID { get; set; }
        public Nullable<int> SenderID { get; set; }
        public Nullable<int> ReceiverID { get; set; }
        public bool IsGroup { get; set; }
        public Nullable<int> GroupID { get; set; }
        public string TextMessage { get; set; }
        public Nullable<System.DateTime> Createdate { get; set; }
        public Nullable<bool> Responded { get; set; }
        public Nullable<int> ChannelID { get; set; }
    
        public virtual Attende Attende { get; set; }
        public virtual Attende Attende1 { get; set; }
        public virtual ChatChannel ChatChannel { get; set; }
        public virtual GroupInfo GroupInfo { get; set; }
    }
}
