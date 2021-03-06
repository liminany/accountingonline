﻿using System;
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
                if (Request.QueryString["EID"] != null)
                {
                    switch (Request.QueryString["EID"].ToString())
                    {
                        case "1001":
                            div_UserMessage.InnerHtml = "كلمة المرور خطأ الرجاء المحاولة مرة اخرى";
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
                    SendEMail objSendEMail = FormsFunction.SendAndGetEmailTempleteByArabiSkyInfo(0, objEntityRegUsers.UserEmailAddress, EncryptionMethods.Encryption.Decrypt(objEntityRegUsers.UserPassword));
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