using System;
using DAL;
using Entity;
using NLog;
using System.Web;

public partial class ViewAds : System.Web.UI.Page
{
    #region variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    EntityRegUsers objEntityRegUsers = new EntityRegUsers();
    public string url = string.Empty;
    #endregion

    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            url = HttpContext.Current.Request.Url.AbsoluteUri;
            if (!IsPostBack)
            {
                string sQueryStringAdsID = Request.QueryString["AdsID"];
                if (!string.IsNullOrEmpty(sQueryStringAdsID))
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
                        //div_SendPrivateMessage.Style.Add("display", "");
                    }
                    else
                    {
                        //div_SendPrivateMessage.Style.Add("display", "none");
                    }



                    DBAdsManager objDBAdsManager = new DBAdsManager();
                    int nSubCatID = 0;
                    int nAdsID = 0;
                    int nAdsHit = 0;
                    foreach (System.Data.DataRow rows in objDBAdsManager.GetAdsInformationByAdsID(Convert.ToInt32(Request.QueryString["AdsID"].ToString())).Tables[0].Rows)
                    {
                        sitemap.InnerHtml = "<a href='/'> سوق سماء العرب </a>" + " » <a href='Category?CatID=" + rows["SubCatID"].ToString() + "'>" + rows["CatName"].ToString() + "</a> » " + rows["SubCategoriesName"].ToString();
                        spAdsTitle.InnerHtml = rows["AdsTitle"].ToString();
                        Page.Title = "سوق سماء العرب - " + rows["AdsTitle"].ToString();
                        Page.MetaDescription = "سوق سماء العرب - " + rows["AdsTitle"].ToString() + " | " + rows["CityName"].ToString() + " | " + rows["CountryName"].ToString() + " | " + rows["CatName"].ToString() + " | " + rows["SubCategoriesName"].ToString();

                        if (Convert.ToInt32(rows["AdsPrice"].ToString()) > 0)
                        {
                            sp_Price.InnerHtml = string.Format("السعر {0} {1}", rows["AdsPrice"].ToString(), GetCurrancyTags());
                        }
                        else
                        {
                            sp_Price.Style.Add("display", "none");
                        }

                        liCity.InnerHtml = "المدينة : " + rows["CityName"].ToString();
                        liCountry.InnerHtml = "البلد : " + rows["CountryName"].ToString();
                        liCreateDate.InnerHtml = "تاريخ الإضافة : " + Convert.ToDateTime(rows["AdsCreateDate"].ToString()).ToShortDateString();
                        liSection.InnerHtml = "القسم : " + rows["CatName"].ToString();
                        liSubSection.InnerHtml = "القسم الفرعي : " + rows["SubCategoriesName"].ToString();
                        hfUpdateDateTime.Value = rows["AdsUpdateCreateDate"].ToString();
                        nAdsID = Convert.ToInt32(rows["AdsID"].ToString());
                        nSubCatID = Convert.ToInt32(rows["SubCatID"].ToString());
                        nAdsHit = Convert.ToInt32(rows["AdsHit"].ToString());

                        hfAdsUserIDOwner.Value = rows["UserID"].ToString();
                        if (hfAdsUserIDOwner.Value == hfUserID.Value)
                        {
                            div_SendPrivateMessage.Style.Add("display", "none");
                            UserControls.Style.Add("display", "");
                            //div_ContactUser.Style.Add("display", "none");
                            div_ContactSpace.Style.Add("display", "");
                        }
                        else
                        {
                            div_SendPrivateMessage.Style.Add("display", "");
                            //div_ContactUser.Style.Add("display", "");
                            UserControls.Style.Add("display", "none");
                            div_ContactSpace.Style.Add("display", "none");
                        }
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
                            div_Image.Style.Add("display", "");
                            ViewAdsImage(rows["AdsImages"].ToString());
                        }
                        else
                        {
                            div_Slider.Style.Add("display", "none");
                            div_Image.Style.Add("display", "none");
                        }
                        rptSlimlerAds.DataSource = objDBAdsManager.GetSimlirAdsTen(nSubCatID, GetCountryCode());
                        rptSlimlerAds.DataBind();

