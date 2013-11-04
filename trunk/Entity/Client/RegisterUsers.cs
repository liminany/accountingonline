using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class EntityRegUsers
    {
        private int _sUserID = 0;
        private string _sUserFullName = string.Empty;
        private string _sUserEmailAddress = string.Empty;
        private string _sUserPassword = string.Empty;
        private string _sFacebookID = string.Empty;
        private int _nUserStatus = 0;
        private int _nUserType = 0;
        private int _nCountAds = 0;
        private int _nCountAdsUsed = 0;
        private string _sUserMobileNumber = string.Empty;
        private int _nCountryAddress = 0;
        private int _nCityAddress = 0;
        private string _sUserImage = string.Empty;
        private DateTime _dtCreateDateTime = new DateTime();

        public int UserID
        {
            set { _sUserID = value; }
            get { return _sUserID; }
        }

        public string UserFullName
        {
            set { _sUserFullName = value; }
            get { return _sUserFullName; }
        }

        public string UserEmailAddress
        {
            set { _sUserEmailAddress = value; }
            get { return _sUserEmailAddress; }
        }

        public string UserPassword
        {
            set { _sUserPassword = value; }
            get { return _sUserPassword; }
        }

        public string UserFacebookID
        {
            set { _sFacebookID = value; }
            get { return _sFacebookID; }
        }

        public int UserStatus
        {
            set { _nUserStatus = value; }
            get { return _nUserStatus; }
        }

        public int UserType
        {
            set { _nUserType = value; }
            get { return _nUserType; }
        }

        public int UserCountAds
        {
            set { _nCountAds = value; }
            get { return _nCountAds; }
        }

        public int CountAdsUsed
        {
            set { _nCountAdsUsed = value; }
            get { return _nCountAdsUsed; }
        }


        public string UserMobileNumber
        {
            set { _sUserMobileNumber = value; }
            get { return _sUserMobileNumber; }
        }

        public int UserCountry
        {
            set { _nCountryAddress = value; }
            get { return _nCountryAddress; }
        }

        public int UserCityAddress
        {
            set { _nCityAddress = value; }
            get { return _nCityAddress; }
        }

        public string UserImage
        {
            set { _sUserImage = value; }
            get { return _sUserImage; }
        }
        public DateTime CreateDateTime
        {
            set { _dtCreateDateTime = value; }
            get { return _dtCreateDateTime; }
        }

    }
}
