using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NLog;
using System.Web.Services;

public partial class Admin_ContactUs : ParentPage
{
    #region variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                DAL.ContactUs objContactUs = new DAL.ContactUs();
                rptManageContactUs.DataSource = objContactUs.GetAllContactus();
                rptManageContactUs.DataBind();
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_ContactUs:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void lbtnRefreshGV_Click(object sender, EventArgs e)
    {
        try
        {
            DAL.ContactUs objContactUs = new DAL.ContactUs();
            rptManageContactUs.DataSource = objContactUs.GetAllContactus();
            rptManageContactUs.DataBind();
        }
        catch (Exception ex)
        {
            // _logger.Error("Admin_ContactUs:::lbtnRefreshGV_Click:::" + ex.Message);
        }
    }

    #endregion

    #region WebMethods

    [WebMethod]
    public static string DeleteContactUs(string sContactUsID)
    {
        try
        {
            DAL.ContactUs objContactUs = new DAL.ContactUs();
            Entity.ContactUs objEntityContactUs = new Entity.ContactUs();
            objEntityContactUs.ContactUsID = Convert.ToInt32(sContactUsID);
            objContactUs.DeleteContactUs(objEntityContactUs);
            return "true";
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_ContactUs:::DeleteArticlesInfo:::" + ex.Message);
            return "false";
        }
    }
    #endregion
}