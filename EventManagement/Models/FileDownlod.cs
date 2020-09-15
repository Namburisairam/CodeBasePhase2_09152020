using EventManagement.DataAccess.DataBase.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace EventManagement.Models
{
    public class FileDownlod
    {
        public List<FileInfo> GetFile(List<Photo>  eventphoto)
        {
            List<FileInfo> listFiles = new List<FileInfo>();
            //Path For download From Network Path.  
            string fileSavePath = System.Web.Hosting.HostingEnvironment.MapPath("~/ImageFile");
            DirectoryInfo dirInfo = new DirectoryInfo(fileSavePath);
            int i = 0;
            
            foreach (var item in eventphoto)
            {
                listFiles.Add(new FileInfo()
                {
                    FileId = i + 1,
                    FileName = item.URL,
                    FilePath = dirInfo.FullName + @"\" + item.URL  
                });
                i = i + 1;
            }
            return listFiles;
        }
    }
}