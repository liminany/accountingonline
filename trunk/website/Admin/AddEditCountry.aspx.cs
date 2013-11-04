using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Entity.Country;
using NLog;
using Entity;

public partial class Admin_AddEditCountry : ParentPage
{
    #region Varabiles
    ManageCountry objDALManageCountry = new ManageCountry();
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
                if (Request.Url.AbsoluteUri.IndexOf("CountryID=") >= 0)
                {
                    objEntiryCountry.Action = 5;
                    objEntiryCountry.CountryID = Convert.ToInt16(Request.QueryString["CountryID"].ToString());
                    objEntiryCountry = objDALManageCountry.GetCountryInfoByID(objEntiryCountry);
                    txtCountryName.Text = objEntiryCountry.CountryName;
                    ddlCountryStatus.SelectedValue = objEntiryCountry.CountryStatus.ToString();
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

            if (Request.RawUrl.IndexOf("CountryID=") >= 0)
            {
                objEntiryCountry.CountryID = Convert.ToInt16(Request.QueryString["CountryID"].ToString());
                objEntiryCountry.Action = 2;
                objEntiryCountry.CountryName = txtCountryName.Text;
                objEntiryCountry.CountryStatus = ddlCountryStatus.SelectedIndex;

                AddNewCountry objAddNewCountry = objDALManageCountry.EditCountryInfo(objEntiryCountry);
                if (objAddNewCountry == AddNewCountry.Success)
                {
                    tr_UserMessage.InnerHtml = "Edit CountryID Successfully";
                    Response.Redirect("Country", false);
                }
                else
                {
                    tr_UserMessage.InnerHtml = "you have issues please contact the system support";
                }
            }
            else
            {
                objEntiryCountry.CountryID = 0;
                objEntiryCountry.CountryName = txtCountryName.Text;
                objEntiryCountry.CountryStatus = ddlCountryStatus.SelectedIndex;
                objEntiryCountry.Action = 1;
                AddNewCountry entityAddNewCountry = objDALManageCountry.AddNewCountry(objEntiryCountry);
                Response.Redirect("Country", false);
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddCategory:::btnSubmit_Click:::" + ex.Message);
        }
    }
    #endregion
}