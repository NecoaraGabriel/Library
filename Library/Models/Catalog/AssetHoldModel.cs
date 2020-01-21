using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Library.Models.Catalog
{
    public class AssetHoldModel
    {
        public string PatronName { get; set; }
        public int LibraryCardId { get; set; }
        public DateTime HoldPlaced { get; set; }
    }
}
