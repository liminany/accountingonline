using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NLog;
using Entity;

public partial class ContactUs : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger(); 
    #endregion

    #region Pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Full_Name.Focus();
        }
        catch (Exception ex)
        {
            _logger.Error("ContactUs:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            { 
                SendEMail objSendEMail = FormsFunction.SendEmailForSupportByArabiSkyInfo(Full_Name.Value, Email_Address.Value, Your_Message.Value);
                if (objSendEMail == SendEMail.Success)
                {
                    td_UserMessage.InnerHtml = "<h3 style='color:green'>تم ارسال الرسالة بنجاح لإدارة الموقع سوف يتم الرد ان شاء الله بعضون 24 ساعة</h3>";
                    Full_Name.Value = string.Empty;
                    Email_Address.Value = string.Empty;
                    Your_Message.Value = string.Empty;
                    Full_Name.Focus();
                }
                else
                {
                    td_UserMessage.InnerHtml = "<h3 style='color:red'>هناك خطأ في إرسال الرسالة الرجاء المحاولة فيما بعد</h3>";
                }
            }
            else
            {
                td_UserMessage.InnerHtml = "<h3 style='color:red'>الرجاء التحقق من رمز الدخول</h3>";
            }
        }
        catch (Exception ex)
        {
            td_UserMessage.InnerHtml = "<h3 style='color:red'>هناك خطأ في إرسال الرسالة الرجاء المحاولة فيما بعد</h3>";   
            _logger.Error("ContactUs:::Page_Load:::" + ex.Message);
        }
    }
    #endregion
}