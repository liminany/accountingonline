using System;
using DAL;
using Entity;
using NLog;
using System.Web.UI;
using System.Text.RegularExpressions;

public partial class master : System.Web.UI.MasterPage
{
    #region Variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    EntityRegUsers objEntityRegUsers = new EntityRegUsers();
    public string sUserID = string.Empty;
    private static readonly Regex REGEX_BETWEEN_TAGS = new Regex(@">\s+<", RegexOptions.Compiled);
    private static readonly Regex REGEX_LINE_BREAKS = new Regex(@"\n\s+", RegexOptions.Compiled);
    #endregion

    #region Pageload
    protected override void Render(HtmlTextWriter writer)
    {
        try
        {
            using (HtmlTextWriter htmlwriter = new HtmlTextWriter(new System.IO.StringWriter()))
            {
                base.Render(htmlwriter);
                string html = htmlwriter.InnerWriter.ToString();
                html = REGEX_BETWEEN_TAGS.Replace(html, "> <");
                html = REGEX_LINE_BREAKS.Replace(html, string.Empty);
                writer.Write(html.Trim());
            }
        }
        catch (Exception ex)
        {
            _logger.Error("master:::Render:::" + ex.Message);
            throw;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            CheckDevice();
            if (FormsFunction.GetCookieData().Length != 0 || Session["UserInfo"] != null)
            {
                if (FormsFunction.GetCookieData().Length != 0)
                {
                    string[] arrCookieData = FormsFunction.GetCookieData();
                    objEntityRegUsers.UserID = Convert.ToInt32(arrCookieData[0].ToString());
                    objEntityRegUsers.UserEmailAddress = arrCookieData[1].ToString();
                    objEntityRegUsers.UserPassword = arrCookieData[2].ToString();
                    if (arrCookieData.Length == 4)
                    {
                        objEntityRegUsers.UserFullName = arrCookieData[3].ToString();
                    }
                    else
                    {
                        objEntityRegUsers.UserFullName = "UserID :" + objEntityRegUsers.UserID;
                    }
                    tr_DefaultUser.Style.Add("display", "none");
                    tr_RegisterUser.Style.Add("display", "");
                    sp_UserTitle.InnerHtml = objEntityRegUsers.UserFullName;
                }
                else
                {
                    objEntityRegUsers = (EntityRegUsers)Session["UserInfo"];
                    tr_DefaultUser.Style.Add("display", "none");
                    tr_RegisterUser.Style.Add("display", "");
                    if (string.IsNullOrEmpty(objEntityRegUsers.UserFullName))
                    {
                        objEntityRegUsers.UserFullName = "UserID :" + objEntityRegUsers.UserID;
                    }
                    else
                    {
                        objEntityRegUsers.UserFullName = objEntityRegUsers.UserFullName;
                    }
                    sp_UserTitle.InnerHtml = objEntityRegUsers.UserFullName;
                }
                DBUserMessages objDBUserMessages = new DBUserMessages();
                int nMessageCountUnread = objDBUserMessages.GetEmailUnReaded(objEntityRegUsers.UserID);
                spMessageCounter.InnerHtml = string.Format("&nbsp;لديك {0} رسائل&nbsp;", nMessageCountUnread);
                if (nMessageCountUnread > 0)
                {
                    spMessageCountNotification.InnerHtml = nMessageCountUnread.ToString();
                    div_EmailNotofication.Style.Add("display", "");
                }
                else
                {
                    div_EmailNotofication.Style.Add("display", "none");
                }
                sUserID = objEntityRegUsers.UserEmailAddress.ToString();
            }
            else
            {
                tr_DefaultUser.Style.Add("display", "");
                tr_RegisterUser.Style.Add("display", "none");
                div_EmailNotofication.Style.Add("display", "none");
            }

            switch (FormsFunction.GetCookieValueCountryInfo())
            {
                case 12:
                    ImgCountryFlag.Src = "images/imgJordan_small.png";
                    ImgCountryFlag.Alt = "المملكة الأردنية الهاشمية";
                    alinkCountryName.InnerHtml = "المملكة الأردنية الهاشمية";
                    alinkCountryNameWithoutLogin.InnerHtml = "المملكة الأردنية الهاشمية";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_jordan.png";
                    break;
                case 14:
                    ImgCountryFlag.Src = "images/imgSaudi_small.png";
                    ImgCountryFlag.Alt = "المملكة العربية السعودية";
                    alinkCountryName.InnerHtml = "المملكة العربية السعودية";
                    alinkCountryNameWithoutLogin.InnerHtml = "المملكة العربية السعودية";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_saudiArabia.png";
                    break;
                case 15:
                    ImgCountryFlag.Src = "images/imgPalestine_small.png";
                    ImgCountryFlag.Alt = "فلسطين";
                    alinkCountryName.InnerHtml = "فلسطين";
                    alinkCountryNameWithoutLogin.InnerHtml = "فلسطين";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Palastain.png";
                    break;
                case 16:
                    ImgCountryFlag.Src = "images/img_Libya_flat.png";
                    ImgCountryFlag.Alt = "ليبيا";
                    alinkCountryName.InnerHtml = "ليبيا";
                    alinkCountryNameWithoutLogin.InnerHtml = "ليبيا";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Libya.png";
                    break;
                case 17:
                    ImgCountryFlag.Src = "images/img_Egypt-Flag.png";
                    ImgCountryFlag.Alt = "مصر";
                    alinkCountryName.InnerHtml = "مصر";
                    alinkCountryNameWithoutLogin.InnerHtml = "مصر";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Egypt.png";
                    break;
                case 19:
                    ImgCountryFlag.Src = "img/img_Country/img_Emarats.png";
                    ImgCountryFlag.Alt = "الإمارات العربية المتحدة";
                    alinkCountryName.InnerHtml = "الإمارات العربية المتحدة";
                    alinkCountryNameWithoutLogin.InnerHtml = "الإمارات العربية المتحدة";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Emarats.png";
                    break;
                case 24:
                    ImgCountryFlag.Src = "img/img_Country/img_Syria.png";
                    ImgCountryFlag.Alt = "الجمهورية العربية السورية";
                    alinkCountryName.InnerHtml = "الجمهورية العربية السورية";
                    alinkCountryNameWithoutLogin.InnerHtml = "الجمهورية العربية السورية";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Syria.png";
                    break;
                case 23:
                    ImgCountryFlag.Src = "img/img_Country/img_Kuwait.png";
                    ImgCountryFlag.Alt = "الكويت";
                    alinkCountryName.InnerHtml = "الكويت";
                    alinkCountryNameWithoutLogin.InnerHtml = "الكويت";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Kuwait.png";
                    break;
                case 21:
                    ImgCountryFlag.Src = "img/img_Country/img_Qatar.png";
                    ImgCountryFlag.Alt = "قطر";
                    alinkCountryName.InnerHtml = "قطر";
                    alinkCountryNameWithoutLogin.InnerHtml = "قطر";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Qatar.png";
                    break;
                case 20:
                    ImgCountryFlag.Src = "img/img_Country/img_Bahrain.png";
                    ImgCountryFlag.Alt = "البحرين";
                    alinkCountryName.InnerHtml = "البحرين";
                    alinkCountryNameWithoutLogin.InnerHtml = "البحرين";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Bahrain.png";
                    break;
                case 18:
                    ImgCountryFlag.Src = "img/img_Country/img_Yemen.png";
                    ImgCountryFlag.Alt = "اليمن";
                    alinkCountryName.InnerHtml = "اليمن";
                    alinkCountryNameWithoutLogin.InnerHtml = "اليمن";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Yemen.png";
                    break;
                case 22:
                    ImgCountryFlag.Src = "img/img_Country/img_Oman.png";
                    ImgCountryFlag.Alt = "عُمان";
                    alinkCountryName.InnerHtml = "عُمان";
                    alinkCountryNameWithoutLogin.InnerHtml = "عُمان";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Oman.png";
                    break;
                case 27:
                    ImgCountryFlag.Src = "img/img_Country/img_Morocco.png";
                    ImgCountryFlag.Alt = "المغرب";
                    alinkCountryName.InnerHtml = "المغرب";
                    alinkCountryNameWithoutLogin.InnerHtml = "المغرب";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Morocco.png";
                    break;
                case 26:
                    ImgCountryFlag.Src = "img/img_Country/img_Algeria.png";
                    ImgCountryFlag.Alt = "الجزائر";
                    alinkCountryName.InnerHtml = "الجزائر";
                    alinkCountryNameWithoutLogin.InnerHtml = "الجزائر";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Algeria.png";
                    break;
                case 25:
                    ImgCountryFlag.Src = "img/img_Country/img_Tounis.png";
                    ImgCountryFlag.Alt = "تونس";
                    alinkCountryName.InnerHtml = "تونس";
                    alinkCountryNameWithoutLogin.InnerHtml = "تونس";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Tounis.png";
                    break;
                case 28:
                    ImgCountryFlag.Src = "img/img_Country/img_Lebanon.png";
                    ImgCountryFlag.Alt = "لبنان";
                    alinkCountryName.InnerHtml = "لبنان";
                    alinkCountryNameWithoutLogin.InnerHtml = "لبنان";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Lebanon.png";
                    break;
                case 29:
                    ImgCountryFlag.Src = "img/img_Country/img_Iraq.png";
                    ImgCountryFlag.Alt = "العراق";
                    alinkCountryName.InnerHtml = "العراق";
                    alinkCountryNameWithoutLogin.InnerHtml = "العراق";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Iraq.png";
                    break;
                case 30:
                    ImgCountryFlag.Src = "img/img_Country/img_Sudan.png";
                    ImgCountryFlag.Alt = "السودان";
                    alinkCountryName.InnerHtml = "السودان";
                    alinkCountryNameWithoutLogin.InnerHtml = "السودان";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Sudan.png";
                    break;
                case 31:
                    ImgCountryFlag.Src = "img/img_Country/img_Mauritania.png";
                    ImgCountryFlag.Alt = "موريتانيا";
                    alinkCountryName.InnerHtml = "موريتانيا";
                    alinkCountryNameWithoutLogin.InnerHtml = "موريتانيا";
                    ImgCountryFlagWithoutlogin.Src = "img/img_Country/img_Mauritania.png";
                    break;
                default:
                    ImgCountryFlag.Src = "images/world_map_earth.png";
                    ImgCountryFlag.Alt = "إختر البلد";
                    alinkCountryName.InnerHtml = "إختر البلد";
                    alinkCountryNameWithoutLogin.InnerHtml = "إختر البلد";
                    ImgCountryFlagWithoutlogin.Src = "images/world_map_earth.png";
                    break;
            }

        }
        catch (Exception ex)
        {
            _logger.Error("master:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void lbtnRefreshGVMaster_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(string.Format("~/Search?Type=MainSearch&text={0}", txtMasterSearch.Value.Trim()), false);
        }
        catch (Exception ex)
        {
            _logger.Error("masterpage:::lbtnRefreshGVMaster_Click:::" + ex.Message);
        }
    }
    protected void lbtnCountry_Click(object sender, EventArgs e)
    {
        try
        {
            //  string a = hfCountry.Value;
        }
        catch (Exception ex)
        {
            _logger.Error("masterpage:::lbtnCountry_Click:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
    public void CheckDevice()
    {
        try
        {
            string strUserAgent = Request.UserAgent.ToLower();
            if (strUserAgent != null)
            {
                if (Request.Browser.IsMobileDevice == true
                   || strUserAgent.Contains("iphone")
                   || strUserAgent.Contains("ipod")
                   || strUserAgent.Contains("android")
                   || strUserAgent.Contains("iemobile")
                   || strUserAgent.Contains("version")
                   || strUserAgent.Contains("blackberry")
                   || strUserAgent.Contains("windows ce")
                   || strUserAgent.Contains("opera mini")
                   || strUserAgent.Contains("palm")
                   || strUserAgent.Contains("chrome")
                   || strUserAgent.Contains("ipad"))
                {
                    Response.Redirect("http://www.arabisky.com/m/default.aspx", false);

                }
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
    #endregion
}
