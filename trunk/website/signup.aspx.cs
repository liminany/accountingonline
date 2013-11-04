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
    #endregion

    #region Pagelaod
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (FormsFunction.GetCookieData().Length == 0 || string.IsNullOrEmpty(Session["UserInfo"].ToString()))
                {
                    email.Focus();
                }
                else
                {
                    Response.Redirect("Default", false);
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

            objEntityRegUsers.UserCountAds = 20;
            objEntityRegUsers.UserType = 0;
            objEntityRegUsers.UserStatus = 1;
            objEntityRegUsers.UserEmailAddress = email.Value;
            objEntityRegUsers.UserFullName = string.Empty;
            objEntityRegUsers.UserFacebookID = string.Empty;
            objEntityRegUsers.UserMobileNumber = string.Empty; 
            objEntityRegUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(password.Value);
            objEntityRegUsers.UserCountry = GetCountry();
            int nReturnValue = objUserAuthentication.RegisterNewUserFromAdmin(objEntityRegUsers);
            if (nReturnValue == -1)
            {
                div_UserMessage.InnerHtml = "هناك خطأ في النظام الرجاء المحاولة فيما بعد";
            }
            else
            {
                if (nReturnValue == 1)
                {
                    div_UserMessage.InnerHtml = "تم تسجيل الحساب بنجاح <a href='AccountSettings'>أنقر هنا للدخول الى الملف الشخصي</a>";
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
    static public int GetCountry()
    {
        try
        {
            WebClient objWebClient = new WebClient();
            //string sCountryStr = objWebClient.DownloadString("http://api.hostip.info/country.php");
            XmlDocument objXmlDocument = new XmlDocument();
            objXmlDocument.LoadXml(objWebClient.DownloadString("http://ip-json.rhcloud.com/xml"));
            XmlNode node = objXmlDocument.DocumentElement.SelectSingleNode("/Response/country_code");
            if (!string.IsNullOrEmpty(node.InnerText))
            {
                switch (node.InnerText)
                {
                    case "JO":
                        return 12;
                    case "JOR":
                        return 12;
                    case "SA":
                        return 14;
                    case "SAU":
                        return 14;
                    case "PS":
                        return 15;
                    case "PSE":
                        return 15;
                    case "IL":
                        return 15;
                    case "ISR":
                        return 15;
                    default:
                        return 12;
                }
            }
            else
            {
                return 12;
            }
        }
        catch (Exception)
        {
            return 12;
        }
    }
    #endregion

    #region PageMethods
    #endregion

}