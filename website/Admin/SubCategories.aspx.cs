using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL; 
using NLog;
using System.Web.Services;
using Entity.City;
using Entity;

public partial class Admin_SubCategories : ParentPage
{
    #region Varabiles
    ManageSubCategory objManageSubCategory = new ManageSubCategory();
    SubCategory objSubCategory = new SubCategory();
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                rptManageSubCategories.DataSource = objManageSubCategory.GetAllSubCategory();
                rptManageSubCategories.DataBind();
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_SubCategories:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void lbtnRefreshGV_Click(object sender, EventArgs e)
    {
        try
        {
            rptManageSubCategories.DataSource = objManageSubCategory.GetAllSubCategory();
            rptManageSubCategories.DataBind();
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_SubCategories:::lbtnRefreshGV_Click:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
    protected string CheckCountryStatus(string sCountryStatus)
    {
        try
        {
            switch (sCountryStatus)
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
    public static string DeleteSubCategoriesInfo(string sSubCategories)
    {
        try
        {
            ManageSubCategory objManageSubCategory = new ManageSubCategory();
            SubCategory objSubCategory = new SubCategory();
            objSubCategory.SubCategoryID = int.Parse(sSubCategories);
            int nReturnValue = objManageSubCategory.DeleteSubCategory(sSubCategories);
            if (nReturnValue == 1)
                return "true";
            else
                return "false";
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_SubCategories:::DeleteSubCategoriesInfo:::" + ex.Message);
            return "false";
        }
    }
    #endregion
}