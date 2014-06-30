using DAL;
using Entity;
using NLog;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class m_ViewAd : System.Web.UI.Page
{
    #region variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    private EntityRegUsers objEntityRegUsers = new EntityRegUsers();
    public string url = string.Empty;
    public string sAdsTitle = string.Empty;
    public string sAdsDescription = string.Empty;
    public string sAdsURL = string.Empty;
    public string facebookImage = "http://www.arabisky.com/images/ArabiSkyLogo.png";

    private int nRequiredUpdateAdsPeroid = 8;
    private DBAdsManager objDBAdsManager = new DBAdsManager();
    #endregion


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                int nSubCatID = 0;
                int nAdsID = 0;
                int nAdsHit = 0;
                url = HttpContext.Current.Request.Url.AbsoluteUri;
                if (!string.IsNullOrEmpty(Request.QueryString["AdsID"].ToString()))
                {

                    foreach (DataRow rows in objDBAdsManager.GetAdsInformationByAdsID(Convert.ToInt32(Request.QueryString["AdsID"].ToString())).Tables[0].Rows)
                    {
                        spAdsTitle.InnerHtml = rows["AdsTitle"].ToString();
                        sAdsDescription = "سوق سماء العرب - " + rows["AdsTitle"].ToString() + " | " + rows["CityName"].ToString() + " | " + rows["CountryName"].ToString() + " | " + rows["CatName"].ToString() + " | " + rows["SubCategoriesName"].ToString();

                        Page.Title = "سوق سماء العرب - " + BuildAdsTitle(rows["AdsTitle"].ToString());
                        Page.MetaDescription = "سوق سماء العرب - " + rows["AdsTitle"].ToString() + " | " + rows["CityName"].ToString() + " | " + rows["CountryName"].ToString() + " | " + rows["CatName"].ToString() + " | " + rows["SubCategoriesName"].ToString();



                        //if (Convert.ToInt32(rows["AdsPrice"].ToString()) > 0)
                        //{
                        //    sp_Price.InnerHtml = string.Format("السعر {0} {1}", rows["AdsPrice"].ToString(), GetCurrancyTags());
                        //}
                        //else
                        //{
                        //    sp_Price.Style.Add("display", "none");
                        //}

                        //liCity.InnerHtml = "المدينة : " + rows["CityName"].ToString();
                        //liCountry.InnerHtml = "البلد : " + rows["CountryName"].ToString();
                        //liCreateDate.InnerHtml = "تاريخ الإضافة : " + Convert.ToDateTime(rows["AdsCreateDate"].ToString()).ToShortDateString();
                        //liSection.InnerHtml = "القسم : " + rows["CatName"].ToString();
                        //liSubSection.InnerHtml = "القسم الفرعي : " + rows["SubCategoriesName"].ToString();

                        nAdsID = Convert.ToInt32(rows["AdsID"].ToString());
                        nSubCatID = Convert.ToInt32(rows["SubCatID"].ToString());
                        nAdsHit = Convert.ToInt32(rows["AdsHit"].ToString());


                        if (!string.IsNullOrEmpty(rows["AdsYoutubeURL"].ToString()))
                        {
                            div_YouTube.Style.Add("display", "");
                            div_YouTubeURL.InnerHtml = string.Format("<iframe width='680' height='400' src='{0}' frameborder='0' allowfullscreen=''></iframe>", RunVedio(rows["AdsYoutubeURL"].ToString()));
                        }
                        else
                        {
                            div_YouTube.Style.Add("display", "none");
                        }
                        div_AdsDescription.InnerHtml = rows["AdsDescription"].ToString();
                        if (!string.IsNullOrEmpty(rows["AdsImages"].ToString()))
                        {
                            div_Slider.Style.Add("display", "");

                            ViewAdsImage(rows["AdsImages"].ToString(), rows["AdsTitle"].ToString(), rows["CatName"].ToString(), rows["SubCategoriesName"].ToString());
                        }
                        else
                        {
                            div_Slider.Style.Add("display", "none");

                        }
 

                        #region UserProfile
                        #endregion
                    }

                    #region AdsCounterHit
                    nAdsHit = nAdsHit + 1;
                    objDBAdsManager.EditAdsCounter(nAdsID, nAdsHit);
                    #endregion

                     
                }
                else
                {
                    Response.Redirect("~/Login", false);
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Mobile - ViewAds:::Page_Load:::" + ex.Message);
        }
    }

    #region Methods

    protected string SplitArticlsTitle(string sArticlsTitle)
    {
        try
        {
            if (sArticlsTitle.Length > 55)
            {
                return sArticlsTitle.Substring(0, 54) + "...";
            }
            else
            {
                return sArticlsTitle;
            }
        }
        catch (Exception)
        {
            return "Unknown";
        }
    }
    private string GetCurrancyTags()
    {
        try
        {
            switch (FormsFunction.GetCookieValueCountryInfo())
            {
                case 12:
                    return "دينار أردني";
                case 14:
                    return "ريال سعودي";
                case 15:
                    return "شيكل";
                case 16:
                    return "دينار ليبي";
                case 17:
                    return "جنية مصري";
                case 19:
                    return "درهم إماراتي";
                case 24:
                    return "ليرة سورية";
                case 23:
                    return "دينار كويتي";
                case 21:
                    return "ريال قطري";
                case 20:
                    return "دينار بحريني";
                case 18:
                    return "رسال يمني";
                case 22:
                    return "رسال عماني";
                case 27:
                    return "دينار تونسي";
                case 26:
                    return "دينار جزائري";
                case 25:
                    return "درهم مغربي";
                case 28:
                    return "ليرة لبناني";
                case 29:
                    return "دينار عراقي";
                case 30:
                    return "جنية سوداني";
                case 31:
                    return "أوقية موريتانيا";
                default:
                    return "غير معروف";
            }
        }
        catch (Exception)
        {
            return "غير معروف";
        }
    }
    private void ViewAdsImage(string imagesURL, string sAdsTitle, string sCatName, string sSubCategoriesName)
    {
        try
        {
            string[] images = imagesURL.Split('|');
            for (int i = 0; i < images.Length; i++)
            {
                /*div_Slider.InnerHtml = div_Slider.InnerHtml + "<div class='various' style='margin-top: 15px;cursor:pointer;border:2px solid #333;height:168px;width:200px;float:right;margin-right: 10px;'><a class='fancybox' rel='gallery1' href='" + "http://arabisky.s3.amazonaws.com/" + images[0] + "'><img style='max-width: 200px;max-height: 168px;width:200px;height:168px;' src='" + "http://arabisky.s3.amazonaws.com/" + images[0] + "' alt='' /></a></div>";*/
                string sImageAlt = sAdsTitle + "-" + sCatName + "-" + sSubCategoriesName;
                div_Slider.InnerHtml = div_Slider.InnerHtml + "<div class='various' style='margin-top: 15px;cursor:pointer;border:2px solid #333;height:168px;width:200px;float:right;margin-right: 10px;'><a class='fancybox' rel='gallery1' href='../" + images[i].Replace("~", "..") + "'><img alt='" + BuildAdsTitle(sImageAlt) + "' title='" + BuildAdsTitle(sImageAlt) + "' style='max-width: 200px;max-height: 168px;width:200px;height:168px;' src='" + "../" + images[i].Replace("~", "..") + "' alt='" + BuildAdsTitle(sImageAlt) + "' title='" + BuildAdsTitle(sImageAlt) + "' /></a></div>";
            }

            if (string.IsNullOrEmpty(images[0].ToString()))
            {
                facebookImage = "http://www.arabisky.com/images/ArabiSkyLogo.png";
            }
            else
            {
                facebookImage = images[0].Replace("~", "http://www.arabisky.com");
            }
        }
        catch (Exception)
        {

        }
    }
    protected string RunVedio(string VedioURL)
    {
        try
        {
            return "https://www.youtube.com/embed/" + GetThumnb(VedioURL) + "?feature=player_detailpage";
        }
        catch (Exception)
        {
            return "null";
        }
    }
    protected string GetThumnb(string sYoutubeURL)
    {
        try
        {
            string[] parts = sYoutubeURL.Split(new[] { "=" }, int.MaxValue, StringSplitOptions.None);
            return parts[1];
        }
        catch (Exception)
        {
            return "null";
        }
    }
    protected string CheckImage(string sImageURL)
    {
        try
        {
            string[] images = sImageURL.Split('|');
            if (!string.IsNullOrEmpty(images[0]))
            {
                return images[0].ToString().Replace("~", "");
                //return "http://arabisky.s3.amazonaws.com/" + images[0];
            }
            else
            {
                return "../../images/ArabiSkyLogo.png";
            }
        }
        catch (Exception)
        {
            return "null";
        }
    }
    protected string GenerateURL(object strId, object Title)
    {
        string strTitle = Title.ToString();
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = strTitle.ToLower();
        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace("vb.net", "VB-Net");
        strTitle = strTitle.Replace("asp.net", "Asp-Net");
        strTitle = strTitle.Replace(".", "-");
        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();
            if (strTitle.Contains(strChar))
            {
                strTitle = strTitle.Replace(strChar, string.Empty);
            }
        }
        strTitle = strTitle.Replace(" ", "-");
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("-----", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Trim();
        strTitle = string.Format("../../ViewAds/{0}/{1}", strId, strTitle);
        return strTitle;
    }
    protected string GenerateURLStatsic(object strId, object Title)
    {
        string strTitle = Title.ToString();
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = strTitle.ToLower();
        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace("vb.net", "VB-Net");
        strTitle = strTitle.Replace("asp.net", "Asp-Net");
        strTitle = strTitle.Replace(".", "-");
        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();
            if (strTitle.Contains(strChar))
            {
                strTitle = strTitle.Replace(strChar, string.Empty);
            }
        }
        strTitle = strTitle.Replace(" ", "-");
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("-----", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Trim();
        strTitle = string.Format("http://www.arabisky.com/ViewAds/{0}/{1}", strId, strTitle);
        return strTitle;
    }
    protected string BuildAdsTitle(object Title)
    {
        string strTitle = Title.ToString();
        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');
        strTitle = strTitle.ToLower();
        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace("vb.net", "VB-Net");
        strTitle = strTitle.Replace("asp.net", "Asp-Net");
        strTitle = strTitle.Replace(".", "-");
        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();
            if (strTitle.Contains(strChar))
            {
                strTitle = strTitle.Replace(strChar, string.Empty);
            }
        }
        strTitle = strTitle.Replace(" ", "-");
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("-----", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Trim();
        return strTitle;
    }
    #endregion
}