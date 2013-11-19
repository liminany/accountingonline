using System;
using NLog;

public partial class logout : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region Pageload

    protected void Page_Init(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.AddHeader("pragma", "no-cache");
        Response.AddHeader("Cache-Control", "no-cache");
        Response.CacheControl = "no-cache";
        Response.Expires = -1;
        Response.ExpiresAbsolute = DateTime.Now.AddSeconds(-1);
        Response.Cache.SetNoStore();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Session["UserInfo"] = null;
            Session.Remove("UserInfo");
            RemoveCookie("ArabiSkyCookie");
            RemoveCookie("ArabiSkyCountry2013 ");
            Session.Abandon();
            Response.Redirect("Login", false);
        }
        catch (Exception ex)
        {
            _logger.Error("logout:::Page_Load:::" + ex.Message);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="cookieName"></param>
    private void RemoveCookie(string cookieName)
    {
        try
        {
            System.Web.HttpCookie cookie = new System.Web.HttpCookie(cookieName);
            cookie.Expires = DateTime.Now.AddDays(-1);
            cookie.Name = cookieName;
            cookie.Value = null;
            Response.Cookies.Add(cookie);
        }
        catch (Exception ex)
        {
            _logger.Error("logout:::RemoveCookie:::" + ex.Message);
        }
    }

    #endregion
}