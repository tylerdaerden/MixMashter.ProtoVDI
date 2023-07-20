using MixMashter.Api.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MixMashter.Api.Models.Mappers
{
    internal static class DataRecordExtensions
    {
        internal static User ToUser(this IDataRecord dataRecord)
        {
            return new User((int)dataRecord["Id"],
            (string)dataRecord["FirstName"],
            (string)dataRecord["LastName"],
            (string)dataRecord["UserName"],
            (string)dataRecord["Email"],
            (string)dataRecord["BirthDate"]);
        }


    }
}
