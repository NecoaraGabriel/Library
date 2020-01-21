using LibraryData.Models;
using System;
using System.Collections.Generic;

namespace Library.Models.Patron
{
    public class PatronDetailModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName 
        { 
            get {
                return LastName + ' ' + FirstName;
            }
            set { this.FullName = value; }
        }
        public DateTime DateOfBirth { get; set; }
        public IEnumerable<LibraryData.Models.Checkout> AssetsCheckouts { get; set; }
        public IEnumerable<CheckoutHistory> CheckoutHistories { get; set; }
        public IEnumerable<Hold> Holds { get; set; }

    }
}
