using LibraryData;
using LibraryData.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LibraryService
{
    public class CheckoutService : ICheckout
    {
        private LibraryContex _contex;
        private LibraryAssetService assetService;
        private int DefaultCheckoutDays = 20;
        DateTime dtNow = DateTime.Now.Date;

        public CheckoutService(LibraryContex contex)
        {
            this._contex = contex;
            this.assetService = new LibraryAssetService(contex);
        }

        public void Add(Checkout newCheckout)
        {
            _contex.Add(newCheckout);
            _contex.SaveChanges();
        }


        public IEnumerable<CheckoutHistory> CheckoutHistory(int assetId)
        {
            return _contex.CheckoutHistories
                .Include(h => h.LibraryAsset)
                .Include(h => h.LibraryCard)
                .Where(asset => asset.LibraryAsset.Id == assetId);
        }

        public IEnumerable<Checkout> GetAll()
        {
            return _contex.Checkouts;
        }

        public Checkout GetById(int id)
        {
            return GetAll().FirstOrDefault(checkout => checkout.Id == id);
        }

        public IEnumerable<Hold> GetCurrentHolds(int assetId)
        {
            return _contex.Holds
                .Include(h => h.LibraryAsset)
                .Include(h => h.LibraryCard)
                .Where(hold => hold.LibraryAsset.Id == assetId);
        }

        public Checkout GetLastCheckOut(int assetId)
        {
            return _contex.Checkouts
                .Include(h => h.LibraryAsset)
                .Where(asset => asset.Id == assetId)
                .OrderByDescending(item => item.Since)
                .FirstOrDefault();
        }

        public void MarkFound(int assetId)
        {
            UpdateAssetStatus(assetId, "Available");
            //remove any checkouts on that item
            RemoveExistingCheckout(assetId);
            UpdateCheckoutHistory(assetId);

            _contex.SaveChanges();
        }

        public void MarkLost(int assetId)
        {
            UpdateAssetStatus(assetId, "Lost");
            _contex.SaveChanges();
        }

        public void CheckInItem(int assetId)
        {
            var item = assetService.GetById(assetId);

            RemoveExistingCheckout(assetId);
            UpdateCheckoutHistory(assetId);

            var currentHolds = _contex.Holds
                .Include(x => x.LibraryAsset)
                .Include(y => y.LibraryCard);
            
            //get item by id
            //remove any existing checkout on the item
            //remove any existing checkout history on the item
            //Check hold for the item, and checkout to the oldest hold
            //if no hold on the item is found mark item has available
            if (currentHolds.Any())
            {
                CheckOutToEarliestHold(assetId, currentHolds);
            }
            else
            {
                UpdateAssetStatus(assetId, "Available");
            }

            _contex.SaveChanges();
        }

        public void CheckOutItem(int assetId, int libraryCardId)
        {
           //check for an item is has been already checkedout
           if (IsCheckedOut(assetId))
           {
                return;
           }

            //UpdateNrOfCopies(assetId);
            UpdateAssetStatus(assetId, "Checked Out");

            var item = assetService.GetById(assetId);
            var libraryCard = GetLibraryCard(libraryCardId);

            var checkout = new Checkout
            {
                LibraryAsset = item,
                LibraryCard = libraryCard,
                Since = dtNow,
                Until = GetDefaultCheckInTime()
            };

            var checkoutHistory = new CheckoutHistory
            {
                CheckIn = GetDefaultCheckInTime(),
                CheckOut = dtNow,
                LibraryAsset = item,
                LibraryCard = libraryCard
            };

            _contex.Add(checkout);
            _contex.Add(checkoutHistory);
            _contex.SaveChanges();
        }  

        public void PlaceHold(int assetId, int libraryCardId)
        {
            var item = assetService.GetById(assetId);
            var libraryCard = GetLibraryCard(libraryCardId);

            //CHECK if user already has a hold on that book
            //if()
            //UpdateAssetStatus(assetId, "Available");
            var hold = new Hold
            {
                LibraryAsset = item,
                LibraryCard = libraryCard,
                HoldPlaced = dtNow.Date
            };

            _contex.Add(hold);
            _contex.SaveChanges();
        }

        public void UpdateAssetStatus(int assetId, string Status)
        {
            var item = assetService.GetById(assetId);
            _contex.Update(item);

            item.Status = _contex.Statuses.FirstOrDefault(x => x.Name == Status);
        }

        public void UpdateNrOfCopies(int assetId)
        {
            var item = assetService.GetById(assetId);
            _contex.Update(item);

            if (item.NumberOfCopies > 0)
            {
                item.NumberOfCopies -= 1;
            }
            
        }

        public void UpdateCheckoutHistory(int assetId)
        {
            var checkoutHistory = _contex.CheckoutHistories.FirstOrDefault(x => x.LibraryAsset.Id == assetId && x.CheckIn == GetDefaultCheckInTime());

            if (checkoutHistory != null)
            {
                _contex.Update(checkoutHistory);
                checkoutHistory.CheckIn = DateTime.Now;
            }
        }

        public void RemoveExistingCheckout(int assetId)
        {
            var checkout = _contex.Checkouts.FirstOrDefault(p => p.LibraryAsset.Id == assetId);

            if (checkout != null)
            {
                _contex.Remove(checkout);
            }
        }

        public void CheckOutToEarliestHold(int assetId, IQueryable<Hold> currentHolds)
        {
            var hold = currentHolds.OrderBy(x => x.HoldPlaced).FirstOrDefault();
            var card = hold.LibraryCard;

            _contex.Remove(hold);
            _contex.SaveChanges();
            CheckOutItem(assetId, card.Id);
        }

        public DateTime GetDefaultCheckInTime()
        {
            //switch time base on asset type
            return DateTime.MinValue;
        }

        public bool IsCheckedOut(int assetId)
        {
            return assetService.GetById(assetId)?.NumberOfCopies < 1 ? true : false;
        }

        public LibraryCard GetLibraryCard(int libraryCardId)
        {
            return _contex.LibraryCards
                .Include(h => h.Checkouts)
                .FirstOrDefault(card => card.Id == libraryCardId); 
        }

        public Patron GetPatronName(int libraryCard)
        {
            return _contex.Patrons.FirstOrDefault(card => card.Id == libraryCard);
        }
    }
}
