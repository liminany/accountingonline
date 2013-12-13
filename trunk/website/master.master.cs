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
            if (!IsPostBack)
            {
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
                        ImgCountryFlagWithoutlogin.Src = "images/imgJordan_small.png";
                        break;
                    case 14:
                        ImgCountryFlag.Src = "images/imgSaudi_small.png";
                        ImgCountryFlag.Alt = "المملكة العربية السعودية";
                        alinkCountryName.InnerHtml = "المملكة العربية السعودية";
                        alinkCountryNameWithoutLogin.InnerHtml = "المملكة العربية السعودية";
                        ImgCountryFlagWithoutlogin.Src = "images/imgSaudi_small.png";
                        break;
                    case 15:
                        ImgCountryFlag.Src = "images/imgPalestine_small.png";
                        ImgCountryFlag.Alt = "فلسطين";
                        alinkCountryName.InnerHtml = "فلسطين";
                        alinkCountryNameWithoutLogin.InnerHtml = "فلسطين";
                        ImgCountryFlagWithoutlogin.Src = "images/imgPalestine_small.png";
                        break;
					case 16:
                        ImgCountryFlag.Src = "images/img_Libya_flat.png";
                        ImgCountryFlag.Alt = "ليبيا";
                        alinkCountryName.InnerHtml = "ليبيا";
                        alinkCountryNameWithoutLogin.InnerHtml = "ليبيا";
                        ImgCountryFlagWithoutlogin.Src = "images/img_Libya_flat.png";
                        break;
					case 17:
                        ImgCountryFlag.Src = "images/img_Egypt-Flag.png";
                        ImgCountryFlag.Alt = "مصر";
                        alinkCountryName.InnerHtml = "مصر";
                        alinkCountryNameWithoutLogin.InnerHtml = "مصر";
                        ImgCountryFlagWithoutlogin.Src = "images/img_Egypt-Flag.png";
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
            Response.Redirect(string.Format("Search?Type=custom&subID={0}&text={1}", home_search_cat_id.Value, txtMasterSearch.Value.Trim()), false);
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
}
