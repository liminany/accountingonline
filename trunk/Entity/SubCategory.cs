using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class SubCategory
    {
        private int _sSubCategoryID = 0;
        private string _SubCategoryName = string.Empty;
        private int _CategoryID_FK = 0;
        private int _SubCategoryStatus = 0;


        public int SubCategoryID
        {
            set { _sSubCategoryID = value; }
            get { return _sSubCategoryID; }
        }

        public string SubCategoryName
        {
            set { _SubCategoryName = value; }
            get { return _SubCategoryName; }
        }

        public int CategoryID_FK
        {
            set { _CategoryID_FK = value; }
            get { return _CategoryID_FK; }
        }

        public int SubCategoryStatus
        {
            set { _SubCategoryStatus = value; }
            get { return _SubCategoryStatus; }
        }

    }
}