                        #region UserProfile
                        sp_UserFullName.InnerHtml = rows["User_FullName"].ToString();
                        aEmailAddress.InnerHtml = rows["User_EmailAddress"].ToString();
                        ahrefUserProfile.HRef = "UserProfile?UserID=" + rows["UserID"].ToString();
                        if (string.IsNullOrEmpty(rows["User_Image"].ToString()))
                        {
                            imgUserProfile.Src = "images/ArabiSkyUnknowUser.png";
                        }
                        else
                        {
                            imgUserProfile.Src = rows["User_Image"].ToString();
                        }
                        #endregion
                    }

                    #region AdsCounterHit
                    nAdsHit = nAdsHit + 1;
                    objDBAdsManager.EditAdsCounter(nAdsID, nAdsHit);
                    #endregion

                    #region Reactive Ads
                    TimeSpan t = Convert.ToDateTime(hfUpdateDateTime.Value) - DateTime.Now;
                    if (t.TotalDays >= 0)
                    {
                        btnReactivateAds.Visible = false;
                    }
                    else
                    {
                        btnReactivateAds.Visible = true;
                        //if (string.IsNullOrEmpty(hfUserID.Value) || hfAdsUserIDOwner.Value != hfUserID.Value)
                        //{
                        //    Response.Redirect("/", false);
                        //}
                        //else
                        //{
                        //    btnReactivateAds.Visible = true;
                        //}
                    }

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
            _logger.Error("ViewAds:::Page_Load:::" + ex.Message);
        }
    }
    protected void btnRejected_Click(object sender, EventArgs e)
    {
        try
        {
            DBAdsManager objDBAdsManager = new DBAdsManager();
            int nRetunValue = objDBAdsManager.DeleteAdsAndRejected(int.Parse(Request.QueryString["AdsID"].ToString()));
            if (nRetunValue == 1)
            {
                Response.Redirect("PinddingAds");
            }
            else
            {
                //sp_UserMessage.InnerHtml = "هناك خطأ في رفض الاعلان الرجاء مراجعة الدعم الفني";
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ViewAds:::btnRejected_Click:::" + ex.Message);
        }
    }
    protected void btnAccepted_Click(object sender, EventArgs e)
    {
        try
        {
            DBAdsManager objDBAdsManager = new DBAdsManager();
            int nRetunValue = objDBAdsManager.ApprovedAds(int.Parse(Request.QueryString["AdsID"].ToString()));
            if (nRetunValue == 1)
            {
                Response.Redirect("PinddingAds");
            }
            else
            {
                //sp_UserMessage.InnerHtml = "هناك خطأ في قبول الاعلان الرجاء مراجعة الدعم الفني";
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ViewAds:::btnAccepted_Click:::" + ex.Message);
        }
    }
    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        try
        {
            DBUserMessages objDBUserMessages = new DBUserMessages();
            UserMessages objUserMessages = new UserMessages();
            objUserMessages.MessageUserID = Convert.ToInt32(hfAdsUserIDOwner.Value);
            objUserMessages.MessageSendUsers = Convert.ToInt32(hfUserID.Value);
            objUserMessages.MessageTitle = txtMessageTitle.Text;
            objUserMessages.MessageBody = editor.Value;
            int nRetuenValue = objDBUserMessages.SendNewMessageForUser(objUserMessages);
            if (nRetuenValue == 1)
            {
                div_UserMessage.InnerHtml = "لقد تم إرسال الرسالة بنجاح";
            }
            else
            {
                div_UserMessage.InnerHtml = "هناك خطأ في إرسال الرسالة الرجاء المحاولة فيما بعد";
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ViewAds:::btnSendMessage_Click:::" + ex.Message);
        }
    }
    protected void btnDeleteAds_Click(object sender, EventArgs e)
    {
        try
        {
            string sQueryStringAdsID = Request.QueryString["AdsID"];
            if (!string.IsNullOrEmpty(sQueryStringAdsID))
            {
                DBAdsManager objDBAdsManager = new DBAdsManager();
                int nReturnValue = objDBAdsManager.DeleteAdsAndRejected(int.Parse(Request.QueryString["AdsID"].ToString()));
                if (nReturnValue == 1)
                {
                    Response.Redirect("MyAds");
                }
                else
                {
                    Response.Write("<script>alert('هناك خطأ في حذف الإعلان الرجاء المحاولة فيما بعد');</script>");
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ViewAds:::btnDeleteAds_Click:::" + ex.Message);
        }
    }
    protected void btnReactivateAds_Click(object sender, EventArgs e)
    {
        try
        {

            string sQueryStringAdsID = Request.QueryString["AdsID"];
            if (!string.IsNullOrEmpty(sQueryStringAdsID))
            {
                DBAdsManager objDBAdsManager = new DBAdsManager();
                //DateTime updateDateTime = Convert.ToDateTime(hfUpdateDateTime.Value);
                DateTime newUpdateDateTime = DateTime.Now.AddDays(6);
                int nReturnValue = objDBAdsManager.ReActivateAds(Convert.ToInt32(hfUserID.Value), Convert.ToInt32(Request.QueryString["AdsID"].ToString()), newUpdateDateTime);
                if (nReturnValue == 1)
                {
                    Response.Write("<script>alert('لقد تم إعادة تفعيل الإعلان بنجاح');</script>");
                    btnReactivateAds.Visible = false;
                }
                else
                {
                    Response.Write("<script>alert('هناك خطأ في إعادة تفعيل الإعلان الرجاء المحاولة فيما بعد');</script>");
                    btnReactivateAds.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ViewAds:::btnReactivateAds_Click:::" + ex.Message);
        }
    }
    protected void btnEditAds_Click(object sender, EventArgs e)
    {
        try
        {
            string sQueryStringAdsID = Request.QueryString["AdsID"];
            if (!string.IsNullOrEmpty(sQueryStringAdsID))
            {
                Response.Redirect("AdsPage?AdsID=" + Request.QueryString["AdsID"].ToString(), false);
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ViewAds:::btnEditAds_Click:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
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
                default:
                    return "غير معروف";
            }
        }
        catch (Exception)
        {
            return "غير معروف";
        }
    }
    private int GetCountryCode()
    {
        try
        {
            return FormsFunction.GetCookieValueCountryInfo();
        }
        catch (Exception)
        {
            return 12;
        }
    }

     
    private void ViewAdsImage(string imagesURL)
    {
        try
        {
            string[] images = imagesURL.Split('|');
            for (int i = 0; i < images.Length; i++)
            {
                div_Slider.InnerHtml = div_Slider.InnerHtml + "<div class='various' style='cursor:pointer;border:2px solid #333;height:120px;width:120px;float:right;margin-right: 10px;'><a class='fancybox' rel='gallery1' href='" + images[i].Replace("~", "..") + "'><img style='max-width: 120px;max-height: 120px;width:120px;height:120px;' src='" + images[i].Replace("~", "..") + "' alt='' /></a></div>";
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
            }
            else
            {
                return "images/ArabiSkyLogo.png";
            }
        }
        catch (Exception)
        {
            return "null";
        }
    }
    protected string GenerateURL(object Title, object strId)
    {
        string strTitle = Title.ToString();

        //#region Generate SEO Friendly URL based on Title

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
        strTitle = strTitle.Trim('-');
        strTitle = "ViewAds/" + strId + "/" + strTitle;
        return strTitle;
    }
    #endregion

}