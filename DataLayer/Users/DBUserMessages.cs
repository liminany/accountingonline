using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DALC4NET;
using NLog;
using System.Data;
using Entity;

namespace DAL
{
    public class DBUserMessages
    {
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;

        public DBUserMessages()
        {
            _dbHelper = DBHelper.GetInstance();
        }

        public int SendNewMessageForUser(UserMessages objUserMessages)
        {
            try
            {
                int rowsAffected = 0;

                DBParameter param1 = new DBParameter("@messageTitle", objUserMessages.MessageTitle);
                DBParameter param2 = new DBParameter("@messageBody", objUserMessages.MessageBody);
                DBParameter param3 = new DBParameter("@messageUserID", objUserMessages.MessageUserID);
                DBParameter param4 = new DBParameter("@messageSendUsers", objUserMessages.MessageSendUsers);

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);

                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ArabiSky_SendMessage", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBUserMessages:::SendNewMessageForUser:::" + ex.Message);
                objUserMessages = null;
                throw;
            }
        }

        public DataSet GetAllUserEmailByUserID(int nUserUD)
        {
            try
            {
                DBParameter param1 = new DBParameter("@userID", nUserUD);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                DataSet dsReturnAllUserMessage = _dbHelper.ExecuteDataSet("sp_ArabiSky_GetAllMyEmail", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUserMessage;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBUserMessages:::GetAllUserEmailByUserID:::" + ex.Message);
                throw;
            }
        }

        public int DeleteUserMessage(string sMessageID)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@messageID", sMessageID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ArabiSky_DeleteMessage", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBUserMessages:::DeleteUserMessage:::" + ex.Message);
                return 0;
            }
        }

        public DataSet ReadEmail(int sMessageID, int sUserID)
        {
            try
            {
                DBParameter param1 = new DBParameter("@messageID", sMessageID);
                DBParameter param2 = new DBParameter("@userID", sUserID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                DataSet dsReturnAllUserMessage = _dbHelper.ExecuteDataSet("sp_ArabiSky_GetEmailByEmailID", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUserMessage;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DALUsers:::GetUserInfo:::" + ex.Message);
                throw;
            }
        }

        public int ReadEmailAndChangeFlag(string sMessageID)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@messageID", sMessageID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ReadEmail_ChangeFlag", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBUserMessages:::ReadEmailAndChangeFlag:::" + ex.Message);
                return 0;
            }
        }

        public int GetEmailUnReaded(int userID)
        {
            try
            {
                object rowsAffected;
                DBParameter param1 = new DBParameter("@userID", userID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteScalar("sp_ArabiSky_GetEmailUnReadCount", paramCollection, CommandType.StoredProcedure);
                return Convert.ToInt32(rowsAffected);
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBUserMessages:::GetEmailUnreaded:::" + ex.Message);
                return 0;
            }
        }
    }
}
