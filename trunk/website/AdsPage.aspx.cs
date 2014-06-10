using System;
using System.IO;
using System.Web;
using DAL;
using Entity;
using Entity.City;
using NLog;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.Collections.Specialized;
using System.Data;
using System.Web.Services;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Collections;

public partial class AdsPage : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    UserAuthentication objUserAuthentication = new UserAuthentication();
    EntityRegUsers objEntityRegUsers = new EntityRegUsers();
    int nExpireDateCounte = 8;
    int nMaxImageUpload = 6;
    public string AdsURL = string.Empty;
    public string AdsText = string.Empty;
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
                    divNewAds.Style.Add("display", "");
                    divSoicalMedia.Style.Add("display", "none");
                    #region Fill DropDown List
                    ManageCity objManageCity = new ManageCity();
                    EntiryCity objEntiryCity = new EntiryCity();
                    ManageCategory objManageCategory = new ManageCategory();
                    objEntiryCity.Action = 6;
                    objEntiryCity.CityStatus = 1;
                    objEntiryCity.CityName = string.Empty;
                    objEntiryCity.Country_FK_ID = GetCountry();
                    FormsFunction.BindDDL(ref ddlCityName, objManageCity.GetAllCityByCountryID(objEntiryCity), "CityName", "CityID", "إختر المدينة");
                    FormsFunction.BindDDL(ref ddlCategoryName, objManageCategory.GetAllCategory(), "CatName", "Cat_ID", "إختر القسم");
                    #endregion

                    if (FormsFunction.GetCookieData().Length != 0)
                    {
                        string[] arrUserCookieInfo = FormsFunction.GetCookieData();
                        hfUserID.Value = arrUserCookieInfo[0].ToString();
                    }
                    else
                    {
                        objEntityRegUsers = (EntityRegUsers)Session["UserInfo"];
                        hfUserID.Value = objEntityRegUsers.UserID.ToString();
                    }


                    spPageTitle.InnerHtml = "إضافة إعلان جديد";
                    #region Ads Exceded
                    objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(hfUserID.Value));
                    if (objEntityRegUsers.CountAdsUsed >= objEntityRegUsers.UserCountAds)
                    {
                        trUserMessage.Style.Add("display", "");
                        trUserMessage.Style.Add("background-color", "red");
                        trUserMessage.Style.Add("color", "#fff");
                        trUserMessage.Style.Add("height", "30px");
                        btnAddNewAds.Style.Add("display", "none");
                        spUserMessages.InnerHtml = "<img style='width: 30px;' alt='arabiSky.com' src='images/Warning.png' />&nbsp;<span style='position: relative; bottom: 7px;'>لقد تجاوزت عدد الإعلانات المسموح لك بإستعمالها</span></a>";
                    }
                    else
                    {
                        btnAddNewAds.Style.Add("display", "");
                    }
                    #endregion
                }
                else
                {
                    Response.Redirect("login", false);
                }
            }

        }
        catch (Exception ex)
        {
            _logger.Error("AdsPage:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnAddNewAds_Click(object sender, EventArgs e)
    {
        try
        {
            objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(hfUserID.Value));
            if (objEntityRegUsers.CountAdsUsed >= objEntityRegUsers.UserCountAds)
            {
                trUserMessage.Style.Add("display", "");
                trUserMessage.Style.Add("background-color", "red");
                trUserMessage.Style.Add("color", "#fff");
                trUserMessage.Style.Add("height", "30px");
                btnAddNewAds.Style.Add("display", "none");
                spUserMessages.InnerHtml = "<img style='width: 30px;' alt='arabiSky.com' src='images/Warning.png' />&nbsp;<span style='position: relative; bottom: 7px;'>لقد تجاوزت عدد الإعلانات المسموح لك بإستعمالها</span></a>";
            }
            else
            {
                btnAddNewAds.Style.Add("display", "");
                DBAdsManager objDBAdsManager = new DBAdsManager();
                AdsManager objAdsManager = new AdsManager();
                objAdsManager.UserID = Convert.ToInt32(hfUserID.Value);
                objAdsManager.CatID = Convert.ToInt32(ddlCategoryName.SelectedValue);
                objAdsManager.SubCatID = Convert.ToInt32(ddlSubCategoryName.SelectedValue);
                objAdsManager.CountryID = GetCountry();
                objAdsManager.CityID = Convert.ToInt32(ddlCityName.SelectedValue);
                objAdsManager.AdsPrice = (!string.IsNullOrEmpty(txtPrice.Value)) ? Convert.ToDouble(txtPrice.Value) : 0;
                string sTextTitleAds = txtAdsTitle.Value.Replace("ة", "ه");
                sTextTitleAds = sTextTitleAds.Replace("أ", "ا");
                sTextTitleAds = sTextTitleAds.Replace("إ", "ا");
                sTextTitleAds = sTextTitleAds.Replace("إ", "ا");
                objAdsManager.AdsTitle = sTextTitleAds.ToLower();
                objAdsManager.AdsDescription = editor1.Value;
                objAdsManager.AdsUpdateCreateDate = DateTime.Now.AddDays(nExpireDateCounte);
                if (file_upload.HasFile)
                {
                    objAdsManager.AdsImages = UploadAdsImages();
                }
                else
                {
                    objAdsManager.AdsImages = string.Empty;
                }
                objAdsManager.AdsYouTubeURL = txtYouTubeURL.Value;
                int nReturnValue = objDBAdsManager.InsertNewAds(objAdsManager);
                SearchEngineOptimization objSearchEngineOptimization = new SearchEngineOptimization();
                objSearchEngineOptimization.SiteMapGenerater(GenerateURL(nReturnValue, objAdsManager.AdsTitle), DateTime.Now.ToString(), "daily", "0.69");

                trUserMessage.Style.Add("display", "");
                if (nReturnValue != 0)
                {
                    divNewAds.Style.Add("display", "none");
                    divSoicalMedia.Style.Add("display", "");
                    div_ShortURL.InnerHtml = string.Format("<a href='{0}'>{0}</a>",FormsFunction.GetTinyURL(GenerateURL(nReturnValue, objAdsManager.AdsTitle))); 
                    AdsURL = "http://www.arabisky.com/ViewAds/" + nReturnValue.ToString() + "/";
                    AdsText = sTextTitleAds;
                    txtAdsTitle.Value = string.Empty;
                    txtPrice.Value = string.Empty;
                    txtYouTubeURL.Value = string.Empty;
                    ddlCategoryName.SelectedIndex = -1;
                    ddlCityName.SelectedIndex = -1;
                    ddlSubCategoryName.SelectedIndex = -1;
                    editor1.Value = string.Empty;
                    txtAdsTitle.Focus();
                }
                else
                {
                    spUserMessages.InnerHtml = "<img style='width: 30px;' alt='arabiSky.com' src='images/Warning.png' />&nbsp;<span style='position: relative; bottom: 7px;'>هناك خطأ في إضافة الاعلان الرجاء المحاولة فيما بعد</span></a>";
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("AdsPage:::btnAddNewAds_Click:::" + ex.Message);
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
            _logger.Error("AdsPage:::ddlCategoryName_SelectedIndexChanged:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
    static public string postedonwall(string uid, string access_token, string message)
    {
        try
        {
            string URL = "https://graph.facebook.com/" + uid + "/feed";

            NameValueCollection formData = new NameValueCollection();
            formData["access_token"] = access_token;
            formData["message"] = message;

            WebClient webClient = new WebClient();
            byte[] responseBytes = webClient.UploadValues(URL, "POST", formData);
            string result = Encoding.UTF8.GetString(responseBytes);
            webClient.Dispose();

            return result;
        }
        catch (System.Exception ex)
        {
            return "Unable to post: " + ex.Message;
        }

    }

    //function to post message to twitter (parameter string message)
    //private void PostMessageToTwitter(string message)
    //{
    //    //The facebook json url to update the status
    //    string facebookURL = "http://api.twitter.com/1.1/statuses/update.json";

    //    //set the access tokens (REQUIRED)
    //    string oauth_consumer_key = "Enter customer key here";
    //    string oauth_consumer_secret = "Enter customer secret here";
    //    string oauth_token = "Enter access token";
    //    string oauth_token_secret = "Enter access token secret";

    //    // set the oauth version and signature method
    //    string oauth_version = "1.0";
    //    string oauth_signature_method = "HMAC-SHA1";

    //    // create unique request details
    //    string oauth_nonce = Convert.ToBase64String(new ASCIIEncoding().GetBytes(DateTime.Now.Ticks.ToString()));
    //    System.TimeSpan timeSpan = (DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc));
    //    string oauth_timestamp = Convert.ToInt64(timeSpan.TotalSeconds).ToString();

    //    // create oauth signature
    //    string baseFormat = "oauth_consumer_key={0}&oauth_nonce={1}&oauth_signature_method={2}" + "&oauth_timestamp={3}&oauth_token={4}&oauth_version={5}&status={6}";

    //    string baseString = string.Format(
    //        baseFormat,
    //        oauth_consumer_key,
    //        oauth_nonce,
    //        oauth_signature_method,
    //        oauth_timestamp, oauth_token,
    //        oauth_version,
    //        Uri.EscapeDataString(message)
    //    );

    //    string oauth_signature = null;
    //    using (HMACSHA1 hasher = new HMACSHA1(ASCIIEncoding.ASCII.GetBytes(Uri.EscapeDataString(oauth_consumer_secret) + "&" + Uri.EscapeDataString(oauth_token_secret))))
    //    {
    //        oauth_signature = Convert.ToBase64String(hasher.ComputeHash(ASCIIEncoding.ASCII.GetBytes("POST&" + Uri.EscapeDataString(facebookURL) + "&" + Uri.EscapeDataString(baseString))));
    //    }

    //    // create the request header
    //    string authorizationFormat = "OAuth oauth_consumer_key=\"{0}\", oauth_nonce=\"{1}\", " + "oauth_signature=\"{2}\", oauth_signature_method=\"{3}\", " + "oauth_timestamp=\"{4}\", oauth_token=\"{5}\", " + "oauth_version=\"{6}\"";

    //    string authorizationHeader = string.Format(
    //        authorizationFormat,
    //        Uri.EscapeDataString(oauth_consumer_key),
    //        Uri.EscapeDataString(oauth_nonce),
    //        Uri.EscapeDataString(oauth_signature),
    //        Uri.EscapeDataString(oauth_signature_method),
    //        Uri.EscapeDataString(oauth_timestamp),
    //        Uri.EscapeDataString(oauth_token),
    //        Uri.EscapeDataString(oauth_version)
    //    );

    //    HttpWebRequest objHttpWebRequest = (HttpWebRequest)WebRequest.Create(facebookURL);
    //    objHttpWebRequest.Headers.Add("Authorization", authorizationHeader);
    //    objHttpWebRequest.Method = "POST";
    //    objHttpWebRequest.ContentType = "application/x-www-form-urlencoded";
    //    using (Stream objStream = objHttpWebRequest.GetRequestStream())
    //    {
    //        byte[] content = ASCIIEncoding.ASCII.GetBytes("status=" + Uri.EscapeDataString(message));
    //        objStream.Write(content, 0, content.Length);
    //    }

    //    var responseResult = "";
    //    try
    //    {
    //        //success posting
    //        WebResponse objWebResponse = objHttpWebRequest.GetResponse();
    //        StreamReader objStreamReader = new StreamReader(objWebResponse.GetResponseStream());
    //        responseResult = objStreamReader.ReadToEnd().ToString();
    //    }
    //    catch (Exception ex)
    //    {
    //        //throw exception error
    //        responseResult = "Twitter Post Error: " + ex.Message.ToString() + ", authHeader: " + authorizationHeader;
    //    }
    //}

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
        strTitle = string.Format("http://www.arabisky.com/ViewAds/{0}/{1}", strId, strTitle);
        return strTitle;
    }

    private int GetCountry()
    {
        try
        {
            switch (FormsFunction.GetCookieValueCountryInfo())
            {
                case 12:
                    sp_CountryName.InnerHtml = "الممكلة الاردنية الهاشمية";
                    spCurrany.InnerHtml = "دينار أردني";
                    return 12;
                case 14:
                    sp_CountryName.InnerHtml = "المملكة العربية السعودية";
                    spCurrany.InnerHtml = "ريال سعودي";
                    return 14;
                case 15:
                    sp_CountryName.InnerHtml = "فلسطين";
                    spCurrany.InnerHtml = "شيكل";
                    return 15;
                case 16:
                    sp_CountryName.InnerHtml = "ليبيا";
                    spCurrany.InnerHtml = "دينار";
                    return 16;
                case 17:
                    sp_CountryName.InnerHtml = "مصر";
                    spCurrany.InnerHtml = "جنيه";
                    return 17;
                case 19:
                    sp_CountryName.InnerHtml = "الإمارات العربية المتحدة";
                    spCurrany.InnerHtml = "درهم";
                    return 19;
                case 24:
                    sp_CountryName.InnerHtml = "الجمهورية العربية السورية";
                    spCurrany.InnerHtml = "ليرة";
                    return 24;
                case 23:
                    sp_CountryName.InnerHtml = "الكويت";
                    spCurrany.InnerHtml = "دينار";
                    return 23;
                case 21:
                    sp_CountryName.InnerHtml = "قطر";
                    spCurrany.InnerHtml = "ريال";
                    return 21;
                case 20:
                    sp_CountryName.InnerHtml = "البحرين";
                    spCurrany.InnerHtml = "دينار";
                    return 20;
                case 18:
                    sp_CountryName.InnerHtml = "اليمن";
                    spCurrany.InnerHtml = "ريال";
                    return 18;
                case 22:
                    sp_CountryName.InnerHtml = "عُمان";
                    spCurrany.InnerHtml = "ريال";
                    return 22;
                case 27:
                    sp_CountryName.InnerHtml = "تونس";
                    spCurrany.InnerHtml = "دينار";
                    return 27;
                case 26:
                    sp_CountryName.InnerHtml = "الجزائر";
                    spCurrany.InnerHtml = "دينار";
                    return 26;
                case 25:
                    sp_CountryName.InnerHtml = "المغرب";
                    spCurrany.InnerHtml = "درهم";
                    return 25;
                case 28:
                    sp_CountryName.InnerHtml = "لبنان";
                    spCurrany.InnerHtml = "ليرة";
                    return 28;
                case 29:
                    sp_CountryName.InnerHtml = "العراق";
                    spCurrany.InnerHtml = "دينار";
                    return 29;
                case 30:
                    sp_CountryName.InnerHtml = "السودان";
                    spCurrany.InnerHtml = "جنية";
                    return 30;
                case 31:
                    sp_CountryName.InnerHtml = "موريتانيا";
                    spCurrany.InnerHtml = "أوقية";
                    return 31;
                default:
                    Response.Redirect("country", false);
                    return 0;
            }
        }
        catch (Exception)
        {
            return 0;
        }
    }
    private string UploadAdsImages()
    {
        try
        {
            HttpFileCollection fileCollection = Request.Files;
            string sImagesPath = string.Empty;
            for (int i = 0; i < fileCollection.Count; i++)
            {
                HttpPostedFile uploadfile = fileCollection[i];

                if (uploadfile.ContentLength > 0)
                {
                    string newname = "ArabiSky_" + Guid.NewGuid().ToString();
                    string extension = Path.GetExtension(uploadfile.FileName);
                    string sFile1Path = "~/ArabiSkyImages/Ads/" + newname + extension;
                    string sFile2Path = Server.MapPath("~/ArabiSkyImages/Ads/" + newname + extension);
                    uploadfile.SaveAs(sFile2Path);
                    sImagesPath = sImagesPath + sFile1Path + "|";
                }
            }
            if (string.IsNullOrEmpty(sImagesPath))
            {
                return "";
            }
            else
            {
                return sImagesPath.Substring(0, sImagesPath.Length - 1);
            }
        }
        catch (Exception ex)
        {
            _logger.Error("AdsPage:::UploadAdsImages:::" + ex.Message);
            return "";
        }
    }
    private void ViewAdsImage(string imagesURL)
    {
        try
        {
            string[] images = imagesURL.Split('|');
            if (!string.IsNullOrEmpty(images[0].ToString()))
            {
                for (int i = 0; i < images.Length; i++)
                {
                    imgAdsImage.InnerHtml = imgAdsImage.InnerHtml + string.Format("<div id='div_" + i + "' style='float:right;margin:10px;'><div style='border: 5px solid #f9ae4c;'><img class='AdsImage' src='" + images[i].Replace("~", "..") + "' style='max-width:130px;max-height:130px;' /></div><div style='clear:both;text-align:center;margin-top: 5px;'><a href='javascript:void(0)' style='border: 0px;' onclick='funDeleteImage(\"div_{0}\")'><img src='../images/remove.png' /></a></div></div>", i);
                }
                file_upload.Attributes.Add("maxlength", (nMaxImageUpload - images.Length).ToString());
            }
        }
        catch (Exception ex)
        {
            _logger.Error("AdsPage:::ViewAdsImage:::" + ex.Message);
        }
    }
    #endregion

    #region Web Methods

    #endregion
}
