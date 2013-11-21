using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Entity;
using NLog;
using System.Data;

public partial class Category : System.Web.UI.Page
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
                if (!string.IsNullOrEmpty(Request.QueryString["CatID"]))
                {
                    DBAdsManager objDBAdsManager = new DBAdsManager();
                    DataSet objDataSet = objDBAdsManager.GetAdsCategoiresByCatID(int.Parse(Request.QueryString["CatID"].ToString()),FormsFunction.GetCookieValueCountryInfo());
                    if (objDataSet.Tables[0].Rows.Count > 0)
                    {
                        string pageTitle = objDataSet.Tables[0].Rows[0].ItemArray[2].ToString() + " - " + objDataSet.Tables[0].Rows[0].ItemArray[3].ToString();
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
            _logger.Error("Category:::Page_Load:::" + ex.Message);
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
    #endregion
}