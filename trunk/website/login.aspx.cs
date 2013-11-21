﻿using System;
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
                    //System.Web.HttpCookie cookie = new System.Web.HttpCookie("ArabiSkyCheckCountry");
                    //cookie.Expires = DateTime.Now.AddDays(-1);
                    //cookie.Name = "ArabiSkyCheckCountry";
                    //cookie.Value = null;
                    //Response.Cookies.Add(cookie);
                    //email.Focus();
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

}