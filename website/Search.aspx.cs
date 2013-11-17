using System;
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

                string sQueryStringAdsID = Request.QueryString["Type"];
                if (!string.IsNullOrEmpty(sQueryStringAdsID))
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
                            Page.MetaDescription = "موقع سماء العرب - ArabiSky.com | " + sSearchText;
                            nSearchID = 2;
                            break;
                        case "Newest":
                            sp_SearchTitle.InnerHtml = "تابع مشاهدة اخر الإعلانات";
                            Page.Title = "موقع سماء العرب | " + sp_SearchTitle.InnerHtml;
                            Page.MetaDescription = "موقع سماء العرب - ArabiSky.com | " + sSearchText;
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
                            sBrand_1 = Request.QueryString["Brand1"].ToString();
                            sBrand_2 = Request.QueryString["Brand2"].ToString();
                            sp_SearchTitle.InnerHtml = " بحث " + sBrand_1 + " -  " + sBrand_2;
                            nSearchSubCat = int.Parse(Request.QueryString["subID"].ToString());
                            Page.Title = "موقع سماء العرب | " + sBrand_1 + "-" + sBrand_2;
                            Page.MetaDescription = "موقع سماء العرب - ArabiSky.com | " + sBrand_1 + " - " + sBrand_2;
                            nSearchID = 5;
                            break;
                        case "AdvanceSearch":
                            sSearchText = Request.QueryString["TextSearch"].ToString();
                            nCountryCode = Convert.ToInt32(Request.QueryString["Country"].ToString());
                            nCityID = Convert.ToInt32(Request.QueryString["City"].ToString());
                            nCatID = Convert.ToInt32(Request.QueryString["Cat"].ToString());
                            nSearchSubCat = Convert.ToInt32(Request.QueryString["SubCat"].ToString());
                            nPriceForm = Convert.ToInt32(Request.QueryString["PriceForm"].ToString() == string.Empty ? "0" : Request.QueryString["PriceForm"].ToString());
                            nPriceTo = Convert.ToInt32(Request.QueryString["PriceTo"].ToString() == string.Empty ? "0" : Request.QueryString["PriceTo"].ToString());

                            sp_SearchTitle.InnerHtml = " بحث " + " - " + sSearchText;
                            Page.Title = "موقع سماء العرب | " + " - " + sSearchText;
                            Page.MetaDescription = "موقع سماء العرب - ArabiSky.com | " + " - " + sSearchText;
                            nSearchID = 6;
                            break;
                        default:
                            sp_SearchTitle.InnerHtml = Request.QueryString["text"].ToString();
                            sSearchText = Request.QueryString["text"].ToString();
                            nSearchSubCat = int.Parse(Request.QueryString["subID"].ToString());
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
                    string[] arabiSkyCountry = FormsFunction.GetCookieValueCountryInfo();
                    DataSet objDataSetSearch = obDBAdsManager.ArabiSkySearch(Convert.ToInt16(arabiSkyCountry[0]), nSearchID, sSearchText.Replace(" ", "-"), nSearchSubCat, nCityID, sBrand_1.Replace(" ", "-"), sBrand_2.Replace(" ", "-"), nCatID, nPriceForm, nPriceTo);
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