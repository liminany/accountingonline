using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity.Country
{
    public class EntiryCountry
    {
        private int _nCountryID = 0;
        private string _sCountryName = string.Empty;
        private int _nCountryStatus = 0;
        private int _nAction = 0;

        public string CountryName
        {
            set {_sCountryName = value ;}
            get { return _sCountryName; }
        }

        public int CountryStatus
        {
            set { _nCountryStatus = value; }
            get { return _nCountryStatus; }
        }

        public int Action
        {
            set { _nAction = value; }
            get { return _nAction; }
        }

        public int CountryID
        {
            set { _nCountryID = value; }
            get { return _nCountryID; }
        }
    }
}
