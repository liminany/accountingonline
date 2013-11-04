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

public partial class Admin_City : ParentPage
{
    #region Varabiles
    ManageCity objManageCity = new ManageCity();
    EntiryCity objEntiryCity = new EntiryCity();
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
                EntiryCity objEntiryCity = new EntiryCity();
                objEntiryCity.Action = 4;
                rptManageCity.DataSource = objManageCity.GetAllCity(objEntiryCity);
                rptManageCity.DataBind();
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_City:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void lbtnRefreshGV_Click(object sender, EventArgs e)
    {
        try
        {
            ManageCity objManageCity = new ManageCity();
            EntiryCity objEntiryCity = new EntiryCity();
            objEntiryCity.Action = 4;
            rptManageCity.DataSource = objManageCity.GetAllCity(objEntiryCity);
            rptManageCity.DataBind();
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_City:::lbtnRefreshGV_Click:::" + ex.Message);
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
    public static string DeleteCityInfo(string sCityID)
    {
        try
        {
            ManageCity objManageCity = new ManageCity();
            EntiryCity objEntiryCity = new EntiryCity();
            objEntiryCity.Action = 3;
            objEntiryCity.CityID = int.Parse(sCityID);
            AddNewCity enumAddNewCity= objManageCity.DeleteCityInfo(objEntiryCity);
            if (enumAddNewCity == AddNewCity.Success)
                return "true";
            else
                return "false";
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_City:::DeleteCityInfo:::" + ex.Message);
            return "false";
        }
    }
    #endregion
}