using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Entity.Country;
using Entity;
using NLog;
using System.Web.Services;

public partial class Admin_Categories : ParentPage
{
    #region Varabiles
    ManageCategory objManageCategory = new ManageCategory();
    Category objEntiryCategory = new Category();
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                rptManageCategory.DataSource = objManageCategory.GetAllCategory();
                rptManageCategory.DataBind();
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_Categories:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void lbtnRefreshGV_Click(object sender, EventArgs e)
    {
        try
        {
            rptManageCategory.DataSource = objManageCategory.GetAllCategory();
            rptManageCategory.DataBind();
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_Categories:::lbtnRefreshGV_Click:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
    protected string CheckCategoriesStatus(string sCategoriesStatus)
    {
        try
        {
            switch (sCategoriesStatus)
            {
                case "1":
                    return "فعال";
                case "0":
                    return "موقوفة";
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
    public static string DeleteCategoriesInfo(string sCategoryID)
    {
        try
        {
            ManageCategory objManageCategory = new ManageCategory();
            Category objEntiryCategory = new Category();
            objEntiryCategory.CategoryID = int.Parse(sCategoryID);
            int nReturnValue = objManageCategory.DeleteCategory(sCategoryID);
            if (nReturnValue == 1)
                return "true";
            else
                return "false";
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_Categories:::DeleteCategoriesInfo:::" + ex.Message);
            return "false";
        }
    }
    #endregion
}