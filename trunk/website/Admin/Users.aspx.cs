using System;
using DAL;
using System.Web.Services;
using NLog;
using Entity;

public partial class Admin_Users : ParentPage
{

    private static Logger _logger = LogManager.GetCurrentClassLogger();

    #region Pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            UserAuthentication objUserAuthentication = new UserAuthentication();
            EntityRegUsers objEntityRegUsers = new EntityRegUsers();
            rptManageUser.DataSource = objUserAuthentication.GetAllUser();
            rptManageUser.DataBind();
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_Users:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void lbtnRefreshGV_Click(object sender, EventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
            //_logger.Error("Admin_Users:::lbtnRefreshGV_Click:::" + ex.Message);
        }
    }
        
    #endregion

    #region Methods
    /// <summary>
    /// Convert User Status from Number to text
    /// </summary>
    /// <param name="sUserStatus">set User Status "string value"</param>
    /// <returns>return user status</returns>
    protected string CheckUserStatus(string sUserStatus)
    {
        try
        {
            switch (sUserStatus)
            {
                case "1":
                    return "Active";
                case "0":
                    return "Pending";
                default:
                    return "Unknown";
            }
        }
        catch (Exception)
        {
            return "Unknown";
        }
    }
     
    protected string GetUserStatus(string sUserStatus)
    {
        try
        {
            switch (sUserStatus)
            {
                case "1":
                    return "فعال";
                case "0":
                    return "غير فعال";
                default:
                    return "غير معروف";
            }
        }
        catch (Exception)
        {
            return "غير معروف";
        }
    }

    #endregion

    #region WebMethods

    [WebMethod]
    public static string DeleteUsersInfo(string sUserID)
    {
        try
        {
            UserAuthentication objUserAuthentication = new UserAuthentication();
            EntityRegUsers objEntityRegUsers = new EntityRegUsers();

            int nReturnValue = objUserAuthentication.DeleteUser(sUserID);
            if (nReturnValue == 1)
                return "true";
            else
                return "false";
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_Users:::DeleteUsersInfo:::" + ex.Message);
            return "false";
        }
    }
    #endregion
}