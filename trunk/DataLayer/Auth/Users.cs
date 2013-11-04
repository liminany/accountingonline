using System;
using System.Data;
using DALC4NET;
using Entity;
using NLog;

namespace DAL
{
    public class DALUsers
    {
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;

        public DALUsers()
        {
            _dbHelper = DBHelper.GetInstance();
        }

        /// <summary>
        /// Cerate a new User
        /// </summary>
        /// <param name="user">Set User Object "Object Value"</param>
        /// <returns>return 1 if insert secussfully otherwise return 0</returns>
        public int RegisterNewUserFromAdmin(Users user)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@userFullName", user.UserFullName);
                DBParameter param2 = new DBParameter("@userEmailAddress", user.UserEmailAddress);
                DBParameter param3 = new DBParameter("@userPassword", user.UserPassword);
                DBParameter param4 = new DBParameter("@userPermission", user.UserPermission);
                DBParameter param5 = new DBParameter("@userStatus", user.UserStatus);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param5);

                rowsAffected = _dbHelper.ExecuteNonQuery("sp_AddUsers", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DALUsers:::SignUpUser:::" + ex.Message);
                return 0;
            }
        }

        /// <summary>
        /// Get All User Account Admin
        /// </summary>
        /// <returns>return dataset for all users</returns>
        public DataSet GetAllUser()
        {
            try
            {
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetAllUserInfo", CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DALUsers:::GetAllUser:::" + ex.Message);
                throw;
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
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_DeleteUser", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DALUsers:::DeleteUser:::" + ex.Message);
                return 0;
            }
        }

        /// <summary>
        /// Edit a new User
        /// </summary>
        /// <param name="user">Set User Object "Object Value"</param>
        /// <returns>return 1 if Edit secussfully otherwise return 0</returns>
        public int EditUserInfo(Users user)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@userFullName", user.UserFullName);
                DBParameter param2 = new DBParameter("@userEmailAddress", user.UserEmailAddress);
                DBParameter param3 = new DBParameter("@userPassword", user.UserPassword);
                DBParameter param4 = new DBParameter("@userPermission", user.UserPermission);
                DBParameter param5 = new DBParameter("@userStatus", user.UserStatus);
                DBParameter param6 = new DBParameter("@userid", user.UserID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param5);
                paramCollection.Add(param6);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_EditUserInfo", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DALUsers:::EditUserInfo:::" + ex.Message);
                return 0;
            }
        }

        /// <summary>
        /// Get Admin User Info 
        /// </summary>
        /// <param name="sAdminID">set Admin User ID "string value"</param>
        /// <returns>return User Object</returns>
        public Users GetAdminInfoByUserID(int sAdminID)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            Users objUsers = new Users();
            try
            {
                DBParameter param1 = new DBParameter("@userID", sAdminID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                reader = _dbHelper.ExecuteDataReader("sp_GetAllAdminInfo", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objUsers.UserID = int.Parse(reader["UserID"].ToString());
                    objUsers.UserFullName = reader["UserName"].ToString();
                    objUsers.UserEmailAddress = reader["EmailAddress"].ToString();
                    objUsers.UserPassword = reader["Password"].ToString();
                    objUsers.UserPermission = int.Parse(reader["UserPermission"].ToString());
                    objUsers.UserStatus = int.Parse(reader["UserStatus"].ToString());
                }
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DALUsers:::GetUserInfo:::" + ex.Message);
                objUsers = null;
                throw;
            }
            return objUsers;
        }

    }
}
