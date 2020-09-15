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
    
    public partial class Survey
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Survey()
        {
            this.Questions = new HashSet<Question>();
        }
    
        public int SurveyID { get; set; }
        public string SurveyName { get; set; }
        public string SurveyLevel { get; set; }
        public string SurveyDescription { get; set; }
        public Nullable<int> EventID { get; set; }
        public Nullable<int> ActivityID { get; set; }
        public Nullable<int> SurveyTemplateID { get; set; }
    
        public virtual Activite Activite { get; set; }
        public virtual TemplateSurvey TemplateSurvey { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Question> Questions { get; set; }
    }
}