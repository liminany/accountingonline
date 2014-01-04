using System;
using DAL;
using Entity;
using NLog;
using System.Net;
using Entity.City;

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
                    #region Fill DropDown List
                    ManageCity objManageCity = new ManageCity();
                    EntiryCity objEntiryCity = new EntiryCity();
                    ManageCategory objManageCategory = new ManageCategory();
                    ManageSubCategory objManageSubCategory = new ManageSubCategory();
                    objEntiryCity.Action = 6;
                    objEntiryCity.CityStatus = 1;
                    objEntiryCity.CityName = string.Empty;
                    objEntiryCity.Country_FK_ID = GetCountry();
                    FormsFunction.BindDDL(ref ddlCategoryName, objManageCategory.GetAllCategory(), "CatName", "Cat_ID", "إختر القسم");
                    #endregion

                    if (FormsFunction.GetCookieData().Length != 0)
                    {
                        UserAuthentication objUserAuthentication = new UserAuthentication();
                        string[] arrUserCookieInfo = FormsFunction.GetCookieData();
                        EntityRegUsers objEntityRegUsers = new EntityRegUsers();
                        objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(arrUserCookieInfo[0].ToString()));
                        hfUserID.Value = objEntityRegUsers.UserID.ToString();

                        txtUserFullName.Value = objEntityRegUsers.UserFullName;
                        txtUserEmailAddress.Value = objEntityRegUsers.UserEmailAddress;
                        txtUserAdsQuta.Value = objEntityRegUsers.UserCountAds.ToString();
                        txtUserAdsCount.Value = objEntityRegUsers.CountAdsUsed.ToString();
                        txtUserMobilePhoneNumber.Value = objEntityRegUsers.UserMobileNumber;

                        if (!string.IsNullOrEmpty(objEntityRegUsers.UserFacebookID))
                        {
                            imgUserProfile.Src = string.Format("https://graph.facebook.com/{0}/picture", objEntityRegUsers.UserFacebookID);
                            upFileUserProfile.Enabled = false;
                            td_PasswordUserMessage.InnerHtml = "لا تستطيع تعديل كلمة المرور";
                            txtUserFullName.Disabled = true;
                            txtPassword.Disabled = true;
                            txtConfirmPassword.Disabled = true;
                            btnChangePassword.Enabled = false;
                        }
                        else
                        {
                            td_PasswordUserMessage.InnerHtml = string.Empty;
                            upFileUserProfile.Enabled = true;
                            if (string.IsNullOrEmpty(objEntityRegUsers.UserImage))
                            {
                                imgUserProfile.Src = "images/ArabiSkyUnknowUser.png";
                            }
                            else
                            {
                                imgUserProfile.Src = objEntityRegUsers.UserImage;
                            }
                        }
                        txtUserMobilePhoneNumber.Value = objEntityRegUsers.UserMobileNumber;
                        ddlCategoryName.SelectedValue = objEntityRegUsers.IntrestedCat.ToString();
                        FormsFunction.BindDDL(ref ddlSubCategoryName, objManageSubCategory.GetAllSubCatByCatID(objEntityRegUsers.IntrestedCat), "SubCategoriesName", "SubCategoriesID", "إختر القسم الفرعي");
                        ddlSubCategoryName.SelectedValue = objEntityRegUsers.IntrestedSubCat.ToString();
                        if (int.Parse(objEntityRegUsers.SyncEmail.ToString()) == 0)
                        {
                            rbtnNo.Checked = true;
                        }
                        else
                        {
                            rbtnYes.Checked = true;
                        }
                    }
                    else
                    {
                        UserAuthentication objUserAuthentication = new UserAuthentication();
                        EntityRegUsers objEntityRegUsers = (EntityRegUsers)Session["UserInfo"];
                        hfUserID.Value = objEntityRegUsers.UserID.ToString();
                        objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(hfUserID.Value));
                        hfUserID.Value = objEntityRegUsers.UserID.ToString();
                        if (objEntityRegUsers.UserFullName.Contains("UserID "))
                        {
                            txtUserFullName.Value = string.Empty;
                        }
                        else
                        {
                            txtUserFullName.Value = objEntityRegUsers.UserFullName;
                        }
                        txtUserFullName.Value = objEntityRegUsers.UserFullName;
                        txtUserEmailAddress.Value = objEntityRegUsers.UserEmailAddress;
                        txtUserAdsQuta.Value = objEntityRegUsers.UserCountAds.ToString();
                        txtUserAdsCount.Value = objEntityRegUsers.CountAdsUsed.ToString();

                        if (!string.IsNullOrEmpty(objEntityRegUsers.UserFacebookID))
                        {
                            imgUserProfile.Src = string.Format("https://graph.facebook.com/{0}/picture", objEntityRegUsers.UserFacebookID);
                            upFileUserProfile.Enabled = false;
                            td_PasswordUserMessage.InnerHtml = "لا تستطيع تعديل كلمة المرور";
                            txtUserFullName.Disabled = true;
                            txtPassword.Disabled = true;
                            txtConfirmPassword.Disabled = true;
                            btnChangePassword.Enabled = false;
                        }
                        else
                        {
                            td_PasswordUserMessage.InnerHtml = string.Empty;
                            upFileUserProfile.Enabled = true;
                            if (string.IsNullOrEmpty(objEntityRegUsers.UserImage))
                            {
                                imgUserProfile.Src = "images/ArabiSkyUnknowUser.png";
                            }
                            else
                            {
                                imgUserProfile.Src = objEntityRegUsers.UserImage;
                            }
                        }
                        txtUserMobilePhoneNumber.Value = objEntityRegUsers.UserMobileNumber;
                        ddlCategoryName.SelectedValue = objEntityRegUsers.IntrestedCat.ToString();
                        FormsFunction.BindDDL(ref ddlSubCategoryName, objManageSubCategory.GetAllSubCatByCatID(objEntityRegUsers.IntrestedCat), "SubCategoriesName", "SubCategoriesID", "إختر القسم الفرعي");
                        ddlSubCategoryName.SelectedValue = objEntityRegUsers.IntrestedSubCat.ToString();
                        if (int.Parse(objEntityRegUsers.SyncEmail.ToString()) == 0)
                        {
                            rbtnNo.Checked = true;
                        }
                        else
                        {
                            rbtnYes.Checked = true;
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

    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        try
        {
            EntityRegUsers objEntityRegUsers = new EntityRegUsers();
            UserAuthentication objUserAuthentication = new UserAuthentication();

            objEntityRegUsers.UserID = Convert.ToInt32(hfUserID.Value);
            objEntityRegUsers.IntrestedCat = int.Parse(ddlCategoryName.SelectedValue);
            objEntityRegUsers.IntrestedSubCat = int.Parse(ddlSubCategoryName.SelectedValue);
            if (rbtnYes.Checked)
            {
                objEntityRegUsers.SyncEmail = 1;
            }
            else
            {
                objEntityRegUsers.SyncEmail = 0;
            }
            int nReturnValue = objUserAuthentication.EditUserSoftwareManager(objEntityRegUsers);
            if (nReturnValue == 1)
            {
                spEditSoftwareSettings.InnerHtml = "تم تعديل البيانات بنجاح";
            }
            else
            {
                spEditSoftwareSettings.InnerHtml = "هناك خطأ في تعديل البيانات الرجاء المحاولة فيما بعد";
            }

        }
        catch (Exception ex)
        {
            tr_UserMessage_2.InnerHtml = "هناك خطأ في تعديل بياناتك الرجاء المحاولة فيما بعد";
            _logger.Error("AccountSettings:::btnSendMessage_Click:::" + ex.Message);
        }
    }


    protected void ddlCategoryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ManageSubCategory objManageSubCategory = new ManageSubCategory();
            FormsFunction.BindDDL(ref ddlSubCategoryName, objManageSubCategory.GetAllSubCatByCatID(int.Parse(ddlCategoryName.SelectedValue)), "SubCategoriesName", "SubCategoriesID", "إختر القسم الفرعي");
        }
        catch (Exception ex)
        {
            _logger.Error("AccountSettings:::ddlCategoryName_SelectedIndexChanged:::" + ex.Message);
        }
    }

    #endregion

    #region Methods
    private int GetCountry()
    {
        try
        {
            switch (FormsFunction.GetCookieValueCountryInfo())
            {
                case 12:

                    return 12;
                case 14:

                    return 14;
                case 15:

                    return 15;
                case 16:

                    return 16;
                case 17:

                    return 17;
                default:
                    return 0;
            }
        }
        catch (Exception)
        {
            return 0;
        }
    }

    public string GetPictureUrl(string faceBookId)
    {
        WebResponse response = null;
        string pictureUrl = string.Empty;
        try
        {
            WebRequest request = WebRequest.Create(string.Format("https://graph.facebook.com/{0}/picture", faceBookId));
            response = request.GetResponse();
            pictureUrl = response.ResponseUri.ToString();
        }
        catch (Exception ex)
        {
            _logger.Error("AccountSettings:::GetPictureUrl:::" + ex.Message);
        }
        finally
        {
            if (response != null) response.Close();
        }
        return pictureUrl;
    }
    #endregion
}