using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DALC4NET;
using NLog;
using Entity;
using System.Data;

namespace DAL
{
    public class DBAdsManager
    {
        #region Variables
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;
        #endregion

        #region Constacter
        public DBAdsManager()
        {
            _dbHelper = DBHelper.GetInstance();
        }
        #endregion

        #region Methods


        public int InsertNewAds(AdsManager objAdsManager)
        {
            try
            {
                IDbCommand command = null;
                object retValue = null;

                DBParameter param1 = new DBParameter("@userID", objAdsManager.UserID);
                DBParameter param2 = new DBParameter("@catID", objAdsManager.CatID);
                DBParameter param3 = new DBParameter("@subCatID", objAdsManager.SubCatID);
                DBParameter param4 = new DBParameter("@countryID", objAdsManager.CountryID);
                DBParameter param5 = new DBParameter("@cityID", objAdsManager.CityID);
                DBParameter param6 = new DBParameter("@adsPrice", objAdsManager.AdsPrice);
                DBParameter param7 = new DBParameter("@adsTitle", objAdsManager.AdsTitle);
                DBParameter param8 = new DBParameter("@adsDescription", objAdsManager.AdsDescription);
                DBParameter param9 = new DBParameter("@adsImages", objAdsManager.AdsImages);
                DBParameter param10 = new DBParameter("@adsYoutubeURL", objAdsManager.AdsYouTubeURL);
                DBParameter param11 = new DBParameter("@adsUpdateDate", objAdsManager.AdsUpdateCreateDate);
                DBParameter returnValue = new DBParameter("@LastAdsID", 0, DbType.Int32, ParameterDirection.ReturnValue);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param5);
                paramCollection.Add(param6);
                paramCollection.Add(param7);
                paramCollection.Add(param8);
                paramCollection.Add(param9);
                paramCollection.Add(param10);
                paramCollection.Add(param11);
                paramCollection.Add(returnValue);
                command = _dbHelper.GetCommand("sp_InsertAds", paramCollection, CommandType.StoredProcedure);
                command.ExecuteNonQuery();
                retValue = _dbHelper.GetParameterValue(11, command);
                return Convert.ToInt32(retValue);

            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::InsertNewAds:::" + ex.Message);
                return 0;
                throw;
            }
        }

