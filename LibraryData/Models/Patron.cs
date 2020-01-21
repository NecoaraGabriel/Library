using System;
using System.Collections.Generic;
using System.Text;

namespace LibraryData.Models
{
    public class Patron
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string PhoneNumber { get; set; }

        /**
         * Use virtual keyword when you want to lazy load the property's data. 
         * Lazy loading loads a collections from the database the frist time is accesed.
         */
        public virtual LibraryCard LibraryCard { get; set; }
        public virtual LibraryBranch LibraryBranch { get; set; }

        public override string ToString()
        {
            return $"{LastName} {FirstName}";
        }
    }
}
