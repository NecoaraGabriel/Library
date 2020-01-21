using Library.Models.Catalog;
using Library.Models.Checkout;
using LibraryData;
using LibraryData.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Library.Controllers
{
    public class CatalogController : Controller
    {
        private ILibraryAsset _assets;
        private ICheckout _checkout;

        public CatalogController(ILibraryAsset libraryAsset, ICheckout checkout)
        {
            this._assets = libraryAsset;
            this._checkout = checkout;
        }

        public IActionResult Index()
        {
            var assetModel = _assets.GetAllLibraryAssets();

            var displayAssets = assetModel
                .Select(result => new AssetIndexListingModel
                {
                    Id = result.Id,
                    ImageUrl = result.ImgUrl,
                    Title = result.Title,
                    AuthorOrDirector = _assets.GetAuthorOrDirector(result.Id),
                    DeweyIndex = _assets.GetDeweyIndex(result.Id),
                    NumberOfCopies = result.NumberOfCopies,
                    Type = _assets.GetType(result.Id)
                });

            var model = new AssetIndexModel()
            {
                Assets = displayAssets
            };

            return View(model);

        }

        public IActionResult Detail(int id)
        {
            var asset = _assets.GetById(id);


            IEnumerable<AssetHoldModel> currentHolds = _checkout.GetCurrentHolds(id)
                .Select(x => new AssetHoldModel
                {
                    PatronName = _checkout.GetPatronName(x.LibraryCard.Id).ToString(),
                    HoldPlaced = x.HoldPlaced,
                    LibraryCardId = x.LibraryCard.Id
                });

            IEnumerable<CheckoutHistoryModel> checkoutHistories = _checkout.CheckoutHistory(asset.Id)
                .Select(x => new CheckoutHistoryModel
                {
                    PatronName = _checkout.GetPatronName(x.LibraryCard.Id).ToString(),
                    CheckIn = x.CheckIn,
                    Checkout = x.CheckOut,
                    LibraryCard = x.LibraryCard
                });

          
            var displayAsset = new AssetDetailModel
            {
                Id = asset.Id,
                PatronName = _checkout.GetPatronName(4).FirstName,
                ImageUrl = asset.ImgUrl,
                Title = asset.Title,
                Year = asset.Year,
                Cost = asset.Cost,
                Status = _assets.GetStatus(asset.Id).Name,
                AuthorOrDirector = _assets.GetAuthorOrDirector(asset.Id),
                DeweyIndex = _assets.GetDeweyIndex(asset.Id),
                NumberOfCopies = asset.NumberOfCopies,
                Type = _assets.GetType(asset.Id),
                CurrentLocation = _assets.GetLocation(asset.Id).Name,
                ISBN = _assets.GetISBN(id),
                CheckoutHistories = checkoutHistories,
                CurrentHolds = currentHolds
            };

            return View(displayAsset);
        }

        public IActionResult Checkout(int id)
        {
            var asset = _assets.GetById(id);

            var model = new CheckoutModel
            {
                AssetId = asset.Id,
                Title = asset.Title,
                ImageUrl = asset.ImgUrl,
                LibraryCardId = "",
                HoldCount = _checkout.CheckoutHistory(id).Count(),
                IsCheckedOut = _checkout.IsCheckedOut(id)
            };

            return View(model);
        }

        public IActionResult Hold(int id)
        {
            var asset = _assets.GetById(id);

            var model = new CheckoutModel
            {
                AssetId = asset.Id,
                Title = asset.Title,
                ImageUrl = asset.ImgUrl,
                LibraryCardId = "",
                HoldCount = _checkout.GetCurrentHolds(id).Count(),
                IsCheckedOut = _checkout.IsCheckedOut(id)
            };

            return View(model);

        }

        public IActionResult CheckInItem(int id)
        {
            _checkout.CheckInItem(id);
            return RedirectToAction("Detail", new { id = id });

        }

        [HttpPost]
        public IActionResult PlaceCheckout(int assetId, int libraryCardId)
        {
            _checkout.CheckOutItem(assetId, libraryCardId);
            return RedirectToAction("Detail", new { id = assetId });
        }

        [HttpPost]
        public IActionResult PlaceHold(int assetId, int libraryCardId)
        {
            _checkout.PlaceHold(assetId, libraryCardId);
            return RedirectToAction("Detail", new { id = assetId });
        }

        public IActionResult MarkLost(int assetId)
        {
            _checkout.MarkLost(assetId);
            return RedirectToAction("Detail", new { id = assetId });
        }

        public IActionResult MarkFound(int assetId)
        {
            _checkout.MarkFound(assetId);
            return RedirectToAction("Detail", new { id = assetId });
        }
    }
}
