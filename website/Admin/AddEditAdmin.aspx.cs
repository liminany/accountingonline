using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using DAL;
using Entity.Country;
using NLog;

public partial class Admin_AddEditAdmin : ParentPage
{
    private static Logger _logger = LogManager.GetCurrentClassLogger();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                DALUsers objDALUsers = new DALUsers();
                Users objUsers = new Users();
                if (Request.Url.AbsoluteUri.IndexOf("UserID") >= 0)
                {
                    objUsers = objDALUsers.GetAdminInfoByUserID(int.Parse(Request.QueryString["UserID"].ToString()));
                    txtUserFullName.Text = objUsers.UserFullName;
                    txtEmailAddress.Text = objUsers.UserEmailAddress;
                    txtPassword.Text = EncryptionMethods.Encryption.Decrypt(objUsers.UserPassword);
                    ddlUserStatus.SelectedValue = objUsers.UserStatus.ToString();
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddEditAdmin:::Page_Load:::" + ex.Message);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            DALUsers objDALUsers = new DALUsers();
            Users objUsers = new Users();

            objUsers.UserID = 0;
            objUsers.UserFullName = txtUserFullName.Text;
            objUsers.UserEmailAddress = txtEmailAddress.Text;
            objUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(txtPassword.Text);
            objUsers.UserStatus = int.Parse(ddlUserStatus.SelectedValue);

            if (Request.Url.AbsoluteUri.IndexOf("UserID") >= 0)
            {
                objUsers.UserID = Convert.ToInt32(Request.QueryString["UserID"].ToString());
                int nReturnValue = objDALUsers.EditUserInfo(objUsers);
                if (nReturnValue == 1)
                {
                    tr_UserMessage.InnerHtml = "Edit Admin Successfully";
                }
                else
                {
                    tr_UserMessage.InnerHtml = "you have issues please contact the system support";
                }
            }
            else
            {
                int nReturnValue = objDALUsers.RegisterNewUserFromAdmin(objUsers);
                if (nReturnValue == 1)
                {
                    tr_UserMessage.InnerHtml = "Add Admin Successfully";
                    //Response.Redirect("Dashboard", false);
                }
                else
                {
                    tr_UserMessage.InnerHtml = "you have issues please contact the system support";
                }
            }

        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddEditAdmin:::btnSubmit_Click:::" + ex.Message);
        }
    }
}