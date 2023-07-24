using MixMashter.Api.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MixMashter.Api.Models.Mappers
{
    internal static class Mappers
    {
        internal static User ToUser(this IDataRecord dataRecord)
        {
            // Convert the byte[] (Passwd) to a string
            var passwdBytes = (byte[])dataRecord["Passwd"];
            var passwd = Encoding.UTF8.GetString(passwdBytes);

            // Create the User object with the converted Passwd
            return new User(
                (int)dataRecord["Id"],
                (string)dataRecord["FirstName"],
                (string)dataRecord["LastName"],
                (string)dataRecord["UserName"],
                (string)dataRecord["Email"],
                (DateTime)dataRecord["BirthDate"],
                passwd
            );
        }
    }

}
