using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using DAL;
using Entity.Country;
using NLog;
using Entity.City;

public partial class Admin_AddEditCity : ParentPage
{
    #region Varabiles
    ManageCity objManageCity = new ManageCity();
    ManageCountry objManageCountry = new ManageCountry();

    EntiryCity objEntiryCity = new EntiryCity();
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
                objEntiryCountry.Action = 6;
                FormsFunction.BindDDL(ref ddlCountryName, objManageCountry.GetAllCountry(objEntiryCountry), "CountryName", "CountryID", "إختر البلد");

                if (Request.Url.AbsoluteUri.IndexOf("CityID=") >= 0)
                {
                    objEntiryCity.Action = 5;
                    objEntiryCity.CityID = Convert.ToInt16(Request.QueryString["CityID"].ToString());
                    objEntiryCity.CityStatus = 0;
                    objEntiryCity.CityName = "";
                    objEntiryCity.Country_FK_ID = 0;

                    objEntiryCity = objManageCity.GetCityInfoByID(objEntiryCity);
                    txtCityName.Text = objEntiryCity.CityName;
                    ddlCityStatus.SelectedValue = objEntiryCity.CityStatus.ToString();
                    ddlCountryName.SelectedValue = objEntiryCity.Country_FK_ID.ToString();
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddCountry:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {

            if (Request.RawUrl.IndexOf("CityID=") >= 0)
            {
                objEntiryCity.CityID = Convert.ToInt16(Request.QueryString["CityID"].ToString());
                objEntiryCity.Action = 2;
                objEntiryCity.CityName = txtCityName.Text;
                objEntiryCity.CityStatus = ddlCityStatus.SelectedIndex;
                objEntiryCity.Country_FK_ID = int.Parse(ddlCountryName.SelectedValue);

                AddNewCity objAddNewCity = objManageCity.EditCityInfo(objEntiryCity);
                if (objAddNewCity == AddNewCity.Success)
                {
                    tr_UserMessage.InnerHtml = "Edit City Successfully";
                    Response.Redirect("City", false);
                }
                else
                {
                    tr_UserMessage.InnerHtml = "you have issues please contact the system support";
                }
            }
            else
            {
                objEntiryCity.CityID = 0;
                objEntiryCity.CityName = txtCityName.Text;
                objEntiryCity.CityStatus = ddlCityStatus.SelectedIndex;
                objEntiryCity.Country_FK_ID = int.Parse(ddlCountryName.SelectedValue);
                objEntiryCity.Action = 1;
                AddNewCity entityAddNewCity = objManageCity.AddNewCityInfo(objEntiryCity);
                Response.Redirect("City", false);
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddCategory:::btnSubmit_Click:::" + ex.Message);
        }
    }
    #endregion
}