using Library.Models.Patron;
using LibraryData.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Library.Controllers
{
    public class PatronController : Controller
    {
        private IPatron _patron;
        public PatronController(IPatron patron)
        {
            _patron = patron;
        }

        public IActionResult Index()
        {
            var patrons = _patron.GetAll();

            var patronModels = patrons.Select(p => new PatronDetailModel
            {
                Id = p.Id,
                FirstName = p.FirstName,
                LastName = p.LastName,
                DateOfBirth = p.DateOfBirth,
                Holds = _patron.GetHolds(p.Id),
                CheckoutHistories = _patron.GetCheckoutHistory(p.Id),
                AssetsCheckouts = _patron.GetCheckouts(p.Id)
            });

            var model = new PatronIndexModel()
            {
                patronDetailModels = patronModels
            };

            return View(model);
        }
    }
}
