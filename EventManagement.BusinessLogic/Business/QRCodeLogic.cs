using EventManagement.BusinessLogic.BussinessBase;
using EventManagement.DataAccess.DataBase.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
namespace EventManagement.BusinessLogic.Business
{
    public class QRCodeLogic : BaseLogic
    {
        public async Task<object> RecordQRCodeScanHistory(int attendeeId, int qrId)
        {
            Db.QRHistories.Add(new QRHistory
            {
                AttendesID = attendeeId,
                QRid = qrId,
                CommentON = DateTime.Now
            });
            await Db.SaveChangesAsync();
            return new { Message = "Success" };
        }

        public async Task<object> GetAttendeScanHistory(int attendeeId)
        {
            return await Db.QRHistories.Where(x => x.AttendesID == attendeeId)
                    .Select(x => new
                    {
                        x.CommentON,
                        x.QRCode.WebURL,
                    }).ToListAsync();
        }
    }
}
