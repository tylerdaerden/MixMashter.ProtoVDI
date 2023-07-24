using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MixMashter.Api.Models.Entities
{
#nullable disable
    public class User
    {
        public int Id { get; init; }
        public string FirstName { get; init; }
        public string LastName { get; init; }
        public string UserName { get; init; }
        public string Email { get; init; }
        public DateTime Birthdate { get; init; }
        public string Password { get; internal set; }


        public User(int id, string firstName, string lastName, string userName, string email, DateTime birthdate, string password)
        {
            Id = id;
            FirstName = firstName;
            LastName = lastName;
            UserName = userName;
            Email = email;
            Birthdate = birthdate;
            Password = password;
        }

        public User(string userName, string email , string password)
        {
            UserName = userName;
            Email = email;
            Password = password;
        }

    }
}