        public int EditAds(AdsManager objAdsManager)
        {
            int retValue = 0;
            try
            {  
                DBParameter param1 = new DBParameter("@userID", objAdsManager.UserID);
                DBParameter param2 = new DBParameter("@catID", objAdsManager.CatID);
                DBParameter param3 = new DBParameter("@subCatID", objAdsManager.SubCatID);
                DBParameter param4 = new DBParameter("@countryID", objAdsManager.CountryID);
                DBParameter param5 = new DBParameter("@cityID", objAdsManager.CityID);
                DBParameter param6 = new DBParameter("@adsPrice", objAdsManager.AdsPrice);
                DBParameter param7 = new DBParameter("@adsTitle", objAdsManager.AdsTitle);
                DBParameter param8 = new DBParameter("@adsDescription", objAdsManager.AdsDescription);
                DBParameter param9 = new DBParameter("@adsImages", objAdsManager.AdsImages);
                DBParameter param10 = new DBParameter("@adsYoutubeURL", objAdsManager.AdsYouTubeURL);
                DBParameter param11 = new DBParameter("@adsID", objAdsManager.AdsID);
                DBParameter returnValue = new DBParameter("@LastAdsID", 0, DbType.Int32, ParameterDirection.ReturnValue);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param5);
                paramCollection.Add(param6);
                paramCollection.Add(param7);
                paramCollection.Add(param8);
                paramCollection.Add(param9);
                paramCollection.Add(param10);
                paramCollection.Add(param11);
                paramCollection.Add(returnValue);  
                retValue = _dbHelper.ExecuteNonQuery("sp_EditAds", paramCollection, CommandType.StoredProcedure);
                return retValue;

            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::EditAds:::" + ex.Message);
                return 0;
                throw;
            }
        }

        public DataSet GetAllPenddingAds()
        {
            try
            {
                DataSet dsReturnAllUserMessage = _dbHelper.ExecuteDataSet("sp_GetAllPenddingAds", CommandType.StoredProcedure);
                return dsReturnAllUserMessage;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::GetAllPenddingAds:::" + ex.Message);
                throw;
            }
        }

        public DataSet GetAllApprovedAds()
        {
            try
            {
                DataSet dsReturnAllUserMessage = _dbHelper.ExecuteDataSet("sp_GetAllApprovedAds", CommandType.StoredProcedure);
                return dsReturnAllUserMessage;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::GetAllApprovedAds:::" + ex.Message);
                throw;
            }
        }

        public AdsManager GetAdsInfoByAdsID(int nAdsID)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            AdsManager objAdsManager = new AdsManager();
            try
            {
                DBParameter param1 = new DBParameter("@adsID", nAdsID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                reader = _dbHelper.ExecuteDataReader("sp_GetAdsInfoByAdsID", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objAdsManager.AdsTitle = reader["AdsTitle"].ToString();
                    objAdsManager.AdsDescription = reader["AdsDescription"].ToString();
                    objAdsManager.AdsImages = reader["AdsImages"].ToString();
                    objAdsManager.AdsYouTubeURL = reader["AdsYoutubeURL"].ToString();
                }
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::GetAdsInfoByAdsID:::" + ex.Message);
                objAdsManager = null;
                throw;
            }
            return objAdsManager;
        }

        public DataSet GetAdsInformationByAdsID(int nAdsID)
        {
            try
            {
                DBParameter param1 = new DBParameter("@adsID", nAdsID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetAdsInformationByAdsID", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::GetAdsInformationByAdsID:::" + ex.Message);
                throw;
            }
        }

        public DataSet GetAllMyAdsByUserID(int nUserID)
        {
            try
            {
                DBParameter param1 = new DBParameter("@userID", nUserID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetAllMyAdsByUserID", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::GetAllMyAdsByUserID:::" + ex.Message);
                throw;
            }
        }

        public DataSet GetSimlirAdsTen(int nSubCat, int countryCode)
        {
            try
            {
                DBParameter param1 = new DBParameter("@adsSubCat", nSubCat);
                DBParameter param2 = new DBParameter("@countryCode", countryCode);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetSimlirAdsTen", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::GetSimlirAdsTen:::" + ex.Message);
                throw;
            }
        }

        public DataSet GetAdsCategoiresByCatID(int nSubCat, int nCountryID)
        {
            try
            {
                DBParameter param1 = new DBParameter("@adsSubCat", nSubCat);
                DBParameter param2 = new DBParameter("@countryID", nCountryID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2); 
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetAdsCategoiresByCatIDTop", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::GetAdsCategoiresByCatID:::" + ex.Message);
                throw;
            }
        }

        public DataSet GetAdsMainCategoiresByCatID(int nCat, int countryID)
        {
            try
            {
                DBParameter param1 = new DBParameter("@adsCat", nCat);
                DBParameter param2 = new DBParameter("@countryID", countryID);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetMainAdsCategoiresByCatID", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::GetAdsMainCategoiresByCatID:::" + ex.Message);
                throw;
            }
        }

        public DataSet GetUserProfileAds(int nUserID)
        {
            try
            {
                DBParameter param1 = new DBParameter("userID", nUserID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetUserProfileAds", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::GetUserProfileAds:::" + ex.Message);
                throw;
            }
        }

        public DataSet GetDashbaordAds(int countryID)
        {
            try
            {
                DBParameter param1 = new DBParameter("@countryCode", countryID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetDashbaordAds", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::GetDashbaordAds:::" + ex.Message);
                throw;
            }
        }

        public DataSet ArabiSkySearch(int countryID, 
            int nSearchID, 
            string sSearchText, 
            int nSubCatID, 
            int nCityID, 
            string sBrand1, 
            string sBrand2, 
            int nCatID,
            int nPriceForm,
            int nPriceTo)
        {
            try
            {
                DBParameter param1 = new DBParameter("@countryID", countryID);
                DBParameter param2 = new DBParameter("@searchID", nSearchID);
                DBParameter param3 = new DBParameter("@searchText", sSearchText);
                DBParameter param4 = new DBParameter("@subCatID", nSubCatID);
                DBParameter param5 = new DBParameter("@cityID", nCityID);

                DBParameter param6 = new DBParameter("@brand_1", sBrand1);
                DBParameter param7 = new DBParameter("@brand_2", sBrand2);


                DBParameter param8 = new DBParameter("@catID", nCatID);
                DBParameter param9 = new DBParameter("@priceFrom", nPriceForm);
                DBParameter param10 = new DBParameter("@priceTo", nPriceTo);


                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param5);
                paramCollection.Add(param6);
                paramCollection.Add(param7);
                paramCollection.Add(param8);
                paramCollection.Add(param9);
                paramCollection.Add(param10);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_ArabiSkySearch", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::ArabiSkySearch:::" + ex.Message);
                throw;
            }
        }

        public int DeleteAdsAndRejected(int nAdsID)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@adsID", nAdsID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_RejectedAds", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::DeleteAdsAndRejected:::" + ex.Message);
                return 0;
            }
        }

        public int AdsHaveIssues(int nAdsID)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@adsID", nAdsID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_AdsHaveIssues", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::AdsHaveIssues:::" + ex.Message);
                return 0;
            }
        }


        public int ApprovedAds(int nAdsID)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@adsID", nAdsID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ApprovedAds", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::ApprovedAds:::" + ex.Message);
                return 0;
            }
        }

        public int EditAdsCounter(int nAdsID, int nAdsHit)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@adsID", nAdsID);
                DBParameter param2 = new DBParameter("@adsHit", nAdsHit);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_EditAdsCounter", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::EditAdsCounter:::" + ex.Message);
                return 0;
            }
        }

        public int ReActivateAds(int nUserID, int nAdsID, DateTime dtUpdateDate)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@userID", nUserID);
                DBParameter param2 = new DBParameter("@adsID", nAdsID);
                DBParameter param3 = new DBParameter("@adsUpdateDate", dtUpdateDate);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ReAcivateAds", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBAdsManager:::ReActivateAds:::" + ex.Message);
                return 0;
            }
        }

        #endregion
    }
}
