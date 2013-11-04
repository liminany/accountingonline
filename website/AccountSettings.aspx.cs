using System;
using DAL;
using Entity;
using NLog;

public partial class AccountSettings : System.Web.UI.Page
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
                    //ManageCountry objDALManageCountry = new ManageCountry();
                    //EntiryCountry objEntiryCountry = new EntiryCountry();
                    //UserAuthentication objUserAuthentication = new UserAuthentication();
                    //objEntiryCountry.Action = 6;
                    //FormsFunction.BindDDL(ref ddlCountryName, objDALManageCountry.GetAllCountry(objEntiryCountry), "CountryName", "CountryID", "إختر البلد");
                    if (FormsFunction.GetCookieData().Length != 0)
                    {
                        UserAuthentication objUserAuthentication = new UserAuthentication();
                        string[] arrUserCookieInfo = FormsFunction.GetCookieData();
                        EntityRegUsers objEntityRegUsers = new EntityRegUsers();
                        objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(arrUserCookieInfo[0].ToString()));
                        hfUserID.Value = objEntityRegUsers.UserID.ToString();
                        if (objEntityRegUsers.UserFullName.Contains("UserID "))
                            txtUserFullName.Value = string.Empty;
                        else
                            txtUserFullName.Value = objEntityRegUsers.UserFullName;
                        txtUserEmailAddress.Value = objEntityRegUsers.UserEmailAddress;
                        txtUserAdsQuta.Value = objEntityRegUsers.UserCountAds.ToString();
                        txtUserAdsCount.Value = objEntityRegUsers.CountAdsUsed.ToString();


                        txtUserMobilePhoneNumber.Value = objEntityRegUsers.UserMobileNumber;
                        if (string.IsNullOrEmpty(objEntityRegUsers.UserImage))
                        {
                            imgUserProfile.Src = "images/ArabiSkyUnknowUser.png";
                        }
                        else
                        {
                            imgUserProfile.Src = objEntityRegUsers.UserImage;
                        }
                    }
                    else
                    {
                        UserAuthentication objUserAuthentication = new UserAuthentication();
                        EntityRegUsers objEntityRegUsers = (EntityRegUsers)Session["UserInfo"];
                        objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(objEntityRegUsers.UserID);
                        hfUserID.Value = objEntityRegUsers.UserID.ToString();
                        if (objEntityRegUsers.UserFullName.Contains("UserID "))
                        {
                            txtUserFullName.Value = string.Empty;
                        }
                        else
                        {
                            txtUserFullName.Value = objEntityRegUsers.UserFullName;
                        }
                        txtUserEmailAddress.Value = objEntityRegUsers.UserEmailAddress;
                        txtUserAdsQuta.Value = objEntityRegUsers.UserCountAds.ToString();
                        txtUserMobilePhoneNumber.Value = objEntityRegUsers.UserMobileNumber;
                        if (string.IsNullOrEmpty(objEntityRegUsers.UserImage))
                        {
                            imgUserProfile.Src = "images/ArabiSkyUnknowUser.png";
                        }
                        else
                        {
                            imgUserProfile.Src = objEntityRegUsers.UserImage;
                        }
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
            _logger.Error("AccountSettings:::Page_Load:::" + ex.Message);
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
            objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(hfUserID.Value));
            objEntityRegUsers.UserFullName = txtUserFullName.Value;
            objEntityRegUsers.UserEmailAddress = txtUserEmailAddress.Value;
            objEntityRegUsers.UserMobileNumber = txtUserMobilePhoneNumber.Value;
            if (upFileUserProfile.HasFile)
            {
                upFileUserProfile.SaveAs(Server.MapPath("ArabiSkyImages/UserProfile/" + upFileUserProfile.FileName));
                objEntityRegUsers.UserImage = "ArabiSkyImages/UserProfile/" + upFileUserProfile.FileName;
                imgUserProfile.Src = objEntityRegUsers.UserImage;
            }
            int nReturnValue = objUserAuthentication.EditUserInfo(objEntityRegUsers);
            if (nReturnValue == 1)
            {
                tr_UserMessage_1.InnerHtml = "تم تعديل معلومات حسابك بنجاح";
            }
            else
            {
                tr_UserMessage_1.InnerHtml = "هناك خطأ في تعديل بيانات حسابك الرجاء المحاولة فيما بعد";
            }
        }
        catch (Exception ex)
        {
            tr_UserMessage_1.InnerHtml = "هناك خطأ في تعديل بيانات حسابك الرجاء المحاولة فيما بعد";
            _logger.Error("AccountSettings:::btnSubmit_Click:::" + ex.Message);
        }
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        try
        {
            EntityRegUsers objEntityRegUsers = new EntityRegUsers();
            UserAuthentication objUserAuthentication = new UserAuthentication();
            objEntityRegUsers.UserID = Convert.ToInt32(hfUserID.Value);
            objEntityRegUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(txtPassword.Value);
            int nReturnValue = objUserAuthentication.EditUserPasswordFormClient(objEntityRegUsers);
            if (nReturnValue == 1)
            {
                tr_UserMessage_2.InnerHtml = "تم تعديل كلمة المرور بنجاح";
            }
            else
            {
                tr_UserMessage_2.InnerHtml = "هناك خطأ في تعديل كلمة المرور لحسابك الرجاء المحاولة فيما بعد";
            }
        }
        catch (Exception ex)
        {
            tr_UserMessage_2.InnerHtml = "هناك خطأ في تعديل كلمة المرور لحسابك الرجاء المحاولة فيما بعد";
            _logger.Error("AccountSettings:::btnChangePassword_Click:::" + ex.Message);
        }
    }
    //protected void ddlCountryName_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        ManageCity objManageCity = new ManageCity();
    //        EntiryCity objEntiryCity = new EntiryCity();
    //        objEntiryCity.Action = 6;
    //        objEntiryCity.CityStatus = 1;
    //        objEntiryCity.CityName = string.Empty;
    //        objEntiryCity.Country_FK_ID = int.Parse(ddlCountryName.SelectedValue);
    //        FormsFunction.BindDDL(ref ddlCityName, objManageCity.GetAllCityByCountryID(objEntiryCity), "CityName", "CityID", "إختر المدينة");
    //    }
    //    catch (Exception ex)
    //    {
    //        _logger.Error("_Default:::ddlCountryName_SelectedIndexChanged:::" + ex.Message);
    //    }
    //}
    #endregion

    #region Methods
    #endregion
}