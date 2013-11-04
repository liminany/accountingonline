using System;
using System.Web;
using Entity;
using NLog;
using DAL;
public partial class Admin_Login : System.Web.UI.Page
{

    private static Logger _logger = LogManager.GetCurrentClassLogger();

    #region Pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.Url.AbsoluteUri.IndexOf("errorCode=") >= 0)
            {
                switch (Request.QueryString["errorCode"].ToString())
                {
                    case "0":
                        div_ErrorCode.InnerHtml = "Invalid Username or password please try again.";
                        break;
                    default:
                        div_ErrorCode.InnerHtml = "";
                        Response.Redirect("login", false);
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_Login:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string aa = EncryptionMethods.Encryption.Encrypt("admin");
            Users objUsers = new Users();
            objUsers.UserEmailAddress = username.Value;
            objUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(password.Value);
            UserAuthentication objUserAuthentication = new UserAuthentication();
            int nReturnValue = objUserAuthentication.AdminLoginUser(objUsers);
            if (nReturnValue == 1)
            {
                Users objUser = objUserAuthentication.GetUserInfo(username.Value); 
                Session["Admin"] = objUser; 
                if (Request.QueryString["BURL"] != null && Request.QueryString["BURL"].ToString() != string.Empty)
                {
                    HttpContext.Current.Response.Redirect(Request.QueryString["BURL"].ToString(), false);
                }
                else
                {

                    HttpContext.Current.Response.Redirect("Dashboard", false);
                }
            }
            else
            {
                Response.Redirect("login?errorCode=0", false);
            }

        }
        catch (Exception ex)
        {
            _logger.Error("Admin_Login:::btnLogin_Click:::" + ex.Message);
        }
    }
    #endregion
}