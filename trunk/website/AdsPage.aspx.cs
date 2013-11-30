using System;
using System.IO;
using System.Web;
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
    int nExpireDateCounte = 8;
    int nMaxImageUpload = 6;
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


                    string sQueryStringAdsID = Request.QueryString["AdsID"];
                    if (string.IsNullOrEmpty(sQueryStringAdsID))
                    {
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
                        spPageTitle.InnerHtml = "تعديل إعلان";
                        Page.Title = "سوق سماء العرب | تعديل معلومات إعلان";
                        Page.MetaDescription = "سوق سماء العرب | ArabiSky.com | تعديل بيانات إعلان";
                        if (Request.Url.AbsoluteUri.IndexOf("message") >= 39)
                        {
                            trUserMessage.Style.Add("display", "");
                            spUserMessages.InnerHtml = string.Format("<img style='height: 15px; width: 15px;' alt='arabiSky.com' src='images/jobsbullet.jpg' /> تم تعديل الاعلان بنجاح <a href='ViewAds?AdsID={0}'>انقر هنا لمشاهدة الإعلان</a>", Request.QueryString["AdsID"].ToString());
                            txtAdsTitle.Value = string.Empty;
                            txtPrice.Value = string.Empty;
                            txtYouTubeURL.Value = string.Empty;
                            ddlCategoryName.SelectedIndex = -1;
                            ddlCityName.SelectedIndex = -1;
                            ddlSubCategoryName.SelectedIndex = -1;
                            editor1.Value = string.Empty;
                            txtAdsTitle.Focus();
                        }
                        DBAdsManager objDBAdsManager = new DBAdsManager();
                        ManageSubCategory objManageSubCategory = new ManageSubCategory();
                        foreach (System.Data.DataRow rows in objDBAdsManager.GetAdsInformationByAdsID(Convert.ToInt32(Request.QueryString["AdsID"].ToString())).Tables[0].Rows)
                        {
                            if (hfUserID.Value == rows["UserID"].ToString())
                            {
                                spAdsTitle.InnerHtml = "تعديل إعلان - " + rows["AdsTitle"].ToString();
                                btnAddNewAds.Text = "تعديل الإعلان";
                                btnAddNewAds.OnClientClick = "javascript:return GetImageToUpdateAds();";
                                txtAdsTitle.Value = rows["AdsTitle"].ToString();
                                ddlCategoryName.SelectedValue = rows["Cat_ID"].ToString();
                                FormsFunction.BindDDL(ref ddlSubCategoryName, objManageSubCategory.GetAllSubCatByCatID(int.Parse(rows["Cat_ID"].ToString())), "SubCategoriesName", "SubCategoriesID", "إختر القسم الفرعي");
                                ddlSubCategoryName.SelectedValue = rows["SubCatID"].ToString();
                                sp_CountryName.InnerHtml = rows["CountryName"].ToString();
                                ddlCityName.SelectedValue = rows["CityID"].ToString();
                                txtPrice.Value = rows["AdsPrice"].ToString();
                                editor1.Value = rows["AdsDescription"].ToString();
                                txtYouTubeURL.Value = rows["AdsYoutubeURL"].ToString();
                                ViewAdsImage(rows["AdsImages"].ToString());
                            }
                            else
                            {
                                Response.Redirect("/",false);
                            }
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
            _logger.Error("AdsPage:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnAddNewAds_Click(object sender, EventArgs e)
    {
        try
        {
            string sQueryStringAdsID = Request.QueryString["AdsID"];
            if (string.IsNullOrEmpty(sQueryStringAdsID))
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

                    objSearchEngineOptimization.SiteMapGenerater(string.Format("http://www.arabisky.com/ViewAds?AdsID={0}", nReturnValue), DateTime.Now.ToString(), "daily", "0.69");
                    //objSearchEngineOptimization.DoRSSGenerater(nReturnValue.ToString(), txtAdsTitle.Value, editor.Value, DateTime.Now.ToString());

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
                        editor1.Value = string.Empty;
                        txtAdsTitle.Focus();
                    }
                    else
                    {
                        spUserMessages.InnerHtml = "<img style='width: 30px;' alt='arabiSky.com' src='images/Warning.png' />&nbsp;<span style='position: relative; bottom: 7px;'>هناك خطأ في إضافة الاعلان الرجاء المحاولة فيما بعد</span></a>";
                    }
                }
            }
            else
            {
                //Edit Ads Submit
                DBAdsManager objDBAdsManager = new DBAdsManager();
                AdsManager objAdsManager = new AdsManager();
                objAdsManager.AdsID = Convert.ToInt32(Request.QueryString["AdsID"].ToString());
                objAdsManager.UserID = Convert.ToInt32(hfUserID.Value);
                objAdsManager.CatID = Convert.ToInt32(ddlCategoryName.SelectedValue);
                objAdsManager.SubCatID = Convert.ToInt32(ddlSubCategoryName.SelectedValue);
                objAdsManager.CountryID = GetCountry();
                objAdsManager.CityID = Convert.ToInt32(ddlCityName.SelectedValue);
                objAdsManager.AdsPrice = Convert.ToDouble(txtPrice.Value);
                string sTextTitleAds = txtAdsTitle.Value.Replace("ة", "ه");
                sTextTitleAds = sTextTitleAds.Replace("أ", "ا");
                sTextTitleAds = sTextTitleAds.Replace("إ", "ا");
                sTextTitleAds = sTextTitleAds.Replace("إ", "ا");
                objAdsManager.AdsTitle = sTextTitleAds.ToLower();
                objAdsManager.AdsDescription = editor1.Value; 

                if (string.IsNullOrEmpty(hfEditImageAds.Value))
                {
                    objAdsManager.AdsImages = UploadAdsImages();
                }
                else
                {
                    objAdsManager.AdsImages = hfEditImageAds.Value.Substring(0, hfEditImageAds.Value.Length - 1);
                    objAdsManager.AdsImages = objAdsManager.AdsImages + "|" + UploadAdsImages();
                    if (objAdsManager.AdsImages[objAdsManager.AdsImages.Length - 1] == '|')
                    {
                        objAdsManager.AdsImages = objAdsManager.AdsImages.Substring(0, objAdsManager.AdsImages.Length - 1);
                    }
                }


                objAdsManager.AdsYouTubeURL = txtYouTubeURL.Value;
                int nReturnValue = objDBAdsManager.EditAds(objAdsManager);
                trUserMessage.Style.Add("display", "");
                if (nReturnValue != 0)
                {
                    Response.Redirect("AdsPage?AdsID=" + Request.QueryString["AdsID"].ToString() + "&message=true", false);
                }
                else
                {
                    spUserMessages.InnerHtml = "<img style='width: 30px;' alt='arabiSky.com' src='images/Warning.png' />&nbsp;<span style='position: relative; bottom: 7px;'>هناك خطأ في تعديل الاعلان الرجاء المحاولة فيما بعد</span></a>";
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
                default:
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
}