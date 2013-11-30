using System;
using System.Net;
using System.Xml;
using DAL;
using Entity;
using NLog;

public partial class signup : System.Web.UI.Page
{

    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    private int _nUserAdsQuta = 10;
    private int _nUserStatus = 1; //if user status 1 then the user activate otherwise user pendding
    private int _nUserType = 0;//if user Type 0 then (user permission is default user otherwise Super User)
    #endregion

    #region Pagelaod
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (FormsFunction.GetCookieData().Length != 0 || Session["UserInfo"] != null)
                {
                    Response.Redirect("/", false);
                }
                else
                {
                    txtUserFullName.Focus();
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("signup:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            EntityRegUsers objEntityRegUsers = new EntityRegUsers();
            UserAuthentication objUserAuthentication = new UserAuthentication();

            objEntityRegUsers.UserCountAds = _nUserAdsQuta;
            objEntityRegUsers.UserType = _nUserType;
            objEntityRegUsers.UserStatus = _nUserStatus;
            objEntityRegUsers.UserEmailAddress = email.Value;
            objEntityRegUsers.UserFullName = txtUserFullName.Value;
            objEntityRegUsers.UserFacebookID = string.Empty;
            objEntityRegUsers.UserMobileNumber = string.Empty;
            objEntityRegUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(password.Value);
            objEntityRegUsers.UserCountry = FormsFunction.GetCookieValueCountryInfo();
            objEntityRegUsers = objUserAuthentication.RegisterNewUserFromClient(objEntityRegUsers);
            if (objEntityRegUsers.UserID < 0)
            {
                div_UserMessage.InnerHtml = "هناك خطأ في النظام الرجاء المحاولة فيما بعد";
            }
            else
            {
                if (objEntityRegUsers.UserID >= 1)
                {
                    Session["UserInfo"] = objEntityRegUsers;
                    Response.Redirect("/", false);
                }
                else
                {
                    div_UserMessage.InnerHtml = "المستخدم موجود من قبل <a href='forgetPassword'>أنقر هنا لإسترجاع كلمة المرور</a>";
                }
            }
        }
        catch (Exception ex)
        {
            div_UserMessage.InnerHtml = "هناك خطأ في النظام الرجاء المحاولة فيما بعد";
            _logger.Error("signup:::btnSubmit_Click:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
    #endregion

    #region PageMethods
    #endregion

}