using LibraryData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Library.Models.Catalog
{
    public class AssetDetailModel
    {
        public int Id { get; set; }
        public string ImageUrl { get; set; }
        public string Title { get; set; }
        public int Year { get; set; }
        public string ISBN { get; set; }
        public decimal Cost { get; set; }
        public string Status { get; set; }
        public string CurrentLocation { get; set; }
        public string PatronName { get; set; }
        public string Type { get; set; }
        public string AuthorOrDirector { get; set; }
        public string DeweyIndex { get; set; }
        public int NumberOfCopies { get; set; }

        public IEnumerable<CheckoutHistoryModel> CheckoutHistories { get; set; }
        public IEnumerable<AssetHoldModel> CurrentHolds { get; set; }

    }
}
