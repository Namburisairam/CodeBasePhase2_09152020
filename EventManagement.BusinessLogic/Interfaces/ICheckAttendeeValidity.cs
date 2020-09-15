using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BusinessLogic.Interfaces
{
    public interface IEntityValidity<T>
    {
        Expression<Func<T, bool>> CheckValidity { get; }
    }
}
