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
                if (Request.QueryString["EID"] != null)
                {
                    switch (Request.QueryString["EID"].ToString())
                    {
                        case "1002":
                            div_UserMessage.InnerHtml = "كلمة المرور خطأ الرجاء المحاولة مرة اخرى";
                            break;
                        case "1003":
                            div_UserMessage.InnerHtml = "الحساب موقوف حاليا الرجاء مراجعة إدراة الموقع&nbsp;<a href='mailto:info@arabisky.com'>info@arabisky.com</a>";
                            break;
                        default:
                            break;
                    }
                }
                else
                {
                    if (FormsFunction.GetCookieData().Length != 0 || Session["UserInfo"] != null)
                    {
                        Response.Redirect("/", false);
                    }
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
            div_UserMessage.InnerHtml = string.Empty;
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

}