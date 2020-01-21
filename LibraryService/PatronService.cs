using LibraryData;
using LibraryData.Interfaces;
using LibraryData.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace LibraryService
{
    public class PatronService : IPatron
    {
        private LibraryContex _contex;

        public PatronService(LibraryContex contex)
        {
            _contex = contex;
        }
        public void Add(Patron patron)
        {
            _contex.Add(patron);
            _contex.SaveChanges();
        }

        public Patron Get(int id)
        {
            return GetAll().FirstOrDefault(x => x.Id == id);
        }

        public IEnumerable<Patron> GetAll()
        {
            return _contex.Patrons
                .Include(x => x.LibraryCard)
                .Include(x => x.LibraryBranch);
        }

        public IEnumerable<CheckoutHistory> GetCheckoutHistory(int patronId)
        {
            Patron patron = Get(patronId);
            return _contex.CheckoutHistories
                .Include(x=> x.LibraryCard)
                .Include(x => x.LibraryAsset)
                .Where(x=> x.LibraryCard.Id == patron.LibraryCard.Id)
                .OrderByDescending(y => y.CheckOut);
        }

        public IEnumerable<Checkout> GetCheckouts(int patronId)
        {
            Patron patron = Get(patronId);
            return _contex.Checkouts
                .Include(x => x.LibraryCard)
                .Include(x => x.LibraryAsset)
                .Where(x => x.LibraryCard.Id == patron.LibraryCard.Id)
                .OrderByDescending(y => y.Since);
        }

        public IEnumerable<Hold> GetHolds(int patronId)
        {
            Patron patron = Get(patronId);
            return _contex.Holds
                .Include(x => x.LibraryCard)
                .Include(x => x.LibraryAsset)
                .Where(x => x.LibraryCard.Id == patron.LibraryCard.Id)
                .OrderByDescending(y => y.HoldPlaced);
        }
    }
}
