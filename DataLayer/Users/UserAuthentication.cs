using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entity;
using DALC4NET;
using System.Data;
using NLog;

namespace DAL
{
    public class UserAuthentication
    {
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;

        public UserAuthentication()
        {
            _dbHelper = DBHelper.GetInstance();
        }

        /// <summary>
        /// To Make User Login for Admin System
        /// </summary>
        /// <param name="user">Set User Object</param>
        /// <returns>return 1 if the username and password is correct otherwise return 0</returns>
        public int AdminLoginUser(Users user)
        {
            IDbCommand command = null;
            object retValue = null;

            try
            {
                DBParameter param1 = new DBParameter("@username", user.UserEmailAddress);
                DBParameter param2 = new DBParameter("@password", user.UserPassword);
                DBParameter outParam = new DBParameter("@returnValue", 0, DbType.Int16, ParameterDirection.Output);
                DBParameterCollection paramCollection = new DBParameterCollection();

                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(outParam);


                command = _dbHelper.GetCommand("sp_LoginUser", paramCollection, CommandType.StoredProcedure);
                command.ExecuteNonQuery();
                retValue = _dbHelper.GetParameterValue(2, command);
                return Convert.ToInt16(retValue);
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::AdminLoginUser:::" + ex.Message);
                return 0;
            }
            finally
            {
                _dbHelper.DisposeCommand(command);
            }
        }

        /// <summary>
        /// ClientLoginUser
        /// </summary>
        /// <param name="objEntityRegUsers"></param>
        /// <returns></returns>
        public EntityRegUsers ClientLoginUser(EntityRegUsers objEntityRegUsers)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            try
            {
                DBParameter param1 = new DBParameter("@userEmailAddress", objEntityRegUsers.UserEmailAddress);
                DBParameter param2 = new DBParameter("@userPassword", objEntityRegUsers.UserPassword);

                DBParameterCollection paramCollection = new DBParameterCollection();

                paramCollection.Add(param1);
                paramCollection.Add(param2);


                reader = _dbHelper.ExecuteDataReader("sp_ArabiSky_LoginRegisterUsers", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objEntityRegUsers.UserID = Convert.ToInt32(reader["UserID"].ToString());
                    objEntityRegUsers.UserFullName = reader["User_FullName"].ToString();
                    objEntityRegUsers.UserEmailAddress = reader["User_EmailAddress"].ToString();
                    objEntityRegUsers.UserPassword = reader["User_Password"].ToString();
                    objEntityRegUsers.UserFacebookID = reader["User_FacebookID"].ToString();
                    objEntityRegUsers.UserStatus = int.Parse(reader["User_Status"].ToString());
                    objEntityRegUsers.UserType = int.Parse(reader["User_UserType"].ToString());
                    objEntityRegUsers.UserCountAds = int.Parse(reader["User_CountAds"].ToString());
                    objEntityRegUsers.CountAdsUsed = int.Parse(reader["User_CountAdsUsed"].ToString());
                    objEntityRegUsers.UserMobileNumber = reader["User_MobileNumber"].ToString();
                    objEntityRegUsers.UserCountry = int.Parse(reader["User_Country"].ToString());
                    objEntityRegUsers.UserCityAddress = int.Parse(reader["User_City"].ToString());
                    objEntityRegUsers.UserImage = reader["User_Image"].ToString();
                    objEntityRegUsers.CreateDateTime = Convert.ToDateTime(reader["User_CreateDate"].ToString());
                }
                return objEntityRegUsers;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::ClientLoginUser:::" + ex.Message);
                return objEntityRegUsers;
            }
        }

        /// <summary>
        /// Get User Info to set session "get user info By Email Address"
        /// </summary>
        /// <param name="EmailAddress">set EmailAddress "string value"</param>
        /// <returns>return User Info Object</returns>
        public Users GetUserInfo(string EmailAddress)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            Users objUsers = new Users();
            try
            {
                DBParameter param1 = new DBParameter("@emailAddress", EmailAddress);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);

