using System;
using DAL;
using Entity;
using NLog;
using System.Web.Services;

public partial class UserProfile : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    UserAuthentication objUserAuthentication = new UserAuthentication();
    EntityRegUsers objEntityRegUsers = new EntityRegUsers();
    #endregion

    #region Pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (FormsFunction.GetCookieData().Length != 0 || Session["UserInfo"] != null)
                {
                    string sQueryStringAdsID = Request.QueryString["UserID"];
                    if (!string.IsNullOrEmpty(sQueryStringAdsID))
                    {
                        #region GetMainUserID
                        if (FormsFunction.GetCookieData().Length != 0)
                        {
                            string[] arrUserCookieInfo = FormsFunction.GetCookieData();
                            hfUserID.Value = arrUserCookieInfo[0].ToString();
                        }
                        else
                        {
                            objEntityRegUsers = (EntityRegUsers)Session["UserInfo"];
                            hfUserID.Value = objEntityRegUsers.UserID.ToString();
                        }

                        #endregion

                        hfUserProfileID.Value = objEntityRegUsers.UserID.ToString();
                        objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(Request.QueryString["UserID"].ToString()));
                        if (string.IsNullOrEmpty(objEntityRegUsers.UserImage))
                        {
                            imgUserProfile.Src = "images/ArabiSkyUnknowUser.png";
                        }
                        else
                        {
                            imgUserProfile.Src = objEntityRegUsers.UserImage;
                        }
                        aEmailAddress.InnerHtml = objEntityRegUsers.UserEmailAddress;
                        sp_UserFullName.InnerHtml = objEntityRegUsers.UserFullName;
                        Page.Title = "موقع سماء العرب - " + objEntityRegUsers.UserFullName;
                        Page.Title = "موقع سماء العرب - ArabiSky.com - " + objEntityRegUsers.UserFullName;
                        spCreateDate.InnerHtml = objEntityRegUsers.CreateDateTime.ToShortDateString();

                        DBAdsManager objDBAdsManager = new DBAdsManager();
                        rptUserAds.DataSource = objDBAdsManager.GetUserProfileAds(int.Parse(Request.QueryString["UserID"].ToString()));
                        rptUserAds.DataBind();
                    }
                }
                else
                {
                    Response.Redirect("login", false);
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("UserProfile:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void lbtnRefreshGV_Click(object sender, EventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
            _logger.Error("UserProfile:::lbtnRefreshGV_Click:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
    protected string CheckImage(string sImageURL)
    {
        try
        {
            string[] images = sImageURL.Split('|');
            if (!string.IsNullOrEmpty(images[0]))
            {
                return images[0].ToString().Replace("~", "");
            }
            else
            {
                return "images/ArabiSkyLogo.png";
            }
        }
        catch (Exception)
        {
            return "null";
        }
    }
    #endregion
    #region WebMethods

    #endregion
}