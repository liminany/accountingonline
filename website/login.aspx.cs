using System;
using DAL;
using Entity;
using NLog;

public partial class login : System.Web.UI.Page
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
                if (FormsFunction.GetCookieData().Length != 0 || Session["UserInfo"] != null)
                {
                    Response.Redirect("/", false);
                }
                else
                {
                    System.Web.HttpCookie cookie = new System.Web.HttpCookie("ArabiSkyCountry2013");
                    cookie.Expires = DateTime.Now.AddDays(-1);
                    cookie.Name = "ArabiSkyCountry2013";
                    cookie.Value = null;
                    Response.Cookies.Add(cookie);
                    SetCookieCountry();
                    email.Focus();
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("login:::Page_Load:::" + ex.Message);
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
            objEntityRegUsers.UserEmailAddress = email.Value;
            objEntityRegUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(password.Value);
            objEntityRegUsers = objUserAuthentication.ClientLoginUser(objEntityRegUsers);
            if (objEntityRegUsers.UserID == 0)
            {
                div_UserMessage.InnerHtml = "كلمة المرور خطأ الرجاء المحاولة مرة اخرى";
            }
            else
            {
                if (objEntityRegUsers.UserStatus == 0)
                {
                    div_UserMessage.InnerHtml = "الحساب موقوف حاليا الرجاء مراجعة إدراة الموقع&nbsp;<a href='mailto:info@arabisky.com'>info@arabisky.com</a>";
                }
                else
                {
                    Session["UserInfo"] = objEntityRegUsers;
                    if (cboxRemmberMe.Checked)
                    {
                        FormsFunction.SetCookieValue(objEntityRegUsers.UserID.ToString(), objEntityRegUsers.UserFullName, objEntityRegUsers.UserEmailAddress, objEntityRegUsers.UserPassword);
                    }
                    Response.Redirect("/", false);
                }
            }

        }
        catch (Exception ex)
        {
            _logger.Error("login:::btnSubmit_Click:::" + ex.Message);
        }
    }
    #endregion

    #region PageMethods
    private void SetCookieCountry()
    {
        //Code that runs when a new session is started
        if (FormsFunction.GetCookieData().Length == 0)
        {
            try
            {
                if (!string.IsNullOrEmpty(FormsFunction.GetCountryName()))
                {
                    switch (FormsFunction.GetCountryName())
                    {
                        case "JO":
                            FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
                            break;
                        case "JOR":
                            FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
                            break;
                        case "SA":
                            FormsFunction.SetCookieValueCountryInfo(14, "المملكة العربية السعودية");
                            break;
                        case "SAU":
                            FormsFunction.SetCookieValueCountryInfo(14, "المملكة العربية السعودية");
                            break;
                        case "PS":
                            FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
                            break;
                        case "PSE":
                            FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
                            break;
                        case "IL":
                            FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
                            break;
                        case "ISR":
                            FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
                            break;
                        default:
                            FormsFunction.SetCookieValueCountryInfo(14, "المملكة العربية السعودية");
                            break;
                    }
                }
                else
                {
                    FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
                }
            }
            catch (Exception)
            {
                FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
            }
        }
    }
    #endregion
}