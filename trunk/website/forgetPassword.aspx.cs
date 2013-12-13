using System;
using DAL;
using Entity;
using NLog;

public partial class forgetPassword : System.Web.UI.Page
{
    #region Variables
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
                    Response.Redirect("/", false);
                }
                else
                {
                    trForgetPassword.Style.Add("display", "");
                    trForgetPasswordUseMessage.Style.Add("display", "none");
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("forgetPassword:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnSendEmailAddress_Click(object sender, EventArgs e)
    {
        try
        {
            UserAuthentication objUserAuthentication = new UserAuthentication();
            EntityRegUsers objEntityRegUsers = new EntityRegUsers();
            objEntityRegUsers.UserEmailAddress = email.Value;
            objEntityRegUsers = objUserAuthentication.GetUserInfoByUserEmailAddress(objEntityRegUsers);
            trForgetPassword.Style.Add("display", "none");
            trForgetPasswordUseMessage.Style.Add("display", "");

            if (string.IsNullOrEmpty(objEntityRegUsers.UserFacebookID))
            {
                if (objEntityRegUsers.UserEmailAddress == email.Value)
                {
                    SendEMail objSendEMail = FormsFunction.SendAndGetEmailTempleteByArabiSkyInfo(1, objEntityRegUsers.UserEmailAddress, EncryptionMethods.Encryption.Decrypt(objEntityRegUsers.UserPassword));
                    if (objSendEMail == SendEMail.Success)
                    {
                        div_UserMessageTitle.InnerHtml = "لقد تم إرسال كلمة السر إلى رقم بريدك الإلكتروني.";
                        div_UserMessageBody.InnerHtml = "لقد تم إرسال معلومات الدخول الى النظام بنجاح الرجاء قم بمراجعة بريدك الإلكتروني";
                    }
                    else
                    {
                        div_UserMessageTitle.InnerHtml = "خطأ في إرسال البريد الإلكتروني";
                        div_UserMessageBody.InnerHtml = "خطأ في إرسال البريد الإلكتروني الرجاء المحاولة فيما بعد او مراسلة الدعم الفني <a href='mailto:info@arabisky.com'>info@arabisky.com</a>";
                    }
                }
                else
                {
                    div_UserMessageTitle.InnerHtml = "البريد الإلكتروني غير موجود";
                    div_UserMessageBody.InnerHtml = "البريد الإلكتروني غير موجود لدينا الرجاء التأكد من بريدك الاكتروني <a href='forgetPassword'>إعادة المحاولة</a>";
                }   
            }
            else
            {
                div_UserMessageTitle.InnerHtml = "الحساب الحالي هو حساب فيسبوك";
                div_UserMessageBody.InnerHtml = "الحساب الحالي حساب فيسبوك الرجاء زيارة فيسبوك و التأكد من حسابك";
            }
        }
        catch (Exception ex)
        {
            div_UserMessageTitle.InnerHtml = "خطأ في إرسال البريد الإلكتروني";
            div_UserMessageBody.InnerHtml = "خطأ في إرسال البريد الإلكتروني الرجاء المحاولة فيما بعد او مراسلة الدعم الفني <a href='mailto:info@arabisky.com'>info@arabisky.com</a>";
            _logger.Error("forgetPassword:::btnSendEmailAddress_Click:::" + ex.Message);
        }
    }
    #endregion
}