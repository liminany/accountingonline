using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity.City
{
    public class EntiryCity
    {
        private int _sCityID = 0;
        private string _sCityName = string.Empty;
        private string _sCountryName = string.Empty;
        private int _bCityStatus = 0;
        private int _sAction = 0;
        private int _nCountry_FK_ID = 0;

        public int CityID
        {
            set { _sCityID = value; }
            get { return _sCityID; }
        }

        public int Country_FK_ID
        {
            set { _nCountry_FK_ID = value; }
            get { return _nCountry_FK_ID; }
        }

        public int Action
        {
            set { _sAction = value; }
            get { return _sAction; }
        }

        public string CityName
        {
            set { _sCityName = value; }
            get { return _sCityName; }
        }

        public string CountryName
        {
            set { _sCountryName = value; }
            get { return _sCountryName; }
        }

        public int CityStatus
        {
            set { _bCityStatus = value; }
            get { return _bCityStatus; }
        }
    }
}
