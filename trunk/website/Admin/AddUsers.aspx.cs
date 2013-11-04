using System;
using DAL;
using Entity;
using NLog;
using Entity.Country;
using Entity.City;
public partial class Admin_AddUsers : ParentPage
{
    private static Logger _logger = LogManager.GetCurrentClassLogger();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ManageCountry objDALManageCountry = new ManageCountry();
                EntiryCountry objEntiryCountry = new EntiryCountry();
                EntityRegUsers objEntityRegUsers = new EntityRegUsers();
                UserAuthentication objUserAuthentication = new UserAuthentication();

                objEntiryCountry.Action = 6;
                FormsFunction.BindDDL(ref ddlCountryName, objDALManageCountry.GetAllCountry(objEntiryCountry), "CountryName", "CountryID", "إختر البلد");

                if (Request.Url.AbsoluteUri.IndexOf("UserID") >= 0)
                {
                    objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(Request.QueryString["UserID"].ToString()));
                    txtUserFullName.Text = objEntityRegUsers.UserFullName;
                    txtEmailAddress.Text = objEntityRegUsers.UserEmailAddress;
                    txtPassword.Text = EncryptionMethods.Encryption.Decrypt(objEntityRegUsers.UserPassword);
                    txtFacebookID.Text = objEntityRegUsers.UserFacebookID;
                    hfCountry.Value = objEntityRegUsers.UserCountry.ToString();
                    hfCity.Value = objEntityRegUsers.UserCityAddress.ToString();
                    ddlUserStatus.SelectedValue = objEntityRegUsers.UserStatus.ToString();
                    ddlUserType.SelectedValue = objEntityRegUsers.UserType.ToString();
                    ddlAdsCount.SelectedValue = objEntityRegUsers.UserCountAds.ToString();
                    txtMobileNumber.Text = objEntityRegUsers.UserMobileNumber;
                    ddlCountryName.Enabled = false;
                    ddlCityName.Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddCategory:::Page_Load:::" + ex.Message);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            EntityRegUsers objEntityRegUsers = new EntityRegUsers();
            UserAuthentication objUserAuthentication = new UserAuthentication();

            objEntityRegUsers.UserID = 0;
            objEntityRegUsers.UserFullName = txtUserFullName.Text;
            objEntityRegUsers.UserEmailAddress = txtEmailAddress.Text;
            objEntityRegUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(txtPassword.Text);
            objEntityRegUsers.UserFacebookID = txtFacebookID.Text;
            objEntityRegUsers.UserCountry = int.Parse(hfCountry.Value);
            objEntityRegUsers.UserCityAddress = int.Parse(hfCity.Value);
            objEntityRegUsers.UserStatus = int.Parse(ddlUserStatus.SelectedValue);
            objEntityRegUsers.UserType = int.Parse(ddlUserType.SelectedValue);
            objEntityRegUsers.UserCountAds = int.Parse(ddlAdsCount.SelectedValue);
            objEntityRegUsers.UserMobileNumber = txtMobileNumber.Text;

            if (Request.Url.AbsoluteUri.IndexOf("UserID") >= 0)
            { 
                objEntityRegUsers.UserID = Convert.ToInt32(Request.QueryString["UserID"].ToString());
                int nReturnValue = objUserAuthentication.EditUserInfo(objEntityRegUsers);
                if (nReturnValue == 1)
                {
                    tr_UserMessage.InnerHtml = "Edit User Successfully";
                }
                else
                {
                    tr_UserMessage.InnerHtml = "you have issues please contact the system support";
                }
            }
            else
            { 
                int nReturnValue = objUserAuthentication.RegisterNewUserFromAdmin(objEntityRegUsers);
                if (nReturnValue == 1)
                {
                    tr_UserMessage.InnerHtml = "Add User Successfully";
                    Response.Redirect("Users", false);
                }
                else
                {
                    tr_UserMessage.InnerHtml = "you have issues please contact the system support";
                }
            }

        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddCategory:::btnSubmit_Click:::" + ex.Message);
        }
    }

    protected void ddlCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ManageCity objManageCity = new ManageCity();
            EntiryCity objEntiryCity = new EntiryCity(); 
            objEntiryCity.CityStatus = 1;
            objEntiryCity.CityName = string.Empty;
            objEntiryCity.Country_FK_ID = int.Parse(ddlCountryName.SelectedValue);
            FormsFunction.BindDDL(ref ddlCityName, objManageCity.GetAllCityByCountryID(objEntiryCity), "CityName", "CityID", "إختر المدينة");
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddUsers:::Page_Load:::" + ex.Message);
        }
    }

}