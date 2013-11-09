using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class AdsManager
    {
        private int _nAdsID = 0;
        private int _nUserID = 0;
        private int _nCatID = 0;
        private int _nSubCatID = 0;
        private int _nCountryID = 0;
        private int _nCityID = 0;
        private double _nAdsPrice = 0;
        private string _sAdsTitle = string.Empty;
        private string _sAdsDescription = string.Empty;
        private DateTime _dtCreateDate;
        private DateTime _dtUpdateCreateDate;//reActivate Ads
        private int _nAdsStatus = 0;
        private string _sAdsImages = string.Empty;
        private int _nAdsHit = 0;
        private string _sAdsYouTubeURL = string.Empty;


        public int AdsID
        {
            get { return _nAdsID; }
            set { _nAdsID = value; }
        }
        public int UserID
        {
            get { return _nUserID; }
            set { _nUserID = value; }
        }
        public int CatID
        {
            get { return _nCatID; }
            set { _nCatID = value; }
        }
        public int SubCatID
        {
            get { return _nSubCatID; }
            set { _nSubCatID = value; }
        }
        public int CountryID
        {
            get { return _nCountryID; }
            set { _nCountryID = value; }
        }
        public int CityID
        {
            get { return _nCityID; }
            set { _nCityID = value; }
        }
        public double AdsPrice
        {
            get { return _nAdsPrice; }
            set { _nAdsPrice = value; }
        }
        public string AdsTitle
        {
            get { return _sAdsTitle; }
            set { _sAdsTitle = value; }
        }
        public string AdsDescription
        {
            get { return _sAdsDescription; }
            set { _sAdsDescription = value; }
        }
        public DateTime AdsCreateDate
        {
            get { return _dtCreateDate; }
            set { _dtCreateDate = value; }
        }
        public DateTime AdsUpdateCreateDate
        {
            get { return _dtUpdateCreateDate; }
            set { _dtUpdateCreateDate = value; }
        }
        public int AdsStatus
        {
            get { return _nAdsStatus; }
            set { _nAdsStatus = value; }
        }
        public string AdsImages
        {
            get { return _sAdsImages; }
            set { _sAdsImages = value; }
        }
        public int AdsHit
        {
            get { return _nAdsHit; }
            set { _nAdsHit = value; }
        }
        public string AdsYouTubeURL
        {
            get { return _sAdsYouTubeURL; }
            set { _sAdsYouTubeURL = value; }
        }
    }
}
