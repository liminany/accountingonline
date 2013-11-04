using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using NLog;
using DALC4NET;

namespace DAL
{
    public class ContactUs
    {
        #region Variables
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;
        #endregion

        #region Constacter
        public ContactUs()
        {
            _dbHelper = DBHelper.GetInstance();
        }
        #endregion

        #region Methods

        public int InsertNewContactUs(Entity.ContactUs objContactUs)
        {
            try
            {
                int rowsAffected = 0;

                DBParameter param1 = new DBParameter("@contact_UserName", objContactUs.UserName);
                DBParameter param2 = new DBParameter("@contact_emailAddress", objContactUs.EmailAddress);
                DBParameter param3 = new DBParameter("@contact_message", objContactUs.UserMessage); 

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);

                rowsAffected = _dbHelper.ExecuteNonQuery("sp_InsertNewContactUs", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ContactUs:::InsertNewContactUs:::" + ex.Message);
                objContactUs = null;
                throw;
            }
        }

        public int DeleteContactUs(Entity.ContactUs objContactUs)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@contactUs_ID", objContactUs.ContactUsID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_DeleteContactUs", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ContactUs:::DeleteContactUs:::" + ex.Message);
                objContactUs = null;
                throw;
            }
        }

        public DataSet GetAllContactus()
        {
            try
            {
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetAllContactUs", CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ContactUs:::GetAllContactus:::" + ex.Message);
                throw;
            }
        }

        #endregion
    }
}
