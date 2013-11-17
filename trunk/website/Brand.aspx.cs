using System;
using System.Web.UI;
using NLog;

public partial class Brand : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    //UserAuthentication objUserAuthentication = new UserAuthentication();
    //EntityRegUsers objEntityRegUsers = new EntityRegUsers();
    #endregion

    #region Pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                spPageTitle.InnerHtml = "انواع سيارات";
                Page.Title = "سوق سماء العرب | انواع سيارات";
                Page.MetaDescription = "سوق سماء العرب | ArabiSky.com | انواع سيارات";
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Brand:::Page_Load:::" + ex.Message);
        }
    }
    #endregion
}