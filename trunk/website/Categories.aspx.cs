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
            if (!string.IsNullOrEmpty(Request.QueryString["CatID"]))
            {
                DBAdsManager objDBAdsManager = new DBAdsManager();
                DataSet objDataSet = objDBAdsManager.GetAdsMainCategoiresByCatID(int.Parse(Request.QueryString["CatID"].ToString()), FormsFunction.GetCookieValueCountryInfo());
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
                Response.Redirect("/", false);
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
        strTitle = strTitle.Trim('-');
        strTitle = string.Format("ViewAds?AdsID={0}&AdsTitle={1}", strId, strTitle);
        return strTitle;
    }
    #endregion
}