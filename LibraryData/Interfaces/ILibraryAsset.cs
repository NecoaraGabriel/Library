using LibraryData.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace LibraryData
{
    public interface ILibraryAsset
    {
        IEnumerable<LibraryAsset> GetAllLibraryAssets();
        LibraryAsset GetById(int id);
        void Add(LibraryAsset newAsset);
        string GetDeweyIndex(int id);
        string GetAuthorOrDirector(int id);
        string GetType(int id);
        string GetISBN(int id);
        LibraryBranch GetLocation(int id);
        Status GetStatus(int id);
    }
}
