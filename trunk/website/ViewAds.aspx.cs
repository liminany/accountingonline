using System;
using System.Web;
using DAL;
using Entity;
using NLog;
using System.Data;

public partial class ViewAds : System.Web.UI.Page
{
    #region variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    private EntityRegUsers objEntityRegUsers = new EntityRegUsers();
    public string url = string.Empty;
    public string facebookImage = "http://www.arabisky.com/images/ArabiSkyLogo.png";

    private int nRequiredUpdateAdsPeroid = 8;
    private DBAdsManager objDBAdsManager = new DBAdsManager();
    #endregion

    #region Events


    protected void btnAdsIssues_Click(object sender, EventArgs e)
    {
        try
        {
            DBAdsManager objDBAdsManager = new DBAdsManager();
            objDBAdsManager.AdsHaveIssues(Convert.ToInt32(Page.RouteData.Values["AdsID"].ToString()));
            div_UserMessage.InnerHtml = "شكرا لك لقد تم ارسال التبليغ للدعم الفني";
        }
        catch (Exception ex)
        {
            _logger.Error("ViewAds:::lbtnAdsIssues_Click:::" + ex.Message);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int nSubCatID = 0;
            int nAdsID = 0;
            int nAdsHit = 0;
            url = HttpContext.Current.Request.Url.AbsoluteUri;

            if (!string.IsNullOrEmpty(Page.RouteData.Values["AdsID"].ToString()))
            {
                if (FormsFunction.GetCookieData().Length != 0 || Session["UserInfo"] != null)
                {
                    div_SendPrivateMessage.Style.Add("display", "");
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
                }
                else
                {
                    div_SendPrivateMessage.Style.Add("display", "none");
                }

                foreach (DataRow rows in objDBAdsManager.GetAdsInformationByAdsID(Convert.ToInt32(Page.RouteData.Values["AdsID"].ToString())).Tables[0].Rows)
                {
                    sitemap.InnerHtml = "<a href='/'> سوق سماء العرب </a>" + " » <a href='../../Category/" + rows["SubCatID"].ToString() + "/" + rows["CatName"].ToString() + "'>" + rows["CatName"].ToString() + "</a> » " + rows["SubCategoriesName"].ToString();
                    spAdsTitle.InnerHtml = rows["AdsTitle"].ToString();
                    Page.Title = "سوق سماء العرب - " + rows["AdsTitle"].ToString();
                    Page.MetaDescription = "سوق سماء العرب - " + rows["AdsTitle"].ToString() + " | " + rows["CityName"].ToString() + " | " + rows["CountryName"].ToString() + " | " + rows["CatName"].ToString() + " | " + rows["SubCategoriesName"].ToString();

                    txtMessageTitle.Text = "Re : " + rows["AdsTitle"].ToString();

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
                        div_ContactSpace.Style.Add("display", "");
                    }
                    else
                    {
                        div_SendPrivateMessage.Style.Add("display", "");
                        UserControls.Style.Add("display", "none");
                        div_ContactSpace.Style.Add("display", "none");
                    }

                    if (FormsFunction.GetCookieData().Length != 0 || Session["UserInfo"] != null)
                    {
                        div_SendPrivateMessage.Style.Add("display", "");
                    }
                    else
                    {
                        div_SendPrivateMessage.Style.Add("display", "none");
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
                    rptSlimlerAds.DataSource = objDBAdsManager.GetSimlirAdsTen(nSubCatID, FormsFunction.GetCookieValueCountryInfo());
                    rptSlimlerAds.DataBind();

                    #region UserProfile
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
                }

                #endregion
            }
            else
            {
                Response.Redirect("~/Login", false);
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
            int nRetunValue = objDBAdsManager.DeleteAdsAndRejected(Convert.ToInt32(Page.RouteData.Values["AdsID"].ToString()));
            if (nRetunValue == 1)
            {
                Response.Redirect("PinddingAds", false);
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
            int nRetunValue = objDBAdsManager.ApprovedAds(Convert.ToInt32(Page.RouteData.Values["AdsID"].ToString()));
            if (nRetunValue == 1)
            {
                Response.Redirect("PinddingAds", false);
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
            UserAuthentication objUserAuthentication = new UserAuthentication();

            string sUserOwnerAdsEmailAddress = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(hfAdsUserIDOwner.Value)).UserEmailAddress.ToString();

            objUserMessages.MessageUserID = Convert.ToInt32(hfAdsUserIDOwner.Value);
            objUserMessages.MessageSendUsers = Convert.ToInt32(hfUserID.Value);
            objUserMessages.MessageTitle = txtMessageTitle.Text;
            objUserMessages.MessageBody = editor.Value;
            int nRetuenValue = objDBUserMessages.SendNewMessageForUser(objUserMessages);
            if (nRetuenValue == 1)
            {
                SendEMail objSendEMail = FormsFunction.SendAndGetEmailTempleteByArabiSkyInfo(2, sUserOwnerAdsEmailAddress, "");
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
            if (!string.IsNullOrEmpty(Page.RouteData.Values["AdsID"].ToString()))
            {
                int nReturnValue = objDBAdsManager.DeleteAdsAndRejected(Convert.ToInt32(Page.RouteData.Values["AdsID"].ToString()));
                if (nReturnValue == 1)
                {
                    Response.Redirect("../../MyAds", false);
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
            if (!string.IsNullOrEmpty(Page.RouteData.Values["AdsID"].ToString()))
            {
                DateTime newUpdateDateTime = DateTime.Now.AddDays(nRequiredUpdateAdsPeroid);
                int nReturnValue = objDBAdsManager.ReActivateAds(Convert.ToInt32(hfUserID.Value), Convert.ToInt32(Page.RouteData.Values["AdsID"].ToString()), newUpdateDateTime);
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
            if (!string.IsNullOrEmpty(Page.RouteData.Values["AdsID"].ToString()))
            {
                Response.Redirect("AdsPage?AdsID=" + Page.RouteData.Values["AdsID"].ToString(), false);
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ViewAds:::btnEditAds_Click:::" + ex.Message);
        }
    }
    #endregion

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
    private void ViewAdsImage(string imagesURL)
    {
        try
        {
            string[] images = imagesURL.Split('|');
            for (int i = 0; i < images.Length; i++)
            {
                div_Slider.InnerHtml = div_Slider.InnerHtml + "<div class='various' style='margin-top: 15px;cursor:pointer;border:2px solid #333;height:168px;width:200px;float:right;margin-right: 10px;'><a class='fancybox' rel='gallery1' href='" + "../" + images[i].Replace("~", "..") + "'><img style='max-width: 200px;max-height: 168px;width:200px;height:168px;' src='" + "../" + images[i].Replace("~", "..") + "' alt='' /></a></div>";
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
    #endregion

}