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
                       
                        if (!string.IsNullOrEmpty(objEntityRegUsers.UserFacebookID))
                        {
                            imgUserProfile.Src = string.Format("https://graph.facebook.com/{0}/picture?type=large", objEntityRegUsers.UserFacebookID);
                        }
                        else
                        {
                            if (string.IsNullOrEmpty(objEntityRegUsers.UserImage))
                            {
                                imgUserProfile.Src = "images/ArabiSkyUnknowUser.png";
                            }
                            else
                            {
                                imgUserProfile.Src = objEntityRegUsers.UserImage;
                            }
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
    protected string GenerateURL(object strId, object Title)
    {
        string strTitle = Title.ToString();
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = strTitle.ToLower();
        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace("vb.net", "VB-Net");
        strTitle = strTitle.Replace("asp.net", "Asp-Net");
        strTitle = strTitle.Replace(".", "-");
        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();
            if (strTitle.Contains(strChar))
            {
                strTitle = strTitle.Replace(strChar, string.Empty);
            }
        }
        strTitle = strTitle.Replace(" ", "-");
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("-----", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = string.Format("ViewAds/{0}/{1}", strId, strTitle);
        return strTitle;
    }

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
    protected string GenerateURL(object strId, object Title)
    {
        string strTitle = Title.ToString();
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = strTitle.ToLower();
        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace("vb.net", "VB-Net");
        strTitle = strTitle.Replace("asp.net", "Asp-Net");
        strTitle = strTitle.Replace(".", "-");
        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();
            if (strTitle.Contains(strChar))
            {
                strTitle = strTitle.Replace(strChar, string.Empty);
            }
        }
        strTitle = strTitle.Replace(" ", "-");
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("-----", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = string.Format("ViewAds?AdsID={0}&AdsTitle={1}", strId, strTitle);
        return strTitle;
    }
    #endregion

    #region WebMethods

    #endregion
}