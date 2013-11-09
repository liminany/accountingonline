using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NLog;
using DAL;
using System.Data;

public partial class Categories : System.Web.UI.Page
{
    #region variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region Pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                string sQueryStringAdsID = Request.QueryString["CatID"];
                if (!string.IsNullOrEmpty(sQueryStringAdsID))
                {
                    DBAdsManager objDBAdsManager = new DBAdsManager();
                    DataSet objDataSet = objDBAdsManager.GetAdsMainCategoiresByCatID(int.Parse(Request.QueryString["CatID"].ToString()), GetCountryCode());
                    if (objDataSet.Tables[0].Rows.Count > 0)
                    {
                        string pageTitle = objDataSet.Tables[0].Rows[0].ItemArray[2].ToString();
                        CatName.InnerHtml = pageTitle;
                        Page.Title = " سوق سماء العرب | " + pageTitle;
                        Page.MetaDescription = "ArabiSky.com | سوق سماء العرب | " + pageTitle;
                        sp_PageTitle.InnerHtml = pageTitle;
                        rptSlimlerAds.DataSource = objDataSet;
                        rptSlimlerAds.DataBind();
                    }
                }
                else
                {
                    Response.Redirect("default", false);
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Categories:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
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
    private int GetCountryCode()
    {
        try
        {
            string[] arabiSkyCountry = FormsFunction.GetCookieValueCountryInfo();
            if (!string.IsNullOrEmpty(arabiSkyCountry[0]))
            {
                return Convert.ToInt16(arabiSkyCountry[0]);
            }
            else
            {
                return 12;
            }
        }
        catch (Exception)
        {
            return 12;
        }
    }
    #endregion
}