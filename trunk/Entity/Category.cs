using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class Category
    {
        private int _sCategoryID = 0;
        private string _CategoryName = string.Empty;
        private int _CategoryStatus = 0;


        public int CategoryID
        {
            set { _sCategoryID = value; }
            get { return _sCategoryID; }
        }

        public string CategoryName
        {
            set { _CategoryName = value; }
            get { return _CategoryName; }
        }

        public int CategoryStatus
        {
            set { _CategoryStatus = value; }
            get { return _CategoryStatus; }
        }

    }
}
