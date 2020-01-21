using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LibraryData.Models
{
    public interface ICheckout
    {
        IEnumerable<Checkout> GetAll();
        Checkout GetById(int id);
        void Add(Checkout newCheckout);
        void CheckOutItem(int assetId, int libraryCardId);
        void CheckInItem(int assetId);
        IEnumerable<CheckoutHistory> CheckoutHistory(int assetId);
        Checkout GetLastCheckOut(int assetId);

        void PlaceHold(int assetId, int libraryCardId);
        IEnumerable<Hold> GetCurrentHolds(int assetId);

        void MarkLost(int assetId);
        void MarkFound(int assetId);

        void UpdateAssetStatus(int assetId, string Status);
        void UpdateNrOfCopies(int assetId);
        void UpdateCheckoutHistory(int assetId);
        void RemoveExistingCheckout(int assetId);
        void CheckOutToEarliestHold(int assetId, IQueryable<Hold> currentHolds);
        LibraryCard GetLibraryCard(int libraryCardId);
        Patron GetPatronName(int libraryCard);
        bool IsCheckedOut(int assetId);
    }
}
