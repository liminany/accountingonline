using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Entity;
using NLog;

public partial class Admin_ViewAds : ParentPage
{
    #region variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region Events
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.Url.AbsoluteUri.IndexOf("AdsID") >= 0)
            {
                DBAdsManager objDBAdsManager = new DBAdsManager();
                AdsManager objAdsManager = objDBAdsManager.GetAdsInfoByAdsID(int.Parse(Request.QueryString["AdsID"].ToString()));
                AdsTitle.InnerHtml = objAdsManager.AdsTitle;
                spAdsFullDescription.InnerHtml = objAdsManager.AdsDescription;
                div_YouTubeURL.InnerHtml = string.Format("<iframe width='680' height='400' src='{0}' frameborder='0' allowfullscreen=''></iframe>", RunVedio(objAdsManager.AdsYouTubeURL));
                if (!string.IsNullOrEmpty(objAdsManager.AdsImages))
                {
                    ViewAdsImage(objAdsManager.AdsImages);
                }
                else
                {
                    div_Images.InnerHtml = "لايوجد صور مرفقة في الإعلان";
                }

            }
            else
            {
                Response.Redirect("PinddingAds", false);
            }

        }
        catch (Exception ex)
        {
            _logger.Error("Admin_ViewAds:::Page_Load:::" + ex.Message);
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
                sp_UserMessage.InnerHtml = "هناك خطأ في رفض الاعلان الرجاء مراجعة الدعم الفني";
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_ViewAds:::btnRejected_Click:::" + ex.Message);
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
                sp_UserMessage.InnerHtml = "هناك خطأ في قبول الاعلان الرجاء مراجعة الدعم الفني";
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_ViewAds:::btnAccepted_Click:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
    private void ViewAdsImage(string imagesURL)
    {
        try
        {
            string[] images = imagesURL.Split('|');
            for (int i = 0; i < images.Length; i++)
            {
                div_Images.InnerHtml += "<img style='width:200px;height: 200px;' src='" + images[i].Replace("~", "..") + "' /><br /><br />";
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

            throw;
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
    #endregion
}