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

public partial class Admin_AddCountry : ParentPage
{
    #region Varabiles
    ManageCountry objManageCountry = new ManageCountry();
    EntiryCountry objEntiryCountry = new EntiryCountry();
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ManageCountry objDALManageCountry = new ManageCountry();
                EntiryCountry objEntiryCountry = new EntiryCountry();
                objEntiryCountry.Action = 4;
                rptManageCountry.DataSource = objDALManageCountry.GetAllCountry(objEntiryCountry);
                rptManageCountry.DataBind();
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddCountry:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void lbtnRefreshGV_Click(object sender, EventArgs e)
    {
        try
        {
            ManageCountry objManageCountry = new ManageCountry();
            EntiryCountry objEntiryCountry = new EntiryCountry();
            objEntiryCountry.Action = 4;
            rptManageCountry.DataSource = objManageCountry.GetAllCountry(objEntiryCountry);
            rptManageCountry.DataBind();
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddCountry:::lbtnRefreshGV_Click:::" + ex.Message);
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
    public static string DeleteCountryInfo(string sCountryID)
    {
        try
        {
            ManageCountry objManageCountry = new ManageCountry();
            EntiryCountry objEntiryCountry = new EntiryCountry();
            objEntiryCountry.Action = 3;
            objEntiryCountry.CountryID = int.Parse(sCountryID);
            AddNewCountry enumAddNewCountry = objManageCountry.DeleteCountryInfo(objEntiryCountry);
            if (enumAddNewCountry == AddNewCountry.Success)
                return "true";
            else
                return "false";
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddCountry:::DeleteCountryInfo:::" + ex.Message);
            return "false";
        }
    }
    #endregion
}