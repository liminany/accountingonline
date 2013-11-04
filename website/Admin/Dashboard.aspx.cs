using System;
using DAL;
using System.Web.Services;
using NLog;
using Entity;
using System.Data;

public partial class Admin_Default : ParentPage
{

    private static Logger _logger = LogManager.GetCurrentClassLogger();

    #region Pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            DBDashboardStatstic objDBDashboardStatstic = new DBDashboardStatstic();
            DataSet dsDataSetDashboardStatstic = objDBDashboardStatstic.GetHeaderDashboardStatistic(DateTime.Now.AddYears(-1).ToString(), DateTime.Now.Date.ToString());

            sp_UserRegister.InnerHtml = dsDataSetDashboardStatstic.Tables[0].Rows[0].ItemArray[0].ToString() + " مستخدم ";
            sp_UserPennding.InnerHtml = dsDataSetDashboardStatstic.Tables[1].Rows[0].ItemArray[0].ToString() + " مستخدم ";
            sp_AdsRegister.InnerHtml = dsDataSetDashboardStatstic.Tables[2].Rows[0].ItemArray[0].ToString() + " إعلان ";
            sp_AdsPennding.InnerHtml = dsDataSetDashboardStatstic.Tables[3].Rows[0].ItemArray[0].ToString() + " إعلان ";

            foreach (DataRow item in dsDataSetDashboardStatstic.Tables[4].Rows)
            {
                hfCatCount.Value += item[1].ToString() + "|";
            }
            hfCatCount.Value = hfCatCount.Value.Substring(0, hfCatCount.Value.Length - 1);


            DALUsers objDALUsers = new DALUsers();
            rptManageUser.DataSource = objDALUsers.GetAllUser();
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

    /// <summary>
    /// Convert User Permission from Number to text
    /// </summary>
    /// <param name="sUserPermission">set User Status "string value"</param>
    /// <returns>return user Permission</returns>
    protected string GetUserPermission(string sUserPermission)
    {
        try
        {
            switch (sUserPermission)
            {
                case "1":
                    return "User";
                case "0":
                    return "Admin";
                default:
                    return "Unknown";
            }
        }
        catch (Exception)
        {
            return "Unknown";
        }
    }

    #endregion

    #region WebMethods

    [WebMethod]
    public static string DeleteAdminInfo(string sUserID)
    {
        try
        {
            DALUsers objDALUsers = new DALUsers();
            int nReturnValue = objDALUsers.DeleteUser(sUserID);
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