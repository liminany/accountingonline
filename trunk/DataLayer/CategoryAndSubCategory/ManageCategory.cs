using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DALC4NET;
using System.Data;
using Entity;
using NLog;

namespace DAL
{
    public class ManageCategory
    {

        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;


        public ManageCategory()
        {
            _dbHelper = DBHelper.GetInstance();
        }


        /// <summary>
        /// Get User Info to set session "get user info By Email Address"
        /// </summary>
        /// <param name="EmailAddress">set EmailAddress "string value"</param>
        /// <returns>return User Info Object</returns>
        public Category GetCategoryInfo(string CategoryID)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            Category objCategory = new Category();
            try
            {
                DBParameter param1 = new DBParameter("@categoryID", CategoryID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);

                reader = _dbHelper.ExecuteDataReader("sp_GetCategoryByID", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objCategory.CategoryName = reader["CatName"].ToString();
                    objCategory.CategoryStatus = Convert.ToInt16(reader["CatStatus"].ToString());
                }
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCategory:::GetCategoryInfo:::" + ex.Message);
                objCategory = null;
                throw;
            }
            return objCategory;
        }

        /// <summary>
        /// Cerate a new User
        /// </summary>
        /// <param name="user">Set User Object "Object Value"</param>
        /// <returns>return 1 if insert secussfully otherwise return 0</returns>
        public int AddNewCategory(Category gategory)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@categoryName", gategory.CategoryName);
                DBParameter param2 = new DBParameter("@categoryStatus", gategory.CategoryStatus);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_AddCategory", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCategory:::AddNewCategory:::" + ex.Message);
                return 0;
            }
        }

        /// <summary>
        /// Get All Category Account Admin
        /// </summary>
        /// <returns>return dataset for all Category</returns>
        public DataSet GetAllCategory()
        {
            try
            {
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetAllCategory", CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCategory:::GetAllCategory:::" + ex.Message);
                throw;
            }
        }

        /// <summary>
        /// Delete Category Info
        /// </summary>
        /// <param name="sUserID">set Category ID "string value"</param>
        /// <returns>return 1 if the Category delete sucessfully otherwise return 0</returns>
        public int DeleteCategory(string sGategoryID)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@gategoryID", sGategoryID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_DeleteCategory", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCategory:::DeleteCategory:::" + ex.Message);
                return 0;
            }
        }

        /// <summary>
        /// Edit a new Gategory
        /// </summary>
        /// <param name="user">Set Gategory Object "Object Value"</param>
        /// <returns>return 1 if Edit secussfully otherwise return 0</returns>
        public int EditGategoryInfo(Category gategory)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@categoryName", gategory.CategoryName);
                DBParameter param2 = new DBParameter("@categoryStatus", gategory.CategoryStatus);
                DBParameter param3 = new DBParameter("@categoryID", gategory.CategoryID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_EditCategoryInfo", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageCategory:::EditGategoryInfo:::" + ex.Message);
                return 0;
            }
        }
    }
}
