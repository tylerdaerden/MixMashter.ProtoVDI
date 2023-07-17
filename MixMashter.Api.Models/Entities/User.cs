using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MixMashter.Api.Models.Entities
{
#nullable disable
    public class User
    {

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Birthdate { get;set; }

        public User(int id, string firstName, string lastName, string email, string birthdate)
        {
            Id = id;
            FirstName = firstName;
            LastName = lastName;
            Email = email;
            Birthdate = birthdate;
        }
    }
}

