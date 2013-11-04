using System;
using System.Data;
using DALC4NET;
using Entity;
using NLog;

namespace DAL
{
    public class ManageSubCategory
    {

        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;


        public ManageSubCategory()
        {
            _dbHelper = DBHelper.GetInstance();
        }


        /// <summary>
        /// Get User Info to set session "get user info By Email Address"
        /// </summary>
        /// <param name="EmailAddress">set EmailAddress "string value"</param>
        /// <returns>return User Info Object</returns>
        public SubCategory GetSubCategoryInfo(string SubCategoryID)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            SubCategory objCategory = new SubCategory();
            try
            {
                DBParameter param1 = new DBParameter("@subCategoryID", SubCategoryID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);

                reader = _dbHelper.ExecuteDataReader("sp_SubGetCategoryByID", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objCategory.SubCategoryID = Convert.ToInt32(reader["SubCategoriesID"].ToString());
                    objCategory.SubCategoryName = reader["SubCategoriesName"].ToString();
                    objCategory.CategoryID_FK = Convert.ToInt32(reader["Categories_fk"].ToString());
                    objCategory.SubCategoryStatus = Convert.ToInt16(reader["SubCategoriesStatus"].ToString());
                }
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageSubCategory:::GetSubCategoryInfo:::" + ex.Message);
                objCategory = null;
                throw;
            }
            return objCategory;
        }


        public DataSet GetAllSubCatByCatID(int CatID)
        {
            try
            {
                DBParameter param1 = new DBParameter("@Categories_fk", CatID); 
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetSubCategoriesByCategoriyID", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageSubCategory:::GetAllSubCatByCatID:::" + ex.Message);
                throw;
            }
        }



        /// <summary>
        /// Cerate a new User
        /// </summary>
        /// <param name="user">Set User Object "Object Value"</param>
        /// <returns>return 1 if insert secussfully otherwise return 0</returns>
        public int AddNewSubCategory(SubCategory gategory)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@SubCategoriesName", gategory.SubCategoryName);
                DBParameter param2 = new DBParameter("@CategoriesID_fk", gategory.CategoryID_FK);
                DBParameter param3 = new DBParameter("@SubCategoriesStatus", gategory.SubCategoryStatus);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_AddSubCategories", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageSubCategory:::AddNewSubCategory:::" + ex.Message);
                return 0;
            }
        }

        /// <summary>
        /// Get All Category Account Admin
        /// </summary>
        /// <returns>return dataset for all Category</returns>
        public DataSet GetAllSubCategory()
        {
            try
            {
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_GetAllSubCategory", CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageSubCategory:::GetAllSubCategory:::" + ex.Message);
                throw;
            }
        }

        /// <summary>
        /// Delete Category Info
        /// </summary>
        /// <param name="sUserID">set Category ID "string value"</param>
        /// <returns>return 1 if the Category delete sucessfully otherwise return 0</returns>
        public int DeleteSubCategory(string sSubGategoryID)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@SubCategoryID", sSubGategoryID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_DeleteSubCategory", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageSubCategory:::DeleteSubCategory:::" + ex.Message);
                return 0;
            }
        }

        /// <summary>
        /// Edit a new Gategory
        /// </summary>
        /// <param name="user">Set Gategory Object "Object Value"</param>
        /// <returns>return 1 if Edit secussfully otherwise return 0</returns>
        public int EditSubGategoryInfo(SubCategory gategory)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@SubCategoriesName", gategory.SubCategoryName);
                DBParameter param2 = new DBParameter("@CategoriesID_fk", gategory.CategoryID_FK);
                DBParameter param3 = new DBParameter("@SubCategoriesStatus", gategory.SubCategoryStatus);
                DBParameter param4 = new DBParameter("@SubCategoriesID", gategory.SubCategoryID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_EditSubCategoryInfo", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageSubCategory:::EditSubGategoryInfo:::" + ex.Message);
                return 0;
            }
        }
    }
}
