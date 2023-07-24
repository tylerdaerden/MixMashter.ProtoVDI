using MixMashter.Api.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tools.CQS.Queries;

namespace MixMashter.Api.Models.Queries
{
#nullable disable
    public class LoginQuery : IQueryDefinitions<User> 
    {
        public string UserName { get; init; }
        public string Email { get; init; }
        public string Password { get; init; }

        public LoginQuery(string userName, string email, string password)
        {
            UserName = userName;
            Email = email;
            Password = password;
        }

        //public LoginQuery(string email, string password)
        //{
        //    Email = email;
        //    Password = password;
        //}
    }
}