                reader = _dbHelper.ExecuteDataReader("sp_GetUserInfoByEmail", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objUsers.UserID = int.Parse(reader["UserID"].ToString());
                    objUsers.UserFullName = reader["UserName"].ToString();
                    objUsers.UserEmailAddress = EmailAddress;
                    objUsers.UserPassword = reader["Password"].ToString();
                    objUsers.UserPermission = Convert.ToInt32(reader["UserPermission"].ToString());
                    objUsers.UserStatus = Convert.ToInt16(reader["UserStatus"].ToString());
                    objUsers.CreateDateTiem = Convert.ToDateTime(reader["CreateDate"].ToString());
                }
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::GetUserInfo:::" + ex.Message);
                objUsers = null;
                throw;
            }
            return objUsers;
        }

        /// <summary>
        /// Get User Info to set session "get user info By Email Address"
        /// </summary>
        /// <param name="EmailAddress">set EmailAddress "string value"</param>
        /// <returns>return User Info Object</returns>
        public EntityRegUsers GetUserInfoByUserID(int nUserID)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            EntityRegUsers objEntityRegUsers = new EntityRegUsers();
            try
            {
                DBParameter param1 = new DBParameter("@userID", nUserID);
                DBParameterCollection paramCollection = new DBParameterCollection();

                paramCollection.Add(param1);

                reader = _dbHelper.ExecuteDataReader("sp_ArabiSky_GetByUserID", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objEntityRegUsers.UserID = Convert.ToInt32(reader["UserID"].ToString());
                    objEntityRegUsers.UserFullName = reader["User_FullName"].ToString();
                    objEntityRegUsers.UserEmailAddress = reader["User_EmailAddress"].ToString();
                    objEntityRegUsers.UserPassword = reader["User_Password"].ToString();
                    objEntityRegUsers.UserFacebookID = reader["User_FacebookID"].ToString();
                    objEntityRegUsers.UserStatus = int.Parse(reader["User_Status"].ToString());
                    objEntityRegUsers.UserType = int.Parse(reader["User_UserType"].ToString());
                    objEntityRegUsers.UserCountAds = int.Parse(reader["User_CountAds"].ToString());
                    objEntityRegUsers.CountAdsUsed = int.Parse(reader["User_CountAdsUsed"].ToString());
                    objEntityRegUsers.UserMobileNumber = reader["User_MobileNumber"].ToString();
                    objEntityRegUsers.UserCountry = int.Parse(reader["User_Country"].ToString());
                    objEntityRegUsers.UserCityAddress = int.Parse(reader["User_City"].ToString());
                    objEntityRegUsers.UserImage = reader["User_Image"].ToString();
                    objEntityRegUsers.CreateDateTime = Convert.ToDateTime(reader["User_CreateDate"].ToString());
                }
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::GetUserInfoByUserID:::" + ex.Message);
                objEntityRegUsers = null;
                throw;
            }
            return objEntityRegUsers;
        }

        /// <summary>
        /// Get User Info to set session "get user info By Email Address"
        /// </summary>
        /// <param name="EmailAddress">set EmailAddress "string value"</param>
        /// <returns>return User Info Object</returns>
        public EntityRegUsers GetUserInfoByUserEmailAddress(EntityRegUsers objRegUsers)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            try
            {
                DBParameter param1 = new DBParameter("@userEmailAddress", objRegUsers.UserEmailAddress);

                DBParameterCollection paramCollection = new DBParameterCollection();

                paramCollection.Add(param1);

                objRegUsers.UserEmailAddress = string.Empty;
                reader = _dbHelper.ExecuteDataReader("sp_ArabiSky_GetByUserEmailAddress", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objRegUsers.UserID = Convert.ToInt32(reader["UserID"].ToString());
                    objRegUsers.UserFullName = reader["User_FullName"].ToString();
                    objRegUsers.UserEmailAddress = reader["User_EmailAddress"].ToString();
                    objRegUsers.UserPassword = reader["User_Password"].ToString();
                    objRegUsers.UserFacebookID = reader["User_FacebookID"].ToString();
                    //objRegUsers.UserStatus = int.Parse(reader["User_Status"].ToString());
                    //objRegUsers.UserType = int.Parse(reader["User_UserType"].ToString());
                    //objRegUsers.UserCountAds = int.Parse(reader["User_CountAds"].ToString());
                    //objRegUsers.UserMobileNumber = reader["User_MobileNumber"].ToString();
                    //objRegUsers.UserCountry = int.Parse(reader["User_Country"].ToString());
                    //objRegUsers.UserCityAddress = int.Parse(reader["User_City"].ToString());
                    //objRegUsers.CreateDateTime = Convert.ToDateTime(reader["User_CreateDate"].ToString());
                }
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::GetUserInfoByUserEmailAddress:::" + ex.Message);
                objRegUsers = null;
            }
            return objRegUsers;
        }

        /// <summary>
        /// Get All User Account Admin
        /// </summary>
        /// <returns>return dataset for all users</returns>
        public DataSet GetAllUser()
        {
            try
            {
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_ArabiSky_GetAllUserFromAdmin", CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::GetAllUser:::" + ex.Message);
                throw;
            }
        }

        /// <summary>
        /// Cerate a new User
        /// </summary>
        /// <param name="user">Set User Object "Object Value"</param>
        /// <returns>return 1 if insert secussfully otherwise return 0</returns>
        public EntityRegUsers RegisterNewUserFromClient(EntityRegUsers objEntityRegUsers)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            try
            {
                DBParameter param1 = new DBParameter("@userFullName", objEntityRegUsers.UserFullName);
                DBParameter param2 = new DBParameter("@userEmailAddress", objEntityRegUsers.UserEmailAddress);
                DBParameter param3 = new DBParameter("@userPassword", objEntityRegUsers.UserPassword);
                DBParameter param4 = new DBParameter("@userFacebookID", objEntityRegUsers.UserFacebookID);
                DBParameter param5 = new DBParameter("@userStatus", objEntityRegUsers.UserStatus);
                DBParameter param6 = new DBParameter("@userType", objEntityRegUsers.UserType);
                DBParameter param7 = new DBParameter("@userCountAds", objEntityRegUsers.UserCountAds);
                DBParameter param8 = new DBParameter("@userMobileNumber", objEntityRegUsers.UserMobileNumber);
                DBParameter param9 = new DBParameter("@userCountry", objEntityRegUsers.UserCountry);
                DBParameter param10 = new DBParameter("@userCity", objEntityRegUsers.UserCityAddress);
                DBParameter param11 = new DBParameter("@userImage", objEntityRegUsers.UserImage);

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

                reader = _dbHelper.ExecuteDataReader("sp_ArabiSky_InsertRegisterUsers_fromClient", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objEntityRegUsers.UserID = Convert.ToInt32(reader["UserID"].ToString());
                    objEntityRegUsers.UserFullName = reader["User_FullName"].ToString();
                    objEntityRegUsers.UserEmailAddress = reader["User_EmailAddress"].ToString();
                    objEntityRegUsers.UserPassword = reader["User_Password"].ToString();
                    objEntityRegUsers.UserFacebookID = reader["User_FacebookID"].ToString();
                    objEntityRegUsers.UserStatus = int.Parse(reader["User_Status"].ToString());
                    objEntityRegUsers.UserType = int.Parse(reader["User_UserType"].ToString());
                    objEntityRegUsers.UserCountAds = int.Parse(reader["User_CountAds"].ToString());
                    objEntityRegUsers.CountAdsUsed = int.Parse(reader["User_CountAdsUsed"].ToString());
                    objEntityRegUsers.UserMobileNumber = reader["User_MobileNumber"].ToString();
                    objEntityRegUsers.UserCountry = int.Parse(reader["User_Country"].ToString());
                    objEntityRegUsers.UserCityAddress = int.Parse(reader["User_City"].ToString());
                    objEntityRegUsers.UserImage = reader["User_Image"].ToString();
                    objEntityRegUsers.CreateDateTime = Convert.ToDateTime(reader["User_CreateDate"].ToString());
                }
                return objEntityRegUsers;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::RegisterNewUserFromClient:::" + ex.Message);
                objEntityRegUsers.UserID = -1;
                return objEntityRegUsers;
            }
        }

        /// <summary>
        /// Cerate a new User
        /// </summary>
        /// <param name="user">Set User Object "Object Value"</param>
        /// <returns>return 1 if insert secussfully otherwise return 0</returns>
        public int RegisterNewUserFromAdmin(EntityRegUsers objUsers)
        {
            IDbCommand command = null;
            object retValue = null;
            try
            {
                DBParameter param1 = new DBParameter("@userFullName", objUsers.UserFullName);
                DBParameter param2 = new DBParameter("@userEmailAddress", objUsers.UserEmailAddress);
                DBParameter param3 = new DBParameter("@userPassword", objUsers.UserPassword);
                DBParameter param4 = new DBParameter("@userFacebookID", objUsers.UserFacebookID);
                DBParameter param5 = new DBParameter("@userStatus", objUsers.UserStatus);
                DBParameter param6 = new DBParameter("@userType", objUsers.UserType);
                DBParameter param7 = new DBParameter("@userCountAds", objUsers.UserCountAds);
                DBParameter param8 = new DBParameter("@userMobileNumber", objUsers.UserMobileNumber);
                DBParameter param9 = new DBParameter("@userCountry", objUsers.UserCountry);
                DBParameter param10 = new DBParameter("@userCity", objUsers.UserCityAddress);
                DBParameter param11 = new DBParameter("@userImage", objUsers.UserImage);

                DBParameter outParam = new DBParameter("@returnValue", 0, DbType.Int16, ParameterDirection.Output);
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
                paramCollection.Add(outParam);
                command = _dbHelper.GetCommand("sp_ArabiSky_InsertRegisterUsers", paramCollection, CommandType.StoredProcedure);
                command.ExecuteNonQuery();
                retValue = _dbHelper.GetParameterValue("@returnValue", command);
                return Convert.ToInt16(retValue);
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::RegisterNewUserFromAdmin:::" + ex.Message);
                return -1;
            }
        }

        /// <summary>
        /// Delete User Info
        /// </summary>
        /// <param name="sUserID">set User ID "string value"</param>
        /// <returns>return 1 if the user delete sucessfully otherwise return 0</returns>
        public int DeleteUser(string sUserID)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@userID", sUserID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_ArabiSky_DeleteUser", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::DeleteUser:::" + ex.Message);
                return 0;
            }
        }

        /// <summary>
        /// Edit a new User
        /// </summary>
        /// <param name="user">Set User Object "Object Value"</param>
        /// <returns>return 1 if Edit secussfully otherwise return 0</returns>
        public int EditUserInfo(EntityRegUsers objUsers)
        {
            IDbCommand command = null;
            object retValue = null;

            try
            {
                DBParameter param1 = new DBParameter("@userFullName", objUsers.UserFullName);
                DBParameter param2 = new DBParameter("@userEmailAddress", objUsers.UserEmailAddress);
                DBParameter param3 = new DBParameter("@userPassword", objUsers.UserPassword);
                DBParameter param4 = new DBParameter("@userFacebookID", objUsers.UserFacebookID);
                DBParameter param5 = new DBParameter("@userStatus", objUsers.UserStatus);
                DBParameter param6 = new DBParameter("@userType", objUsers.UserType);
                DBParameter param7 = new DBParameter("@userCountAds", objUsers.UserCountAds);
                DBParameter param8 = new DBParameter("@userMobileNumber", objUsers.UserMobileNumber);
                DBParameter param9 = new DBParameter("@userCountry", objUsers.UserCountry);
                DBParameter param10 = new DBParameter("@userCity", objUsers.UserCityAddress);
                DBParameter param11 = new DBParameter("@userID", objUsers.UserID);
                DBParameter param12 = new DBParameter("@userImage", objUsers.UserImage);
                DBParameter outParam = new DBParameter("@returnValue", 0, DbType.Int16, ParameterDirection.Output);


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
                paramCollection.Add(param12);

                paramCollection.Add(outParam);


                command = _dbHelper.GetCommand("sp_ArabiSky_UpdateRegisterUsers", paramCollection, CommandType.StoredProcedure);
                command.ExecuteNonQuery();
                retValue = _dbHelper.GetParameterValue("@returnValue", command);
                return Convert.ToInt16(retValue);
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::EditUserInfo:::" + ex.Message);
                return 0;
            }
        }

        /// <summary>
        /// Edit a new User
        /// </summary>
        /// <param name="user">Set User Object "Object Value"</param>
        /// <returns>return 1 if Edit secussfully otherwise return 0</returns>
        public int EditUserInfoFormClient(EntityRegUsers objUsers)
        {
            //IDbCommand command = null;
            object retValue = null;
            try
            {
                //DBParameter param1 = new DBParameter("@userID", objUsers.UserID, DbType.Int32);
                //DBParameter param2 = new DBParameter("@userFullName", objUsers.UserFullName, DbType.String);
                //DBParameter param3 = new DBParameter("@userEmailAddress", objUsers.UserEmailAddress, DbType.String);
                //DBParameter param4 = new DBParameter("@userMobileNumber", objUsers.UserMobileNumber, DbType.String);

                //DBParameter outParam = new DBParameter("@returnValue", 0, DbType.Int16, ParameterDirection.Output);
                //DBParameter param3 = new DBParameter("@userPassword", objUsers.UserPassword);
                //DBParameter param4 = new DBParameter("@userFacebookID", objUsers.UserFacebookID);
                //DBParameter param5 = new DBParameter("@userStatus", objUsers.UserStatus);
                //DBParameter param6 = new DBParameter("@userType", objUsers.UserType);
                //DBParameter param7 = new DBParameter("@userCountAds", objUsers.UserCountAds);
                //DBParameter param9 = new DBParameter("@userCountry", objUsers.UserCountry);
                //DBParameter param10 = new DBParameter("@userCity", objUsers.UserCityAddress);
                //DBParameterCollection paramCollection = new DBParameterCollection();
                //paramCollection.Add(param1);
                //paramCollection.Add(param2);
                //paramCollection.Add(param3);
                //paramCollection.Add(param4);
                //paramCollection.Add(param3);
                //paramCollection.Add(param4);
                //paramCollection.Add(param5);
                //paramCollection.Add(param6);
                //paramCollection.Add(param7);
                //paramCollection.Add(param8);
                //paramCollection.Add(param9);
                //paramCollection.Add(param10);
                //paramCollection.Add(param11);
                //paramCollection.Add(outParam);
                //command = _dbHelper.GetCommand("sp_ArabiSky_UpdateRegisterUsers", paramCollection, CommandType.StoredProcedure);
                //command.ExecuteNonQuery();
                //retValue = _dbHelper.GetParameterValue("@returnValue", command);
                return Convert.ToInt16(retValue);
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::EditUserInfoFormClient:::" + ex.Message);
                return 0;
            }
        }

        /// <summary>
        /// Edit a new User
        /// </summary>
        /// <param name="user">Set User Object "Object Value"</param>
        /// <returns>return 1 if Edit secussfully otherwise return 0</returns>
        public int EditUserPasswordFormClient(EntityRegUsers objUsers)
        {
            IDbCommand command = null;
            object retValue = null;
            try
            {
                DBParameter param1 = new DBParameter("@userID", objUsers.UserID, DbType.Int32);
                DBParameter param2 = new DBParameter("@userPassword", objUsers.UserPassword, DbType.String);

                DBParameter outParam = new DBParameter("@returnValue", 0, DbType.Int16, ParameterDirection.Output);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);

                paramCollection.Add(outParam);
                command = _dbHelper.GetCommand("sp_ArabiSky_UpdateUserPassword", paramCollection, CommandType.StoredProcedure);
                command.ExecuteNonQuery();
                retValue = _dbHelper.GetParameterValue("@returnValue", command);
                return Convert.ToInt16(retValue);
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserAuthentication:::EditUserPasswordFormClient:::" + ex.Message);
                return 0;
            }
        }
    }
}
