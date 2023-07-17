using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tools.CQS.Queries
{
    public interface IQueryHandler<TQuery,TResult>
        where TQuery : class, IQueryDefinitions<TResult>
    {
        TResult Execute(TQuery query);

    }
}
