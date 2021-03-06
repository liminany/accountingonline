﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NLog;
using DAL;
using System.Data;

public partial class Search : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region Pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Type"]))
                {
                    string sSearchType = Request.QueryString["Type"].ToString();
                    string sSearchText = string.Empty;
                    string sBrand_1 = string.Empty;
                    string sBrand_2 = string.Empty;
                    int nSearchID = 0;
                    int nSearchSubCat = 0;
                    int nCountryCode = 0;
                    int nCityID = 0;
                    int nCatID = 0;
                    int nPriceForm = 0;
                    int nPriceTo = 0;
                    switch (sSearchType)
                    {
                        case "SearchLast":
                            sp_SearchTitle.InnerHtml = "تابع أكثر الإعلانات مشاهدة";
                            Page.Title = "موقع سماء العرب | " + sp_SearchTitle.InnerHtml;
                            Page.MetaDescription = "موقع سماء العرب | تابع أكثر الإعلانات مشاهدة";
                            nSearchID = 2;
                            break;
                        case "Newest":
                            sp_SearchTitle.InnerHtml = "تابع مشاهدة اخر الإعلانات";
                            Page.Title = "موقع سماء العرب | " + sp_SearchTitle.InnerHtml;
                            Page.MetaDescription = "موقع سماء العرب | تابع مشاهدة اخر الإعلانات";
                            nSearchID = 1;
                            break;
                        case "Search":
                            sp_SearchTitle.InnerHtml = "بحث مخصص";
                            nCountryCode = int.Parse(Request.QueryString["CountryCode"].ToString());
                            nCityID = int.Parse(Request.QueryString["CityID"].ToString());
                            nSearchSubCat = int.Parse(Request.QueryString["SubCat"].ToString());
                            Page.Title = "موقع سماء العرب | " + sSearchText;
                            Page.MetaDescription = "موقع سماء العرب - ArabiSky.com | " + sSearchText;
                            nSearchID = 4;
                            break;
                        case "Brand":
                            sBrand_1 = Request.QueryString["Brand1"].ToString().Replace("-"," ");
                            sBrand_2 = Request.QueryString["Brand2"].ToString().Replace("-", " ");
                            sp_SearchWords.InnerHtml = sBrand_1 + " " + sBrand_2;
                            sp_SearchTitle.InnerHtml = " بحث " + sBrand_1 + " -  " + sBrand_2;
                            nSearchSubCat = int.Parse(Request.QueryString["subID"].ToString());
                            Page.Title = "موقع سماء العرب | " + sBrand_1 + "-" + sBrand_2;
                            Page.MetaDescription = "موقع سماء العرب - ArabiSky.com | " + sBrand_1 + " - " + sBrand_2;
                            nSearchID = 5;
                            break;
                        case "AdvanceSearch":
                            sSearchText = Request.QueryString["TextSearch"].ToString().Trim();
                            sp_SearchWords.InnerHtml = sSearchText;
                            nCountryCode = Convert.ToInt32(Request.QueryString["Country"].ToString());
                            nCityID = Convert.ToInt32(Request.QueryString["City"].ToString() == string.Empty ? "-2" : Request.QueryString["City"].ToString());
                            nCatID = Convert.ToInt32(Request.QueryString["Cat"].ToString() == string.Empty ? "-2" : Request.QueryString["Cat"].ToString());
                            nSearchSubCat = Convert.ToInt32(Request.QueryString["SubCat"].ToString() == string.Empty ? "-2" : Request.QueryString["SubCat"].ToString());
                            nPriceForm = Convert.ToInt32(Request.QueryString["PriceForm"].ToString() == string.Empty ? "0" : Request.QueryString["PriceForm"].ToString());
                            nPriceTo = Convert.ToInt32(Request.QueryString["PriceTo"].ToString() == string.Empty ? "100000" : Request.QueryString["PriceTo"].ToString());
                            sp_SearchTitle.InnerHtml = " بحث " + " - " + sSearchText;
                            Page.Title = "موقع سماء العرب | " + " - " + sSearchText;
                            Page.MetaDescription = "موقع سماء العرب - ArabiSky.com | " + " - " + sSearchText;
                            nSearchID = 6;
                            break;
                        default:
                            sp_SearchTitle.InnerHtml = Request.QueryString["text"].ToString();
                            sp_SearchWords.InnerHtml = Request.QueryString["text"].ToString();
                            hfSearchTeram.Value = Request.QueryString["text"].ToString();
                            sSearchText = Server.UrlDecode(Request.QueryString["text"].ToString().Trim()).Replace(" ", "-");;
                            nSearchSubCat = -2;
                            Page.Title = "موقع سماء العرب | " + sSearchText;
                            Page.MetaDescription = "موقع سماء العرب - ArabiSky.com | " + sSearchText;
                            nSearchID = 3;
                            break;
                    }

                    sSearchText = sSearchText.Replace("ة", "ه");
                    sSearchText = sSearchText.Replace("أ", "ا");
                    sSearchText = sSearchText.Replace("إ", "ا");
                    sSearchText = sSearchText.Replace("إ", "ا"); 
                    
                    DBAdsManager obDBAdsManager = new DBAdsManager();
                    DataSet objDataSetSearch = obDBAdsManager.ArabiSkySearch(FormsFunction.GetCookieValueCountryInfo(), nSearchID, sSearchText, nSearchSubCat, nCityID, sBrand_1, sBrand_2, nCatID, nPriceForm, nPriceTo);
                    if (objDataSetSearch.Tables[0].Rows.Count <= 0)
                    {
                        trMainAds.Style.Add("display", "none");
                        trMainEmpty.Style.Add("display", "");
                        sp_SearchWords.InnerHtml = sSearchText;
                    }
                    else
                    {
                        trMainAds.Style.Add("display", "");
                        trMainEmpty.Style.Add("display", "none");
                        rptlatstAdsAdded.DataSource = objDataSetSearch;
                        rptlatstAdsAdded.DataBind();
                    }
                }
                else
                {
                    Response.Redirect("/", false);
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Search:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
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
        strTitle = strTitle.Trim('-');
        strTitle = string.Format("ViewAds/{0}/{1}", strId, strTitle);
        return strTitle;
    }
    #endregion
}