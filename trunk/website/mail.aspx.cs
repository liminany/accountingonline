using System;
using DAL;
using Entity;
using NLog;

public partial class mail : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
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
                    if (!string.IsNullOrEmpty(Request.QueryString["messageID"]))
                    {
                        if (FormsFunction.GetCookieData().Length != 0)
                        {
                            UserAuthentication objUserAuthentication = new UserAuthentication();
                            string[] arrUserCookieInfo = FormsFunction.GetCookieData();
                            hfUserID.Value = arrUserCookieInfo[0].ToString();
                        }
                        else
                        {
                            UserAuthentication objUserAuthentication = new UserAuthentication();
                            EntityRegUsers objEntityRegUsers = (EntityRegUsers)Session["UserInfo"];
                            objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(objEntityRegUsers.UserID);
                            hfUserID.Value = objEntityRegUsers.UserID.ToString();
                        }
                        DBUserMessages objDBUserMessages = new DBUserMessages();
                        objDBUserMessages.ReadEmailAndChangeFlag(Request.QueryString["messageID"].ToString());
                        foreach (System.Data.DataRow rowItemMessage in objDBUserMessages.ReadEmail(Convert.ToInt32(Request.QueryString["messageID"].ToString()), Convert.ToInt32(hfUserID.Value)).Tables[0].Rows)
                        {
                            ahrefUserProfile.HRef = "UserProfile?UserID=" + rowItemMessage["UserID"].ToString();
                            Page.Title = rowItemMessage["MessageTitle"].ToString() + "- ArabiSky.com";
                            Page.MetaDescription = rowItemMessage["MessageTitle"].ToString() + "- ArabiSky.com | موقع سماء العرب";
                            spMessageTitle.InnerHtml = rowItemMessage["MessageTitle"].ToString();
                            spUserFullName.InnerText = rowItemMessage["sender"].ToString();
                            div_EmailBody.InnerHtml = rowItemMessage["MessageBody"].ToString();
                            hfSendToUserID.Value = rowItemMessage["UserID"].ToString();
                            if (string.IsNullOrEmpty(rowItemMessage["User_Image"].ToString()))
                            {
                                imgUserProfile.Src = "images/ArabiSkyUnknowUser.png";
                            }
                            else
                            {
                                imgUserProfile.Src = rowItemMessage["User_Image"].ToString();
                            }
                        }
                    }
                    else
                    {
                        Response.Redirect("Inbox", false);
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
            _logger.Error("mail:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        try
        {
            DBUserMessages objDBUserMessages = new DBUserMessages();
            UserMessages objUserMessages = new UserMessages();
            objUserMessages.MessageUserID = Convert.ToInt32(hfSendToUserID.Value);
            objUserMessages.MessageSendUsers = Convert.ToInt32(hfUserID.Value);
            objUserMessages.MessageTitle = txtMessageTitle.Value;
            objUserMessages.MessageBody = editor.Value;
            objDBUserMessages.SendNewMessageForUser(objUserMessages);
        }
        catch (Exception ex)
        {
            _logger.Error("mail:::btnSendMessage_Click:::" + ex.Message);
        }
    }
    #endregion
}