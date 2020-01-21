using LibraryData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Library.Models.Catalog
{
    public class CheckoutHistoryModel
    {
        public DateTime Checkout { get; set; }
        public DateTime CheckIn { get; set; }
        public LibraryCard LibraryCard { get; set; }
        public string PatronName { get; set; }
    }
}
