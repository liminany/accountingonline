using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DALC4NET;
using NLog;
using Entity;
using Entity.City;
using System.Data;

namespace DAL
{
    public class ManageCity
    {
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;

        public ManageCity()
        {
            _dbHelper = DBHelper.GetInstance();
        }

        public AddNewCity AddNewCityInfo(EntiryCity objEntiryCity)
        {
            try
            {
                int rowsAffected = 0;

                DBParameter param1 = new DBParameter("@cityID", objEntiryCity.CityID);
                DBParameter param2 = new DBParameter("@country_FK_ID", objEntiryCity.Country_FK_ID);
                DBParameter param3 = new DBParameter("@cityName", objEntiryCity.CityName);
                DBParameter param4 = new DBParameter("@cityStatus", objEntiryCity.CityStatus);
                DBParameter param_Action = new DBParameter("@action", objEntiryCity.Action);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param_Action);

                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ArabiSky_ManageCity", paramCollection, CommandType.StoredProcedure);
                if (rowsAffected == 1)
                    return AddNewCity.Success;
                else
                    return AddNewCity.Error;

            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCity:::AddNewCityInfo:::" + ex.Message);
                return AddNewCity.Execption;
            }
        }

        public AddNewCity EditCityInfo(EntiryCity objEntiryCity)
        {
            try
            {
                int rowsAffected = 0;

                DBParameter param1 = new DBParameter("@cityID", objEntiryCity.CityID);
                DBParameter param2 = new DBParameter("@country_FK_ID", objEntiryCity.Country_FK_ID);
                DBParameter param3 = new DBParameter("@cityName", objEntiryCity.CityName);
                DBParameter param4 = new DBParameter("@cityStatus", objEntiryCity.CityStatus);
                DBParameter param_Action = new DBParameter("@action", objEntiryCity.Action);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param_Action);

                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ArabiSky_ManageCity", paramCollection, CommandType.StoredProcedure);

                if (rowsAffected == 1)
                    return AddNewCity.Success;
                else
                    return AddNewCity.Error;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCity:::EditCityInfo:::" + ex.Message);
                return AddNewCity.Execption;
            }
        }

        public AddNewCity DeleteCityInfo(EntiryCity objEntiryCity)
        {
            try
            {
                int rowsAffected = 0;

                DBParameter param1 = new DBParameter("@cityID", objEntiryCity.CityID);
                DBParameter param2 = new DBParameter("@country_FK_ID", 0);
                DBParameter param3 = new DBParameter("@cityName", "");
                DBParameter param4 = new DBParameter("@cityStatus", 0);
                DBParameter param_Action = new DBParameter("@action", objEntiryCity.Action);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param_Action);

                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ArabiSky_ManageCity", paramCollection, CommandType.StoredProcedure);

                if (rowsAffected == 1)
                    return AddNewCity.Success;
                else
                    return AddNewCity.Error;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCity:::DeleteCityInfo:::" + ex.Message);
                return AddNewCity.Execption;
            }
        }

        public EntiryCity GetCityInfoByID(EntiryCity objEntiryCity)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            try
            {
                DBParameter param1 = new DBParameter("@cityID", objEntiryCity.CityID);
                DBParameter param2 = new DBParameter("@country_FK_ID", objEntiryCity.Country_FK_ID);
                DBParameter param3 = new DBParameter("@cityName", objEntiryCity.CityName);
                DBParameter param4 = new DBParameter("@cityStatus", objEntiryCity.CityStatus);
                DBParameter param_Action = new DBParameter("@action", objEntiryCity.Action);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param_Action);
                reader = _dbHelper.ExecuteDataReader("sp_ArabiSky_ManageCity", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objEntiryCity.CityID = int.Parse(reader["CityID"].ToString());
                    objEntiryCity.CityName = reader["CityName"].ToString();
                    objEntiryCity.Country_FK_ID = int.Parse(reader["Country_FK_ID"].ToString());
                    objEntiryCity.CityStatus = int.Parse(reader["CityStatus"].ToString());
                }
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCity:::GetCityInfoByID:::" + ex.Message);
                objEntiryCity = null;
                throw;
            }
            return objEntiryCity;
        }

        public DataSet GetAllCity(EntiryCity objEntiryCity)
        {
            try
            {
                DBParameter param1 = new DBParameter("@cityID", objEntiryCity.CityID);
                DBParameter param2 = new DBParameter("@country_FK_ID", "0");
                DBParameter param3 = new DBParameter("@cityName", "test");
                DBParameter param4 = new DBParameter("@cityStatus", "1");
                DBParameter param_Action = new DBParameter("@action", objEntiryCity.Action);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param_Action);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_ArabiSky_ManageCity", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCity:::GetAllCity:::" + ex.Message);
                throw;
            }
        }



        public DataSet GetAllCityByCountryID(EntiryCity objEntiryCity)
        {
            try
            {
                DBParameter param1 = new DBParameter("@cityID", objEntiryCity.CityID);
                DBParameter param2 = new DBParameter("@country_FK_ID", objEntiryCity.Country_FK_ID);
                DBParameter param3 = new DBParameter("@cityName", objEntiryCity.CityName);
                DBParameter param4 = new DBParameter("@cityStatus", objEntiryCity.CityStatus);
                DBParameter param_Action = new DBParameter("@action", objEntiryCity.Action);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param_Action);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_ArabiSky_ManageCity", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCity:::GetAllCityByCountryID:::" + ex.Message);
                throw;
            }
        }
    }
}
