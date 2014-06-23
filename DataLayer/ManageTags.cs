using System;
using System.Data;
using DALC4NET;
using Entity;
using NLog;

namespace DAL
{
    public class ManageTags
    {

        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;


        public ManageTags()
        {
            _dbHelper = DBHelper.GetInstance();
        }

        /// <summary>
        /// Cerate a new Tag
        /// </summary>
        /// <param name="user">Set Tags Object "Object Value"</param>
        /// <returns>return 1 if insert secussfully otherwise return 0</returns>
        public int AddNewTags(Tags objTags)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@tagText", objTags.TagsName);
                DBParameter param2 = new DBParameter("@tagURL", objTags.TagsURL);
                DBParameter param3 = new DBParameter("@subCat", objTags.SubCategoryIDFK);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_AddTags", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageTags:::AddNewTags:::" + ex.Message);
                return 0;
            }
        }


        /// <summary>
        /// Edit a new Gategory
        /// </summary>
        /// <param name="user">Set Gategory Object "Object Value"</param>
        /// <returns>return 1 if Edit secussfully otherwise return 0</returns>
        public int EditTagInfo(Tags objTags)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@tagText", objTags.TagsName);
                DBParameter param2 = new DBParameter("@tagURL", objTags.TagsURL);
                DBParameter param3 = new DBParameter("@subCat", objTags.SubCategoryIDFK);
                DBParameter param4 = new DBParameter("@tagID", objTags.TagsID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_UpdateTags", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageTags:::EditTagInfo:::" + ex.Message);
                return 0;
            }
        }


        /// <summary>
        /// Get User Info to set session "get user info By Email Address"
        /// </summary>
        /// <param name="EmailAddress">set EmailAddress "string value"</param>
        /// <returns>return User Info Object</returns>
        public Tags GetTagsInfo(string TagID)
        {
            IDbConnection connection = _dbHelper.GetConnObject();
            IDataReader reader = null;
            Tags objTags = new Tags();
            try
            {
                DBParameter param1 = new DBParameter("@tagID", TagID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);

                reader = _dbHelper.ExecuteDataReader("sp_TagByID", connection, paramCollection, CommandType.StoredProcedure);
                while (reader.Read())
                {
                    objTags.TagsName = reader["TagText"].ToString();
                    objTags.TagsURL = reader["TagURL"].ToString();
                    objTags.SubCategoryIDFK = Convert.ToInt32(reader["subCategories"].ToString());
                    objTags.TagsStatus = Convert.ToInt16(reader["Status"].ToString());
                }
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageTags:::GetTagsInfo:::" + ex.Message);
                objTags = null;
                throw;
            }
            return objTags;
        }


        public DataSet GetAllTagsByID(int TagID)
        {
            try
            {
                DBParameter param1 = new DBParameter("@tagID", TagID); 
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_TagByID", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageTags:::GetAllTagsByID:::" + ex.Message);
                throw;
            }
        }
 
        /// <summary>
        /// Get All Category Account Admin
        /// </summary>
        /// <returns>return dataset for all Category</returns>
        public DataSet GetAllTags()
        {
            try
            {
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("sp_AllTag", CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageTags:::GetAllTags:::" + ex.Message);
                throw;
            }
        }


        /// <summary>
        /// Delete Category Info
        /// </summary>
        /// <param name="sUserID">set Category ID "string value"</param>
        /// <returns>return 1 if the Category delete sucessfully otherwise return 0</returns>
        public int DeleteTags(string sTagID)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@tagID", sTagID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_DeleteTag", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::ManageTags:::DeleteTags:::" + ex.Message);
                return 0;
            }
        }
 
    }
}
