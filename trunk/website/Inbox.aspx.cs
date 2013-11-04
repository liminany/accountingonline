using System;
using System.Web.Services;
using DAL;
using Entity;
using NLog;
using System.Data;

public partial class Inbox : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    DBUserMessages objDBUserMessages = new DBUserMessages();
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
                    if (FormsFunction.GetCookieData().Length != 0)
                    {
                        UserAuthentication objUserAuthentication = new UserAuthentication();
                        string[] arrUserCookieInfo = FormsFunction.GetCookieData();
                        objEntityRegUsers = new EntityRegUsers();
                        objEntityRegUsers.UserID = Convert.ToInt32(arrUserCookieInfo[0].ToString());
                    }
                    else
                    {
                        UserAuthentication objUserAuthentication = new UserAuthentication();
                        objEntityRegUsers = (EntityRegUsers)Session["UserInfo"];
                    }

                    DataSet dsPrivateEmail = objDBUserMessages.GetAllUserEmailByUserID(objEntityRegUsers.UserID);
                    if (dsPrivateEmail.Tables[0].Rows.Count > 0)
                    {
                        div_EmailTable.Style.Add("display", "");
                        div_EmptyEmailTable.Style.Add("display", "none");
                        rptMyEmail.DataSource = dsPrivateEmail;
                        rptMyEmail.DataBind();
                    }
                    else
                    {
                        div_EmailTable.Style.Add("display", "none");
                        div_EmptyEmailTable.Style.Add("display", "");
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
            _logger.Error("Inbox:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void lbtnRefreshGV_Click(object sender, EventArgs e)
    {
        try
        {
            rptMyEmail.DataSource = objDBUserMessages.GetAllUserEmailByUserID(objEntityRegUsers.UserID);
            rptMyEmail.DataBind();
        }
        catch (Exception ex)
        {
            _logger.Error("Inbox:::lbtnRefreshGV_Click:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
    protected string GetUserImageProfile(string sUserImageProfile)
    {
        try
        {
            if (string.IsNullOrEmpty(sUserImageProfile))
            {
                return "images/ArabiSkyUnknowUser.png";
            }
            else
            {
                return sUserImageProfile;
            }
        }
        catch (Exception)
        {
            return "غير معروف";
        }
    }
    protected string GetMessageStatus(string sMessageFlag)
    {
        try
        {
            if (sMessageFlag == "0")
            {
                return "font-weight: bolder; height: 60px; cursor: pointer;";
            }
            else
            {
                return sMessageFlag;
            }
        }
        catch (Exception)
        {
            return "غير معروف";
        }
    }
    #endregion

    #region WebMethods
    [WebMethod]
    public static string DeleteMessageInfo(string sMessageID)
    {
        try
        {
            DBUserMessages objDBUserMessages = new DBUserMessages();
            int nRetuenValue = objDBUserMessages.DeleteUserMessage(sMessageID);
            if (nRetuenValue == 1)
            {
                return "true";
            }
            else
            {
                return "false";
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Inbox:::DeleteMessageInfo:::" + ex.Message);
            return "false";
        }
    }
    #endregion
}