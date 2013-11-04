using System;
using System.IO;
using System.Net;
using System.Web;
using System.Xml;
using DAL;
using Entity;
using Entity.City;
using NLog;

public partial class AdsPage : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    UserAuthentication objUserAuthentication = new UserAuthentication();
    EntityRegUsers objEntityRegUsers = new EntityRegUsers();
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
                    hfCountryID.Value = GetCountry().ToString();
                    int countryCode = Convert.ToInt32(hfCountryID.Value);
                    ManageCity objManageCity = new ManageCity();
                    EntiryCity objEntiryCity = new EntiryCity();
                    ManageCategory objManageCategory = new ManageCategory();
                    objEntiryCity.Action = 6;
                    objEntiryCity.CityStatus = 1;
                    objEntiryCity.CityName = string.Empty;
                    objEntiryCity.Country_FK_ID = countryCode;
                    FormsFunction.BindDDL(ref ddlCityName, objManageCity.GetAllCityByCountryID(objEntiryCity), "CityName", "CityID", "إختر المدينة");
                    FormsFunction.BindDDL(ref ddlCategoryName, objManageCategory.GetAllCategory(), "CatName", "Cat_ID", "إختر القسم");
                }
                else
                {
                    Response.Redirect("login", false);
                }
            }

            objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(hfUserID.Value));
            if (objEntityRegUsers.CountAdsUsed >= objEntityRegUsers.UserCountAds)
            {
                trUserMessage.Style.Add("display", "");
                trUserMessage.Style.Add("background-color", "red");
                trUserMessage.Style.Add("color", "#fff");
                trUserMessage.Style.Add("height", "30px");
                spUserMessages.InnerHtml = "<img style='width: 30px;' alt='arabiSky.com' src='images/Warning.png' />&nbsp;<span style='position: relative; bottom: 7px;'>لقد تجاوزت عدد الإعلانات المسموح لك بإستعمالها</span></a>";

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
            DBAdsManager objDBAdsManager = new DBAdsManager();
            AdsManager objAdsManager = new AdsManager();
            objAdsManager.UserID = Convert.ToInt32(hfUserID.Value);
            objAdsManager.CatID = Convert.ToInt32(ddlCategoryName.SelectedValue);
            objAdsManager.SubCatID = Convert.ToInt32(ddlSubCategoryName.SelectedValue);
            objAdsManager.CountryID = Convert.ToInt32(hfCountryID.Value);
            objAdsManager.CityID = Convert.ToInt32(ddlCityName.SelectedValue);
            objAdsManager.AdsPrice = Convert.ToInt32(txtPrice.Value);
            objAdsManager.AdsTitle = txtAdsTitle.Value;
            objAdsManager.AdsDescription = editor.Value;
            objAdsManager.AdsUpdateCreateDate = DateTime.Now.AddDays(6);
            if (UploadAdsImages() != "" || UploadAdsImages() != "false")
            {
                objAdsManager.AdsImages = UploadAdsImages();
            }
            objAdsManager.AdsYouTubeURL = txtYouTubeURL.Value;
            int nReturnValue = objDBAdsManager.InsertNewAds(objAdsManager);
            trUserMessage.Style.Add("display", "");
            if (nReturnValue != 0)
            {
                spUserMessages.InnerHtml = string.Format("<img style='height: 15px; width: 15px;' alt='arabiSky.com' src='images/jobsbullet.jpg' /> تم إضافة الاعلان بنجاح <a href='ViewAds?AdsID={0}'>انقر هنا لمشاهدة الإعلان</a>", nReturnValue.ToString());
                txtAdsTitle.Value = string.Empty;
                txtPrice.Value = string.Empty;
                txtYouTubeURL.Value = string.Empty;
                ddlCategoryName.SelectedIndex = -1;
                ddlCityName.SelectedIndex = -1;
                ddlSubCategoryName.SelectedIndex = -1;
                editor.Value = string.Empty;
                txtAdsTitle.Focus();
            }
            else
            {
                spUserMessages.InnerHtml = "<img style='width: 30px;' alt='arabiSky.com' src='images/Warning.png' />&nbsp;<span style='position: relative; bottom: 7px;'>هناك خطأ في إضافة الاعلان الرجاء المحاولة فيما بعد</span></a>";
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
            FormsFunction.BindDDL(ref ddlSubCategoryName, objManageSubCategory.GetAllSubCatByCatID(ddlCategoryName.SelectedIndex), "SubCategoriesName", "SubCategoriesID", "إختر القسم الفرعي");
        }
        catch (Exception ex)
        {
            _logger.Error("AdsPage:::ddlCategoryName_SelectedIndexChanged:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
    private int GetCountry()
    {
        try
        {
            WebClient objWebClient = new WebClient();
            //string sCountryStr = objWebClient.DownloadString("http://api.hostip.info/country.php");
            XmlDocument objXmlDocument = new XmlDocument();
            objXmlDocument.LoadXml(objWebClient.DownloadString("http://ip-json.rhcloud.com/xml"));
            XmlNode node = objXmlDocument.DocumentElement.SelectSingleNode("/Response/country_code");
            if (!string.IsNullOrEmpty(node.InnerText))
            {
                switch (node.InnerText)
                {
                    case "JO":
                        sp_CountryName.InnerHtml = "الممكلة الاردنية الهاشمية";
                        spCurrany.InnerHtml = "دينار أردني";
                        return 12;
                    case "JOR":
                        sp_CountryName.InnerHtml = "الممكلة الاردنية الهاشمية";
                        spCurrany.InnerHtml = "دينار أردني";
                        return 12;
                    case "SA":
                        sp_CountryName.InnerHtml = "المملكة العربية السعودية";
                        spCurrany.InnerHtml = "ريال سعودي";
                        return 14;
                    case "SAU":
                        sp_CountryName.InnerHtml = "المملكة العربية السعودية";
                        spCurrany.InnerHtml = "ريال سعودي";
                        return 14;
                    case "PS":
                        sp_CountryName.InnerHtml = "فلسطين";
                        spCurrany.InnerHtml = "شيكل";
                        return 15;
                    case "PSE":
                        sp_CountryName.InnerHtml = "فلسطين";
                        spCurrany.InnerHtml = "شيكل";
                        return 15;
                    case "IL":
                        sp_CountryName.InnerHtml = "إسرائيل";
                        spCurrany.InnerHtml = "شيكل";
                        return 15;
                    case "ISR":
                        sp_CountryName.InnerHtml = "إسرائيل";
                        spCurrany.InnerHtml = "شيكل";
                        return 15;
                    default:
                        sp_CountryName.InnerHtml = "الممكلة الاردنية الهاشمية";
                        spCurrany.InnerHtml = "دينار أردني";
                        return 12;
                }
            }
            else
            {
                sp_CountryName.InnerHtml = "الممكلة الاردنية الهاشمية";
                spCurrany.InnerHtml = "دينار أردني";
                return 12;
            }
        }
        catch (Exception)
        {
            sp_CountryName.InnerHtml = "الممكلة الاردنية الهاشمية";
            spCurrany.InnerHtml = "دينار أردني";
            return 12;
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
                string fileName = Path.GetFileName(uploadfile.FileName);
                if (uploadfile.ContentLength > 0)
                {
                    uploadfile.SaveAs(Server.MapPath("~/ArabiSkyImages/Ads/") + fileName);
                    sImagesPath = sImagesPath + "~/ArabiSkyImages/Ads/" + fileName + "|";
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
            return "false";
        }
    }
    #endregion
}