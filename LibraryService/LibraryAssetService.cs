using LibraryData;
using LibraryData.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace LibraryService
{
    public class LibraryAssetService : ILibraryAsset
    {
        private LibraryContex _contex;

        public LibraryAssetService(LibraryContex contex)
        {
            this._contex = contex;
        }

        public void Add(LibraryAsset newAsset)
        {
            _contex.Add(newAsset);
            _contex.SaveChanges();
        }

        public IEnumerable<LibraryAsset> GetAllLibraryAssets()
        {
            return _contex.LibraryAssets
                .Include(assets => assets.Status)
                .Include(assets => assets.Location)
                ;
        }

        public LibraryAsset GetById(int id)
        {
            //if we dont find that id an null exception will raise if we use First()
            return GetAllLibraryAssets().FirstOrDefault(asset => asset.Id == id);
        }

        public string GetDeweyIndex(int id)
        {
            if(_contex.Books.Any(b => b.Id == id))
            {
                return _contex.Books.FirstOrDefault(book => book.Id == id).DeweyIndex;
            }
            return "";
        }

        public string GetAuthorOrDirector(int id)
        {
            var bookTitle = _contex.LibraryAssets.OfType<Book>()
                .FirstOrDefault(asset => asset.Id == id)?.Author;

            var videoDirector = _contex.LibraryAssets.OfType<Video>()
                .FirstOrDefault(asset => asset.Id == id)?.Director;

            return bookTitle ?? videoDirector;
        }

        public string GetType(int id)
        {
            var isVideo = _contex.LibraryAssets.OfType<Video>()
                .Where(asset => asset.Id == id).Any();
            return isVideo ? "Video" : "Book";
        }

        public string GetISBN(int id)
        {
            var book = _contex.LibraryAssets.OfType<Book>().FirstOrDefault(asset => asset.Id == id)?.ISBN;
            return book is null ? "" : book; 
        }

        public LibraryBranch GetLocation(int id)
        {
            return GetById(id).Location;
        }

        public Status GetStatus(int id)
        {
            return GetById(id).Status;
        }
    }
}
