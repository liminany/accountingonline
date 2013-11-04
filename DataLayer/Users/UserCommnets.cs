using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entity;
using DALC4NET;
using NLog;
using System.Data;

namespace DAL
{
    public class UserCommnets
    {
        #region Variables
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;
        #endregion

        public UserCommnets()
        {
            _dbHelper = DBHelper.GetInstance();
        }

        #region Methods

        public int InsertNewComment(UsersComments objUsersComments)
        {
            try
            {
                int rowsAffected = 0;

                DBParameter param1 = new DBParameter("@category_ID", objUsersComments.CategoryID);
                DBParameter param2 = new DBParameter("@articls_ID", objUsersComments.ArticlsID);
                DBParameter param3 = new DBParameter("@userFullName", objUsersComments.UserFullName);
                DBParameter param4 = new DBParameter("@userEmailAddress", objUsersComments.EmailAddress);
                DBParameter param5 = new DBParameter("@userComment", objUsersComments.UserComments); 

                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                paramCollection.Add(param3);
                paramCollection.Add(param4);
                paramCollection.Add(param5);

                rowsAffected = _dbHelper.ExecuteNonQuery("sp_InsertComment", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserCommnets:::InsertNewComment:::" + ex.Message);
                objUsersComments = null;
                throw;
            }
        }

        public int ApproveComment(UsersComments objUsersComments)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@commentID", objUsersComments.CommentID); 
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_AprovalComment", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserCommnets:::ApproveComment:::" + ex.Message);
                objUsersComments = null;
                throw;
            }
        }

        public int RejectedComment(UsersComments objUsersComments)
        {
            try
            {
                int rowsAffected = 0;
                DBParameter param1 = new DBParameter("@commentID", objUsersComments.CommentID); 
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1); 
                rowsAffected = _dbHelper.ExecuteNonQuery("sp_RejectedComment", paramCollection, CommandType.StoredProcedure);
                return rowsAffected;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserCommnets:::RejectedComment:::" + ex.Message);
                objUsersComments = null;
                throw;
            }
        }

        public DataSet GetComment()
        {
            try
            {
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("SP_GetAllUserCommentFull", CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserCommnets:::GetComment:::" + ex.Message);
                throw;
            }
        }

        public DataSet GetAllCommentsForOwnArtics(int nCategoriesID, int nArticlsID)
        {
            try
            {
                DBParameter param1 = new DBParameter("@category_ID", nCategoriesID);
                DBParameter param2 = new DBParameter("@articls_ID", nArticlsID);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                DataSet dsReturnAllUser = _dbHelper.ExecuteDataSet("SP_GetAllCommentsForOwnArtics", paramCollection, CommandType.StoredProcedure);
                return dsReturnAllUser;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::UserCommnets:::GetAllCommentsForOwnArtics:::" + ex.Message);
                throw;
            }
        }

        #endregion
    }
}
