using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using NLog;

public partial class Admin_Settings : System.Web.UI.Page
{
    #region Variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                Users objUser = (Users)Session["Admin"];
                SiteConfiguration objSiteConfiguration = FormsFunction.RetrieveWebConfig();
                txtSiteName.Text = objSiteConfiguration.SiteName;
                txtSiteMetaDescription.Text = objSiteConfiguration.MetaDescription;
                txtSiteMetaKeywords.Text = objSiteConfiguration.MetaKeywords;
                ddlSiteStstus.SelectedValue = objSiteConfiguration.LogStatus;
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_Default:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnSaveSettings_Click(object sender, EventArgs e)
    {
        try
        {
            SiteConfiguration objSiteConfiguration = new SiteConfiguration();
            objSiteConfiguration.SiteName = txtSiteName.Text;
            objSiteConfiguration.MetaDescription = txtSiteMetaDescription.Text;
            objSiteConfiguration.MetaKeywords = txtSiteMetaKeywords.Text;
            objSiteConfiguration.SiteOffline = ddlSiteStstus.SelectedValue;
            FormsFunction.UpdateWebConfig(objSiteConfiguration);
            hfResetPoral.Value = "true";
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_Default:::btnSaveSettings_Click:::" + ex.Message);
            hfResetPoral.Value = "false";
        }
    }
    #endregion
}