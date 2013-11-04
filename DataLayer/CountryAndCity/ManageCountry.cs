using DALC4NET;
using NLog;
using Entity;
using System.Data;
using Entity.Country;
using System;

namespace DAL
{
    public class ManageCountry
    {
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;

        public ManageCountry()
        {
            _dbHelper = DBHelper.GetInstance();
        }

        public AddNewCountry AddNewCountry(EntiryCountry objEntiryCountry)
        {
            try
            {
                int rowsAffected = 0;

                DBParameter param1 = new DBParameter("@countryID", objEntiryCountry.CountryID);
                DBParameter param2 = new DBParameter("@countryName", objEntiryCountry.CountryName);
                DBParameter param3 = new DBParameter("@countryStatus", objEntiryCountry.CountryStatus);
                DBParameter param_Action = new DBParameter("@action", objEntiryCountry.Action);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param_Action);

                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ArabiSky_ManageCountry", paramCollection, CommandType.StoredProcedure);
                if (rowsAffected == 1)
                    return Entity.AddNewCountry.Success;
                else
                    return Entity.AddNewCountry.Error;

            }
            catch (System.Exception)
            {
                return Entity.AddNewCountry.Execption;
            }
        }

        public AddNewCountry EditCountryInfo(EntiryCountry objEntiryCountry)
        {
            try
            {
                int rowsAffected = 0;

                DBParameter param1 = new DBParameter("@countryID", objEntiryCountry.CountryID);
                DBParameter param2 = new DBParameter("@countryName", objEntiryCountry.CountryName);
                DBParameter param3 = new DBParameter("@countryStatus", objEntiryCountry.CountryStatus);
                DBParameter param_Action = new DBParameter("@action", objEntiryCountry.Action);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param_Action);

                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ArabiSky_ManageCountry", paramCollection, CommandType.StoredProcedure);

                if (rowsAffected == 1)
                    return Entity.AddNewCountry.Success;
                else
                    return Entity.AddNewCountry.Error;
            }
            catch (System.Exception)
            {
                return Entity.AddNewCountry.Execption;
            }
        }

        public AddNewCountry DeleteCountryInfo(EntiryCountry objEntiryCountry)
        {
            try
            {
                int rowsAffected = 0;

                DBParameter param1 = new DBParameter("@countryID", objEntiryCountry.CountryID);
                DBParameter param2 = new DBParameter("@countryName", "");
                DBParameter param3 = new DBParameter("@countryStatus", 0);
                DBParameter param_Action = new DBParameter("@action", objEntiryCountry.Action);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param_Action);

                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ArabiSky_ManageCountry", paramCollection, CommandType.StoredProcedure);

                if (rowsAffected == 1)
                    return Entity.AddNewCountry.Success;
                else
                    return Entity.AddNewCountry.Error;
            }
            catch (Exception)
            {
                return Entity.AddNewCountry.Execption;
            }
        }

        public EntiryCountry GetCountryInfoByID(EntiryCountry objEntiryCountry)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            try
            {
                DBParameter param1 = new DBParameter("@countryID", objEntiryCountry.CountryID);
                DBParameter param2 = new DBParameter("@countryName", "");
                DBParameter param3 = new DBParameter("@countryStatus", 0);
                DBParameter param_Action = new DBParameter("@action", objEntiryCountry.Action);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param_Action);
                reader = _dbHelper.ExecuteDataReader("sp_ArabiSky_ManageCountry", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objEntiryCountry.CountryID = int.Parse(reader["CountryID"].ToString());
                    objEntiryCountry.CountryName = reader["CountryName"].ToString();
                    objEntiryCountry.CountryStatus = Convert.ToInt16(reader["CountryStatus"].ToString());
                }
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCategory:::GetCategoryInfo:::" + ex.Message);
                objEntiryCountry = null;
                throw;
            }
            return objEntiryCountry;
        }

        public DataSet GetAllCountry(EntiryCountry objEntiryCountry)
        {
            try
            {
                DBParameter param1 = new DBParameter("@countryID", objEntiryCountry.CountryID);
                DBParameter param2 = new DBParameter("@countryName", "");
                DBParameter param3 = new DBParameter("@countryStatus", objEntiryCountry.CountryStatus);
                DBParameter param_Action = new DBParameter("@action", objEntiryCountry.Action);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param_Action);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_ArabiSky_ManageCountry", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserCommnets:::GetAllCommentsForOwnArtics:::" + ex.Message);
                throw;
            }
        }
    }
}
