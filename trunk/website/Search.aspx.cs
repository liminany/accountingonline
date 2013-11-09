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
                if (Request.Url.AbsoluteUri.IndexOf("Type") >= 0)
                {
                    string sSearchType = Request.QueryString["Type"].ToString();
                    string sSearchText = string.Empty;
                    int nSearchID = 0;
                    int nSearchSubCat = 0;
                    int nCountryCode = 0;
                    int nCityID = 0;
                    switch (sSearchType)
                    {
                        case "SearchLast":
                            sp_SearchTitle.InnerHtml = "تابع مشاهدة اخر الإعلانات";
                            Page.Title = "موقع سماء العرب | " + sp_SearchTitle.InnerHtml;
                            Page.MetaDescription = "موقع سماء العرب - ArabiSky.com | " + sSearchText;
                            nSearchID = 2;
                            break;
                        case "Newest":
                            sp_SearchTitle.InnerHtml = "تابع أكثر الإعلانات مشاهدة";
                            Page.Title = "موقع سماء العرب | " + sp_SearchTitle.InnerHtml;
                            Page.MetaDescription = "موقع سماء العرب - ArabiSky.com | " + sSearchText;
                            nSearchID = 1;
                            break;
                        case "Search":
                            sp_SearchTitle.InnerHtml = "بحث مخصص";
                            nCountryCode = int.Parse(Request.QueryString["CountryCode"].ToString());
                            nCityID = int.Parse(Request.QueryString["CityID"].ToString());
                            nSearchSubCat = int.Parse(Request.QueryString["SubCat"].ToString());
                            Page.MetaDescription = "موقع سماء العرب - ArabiSky.com | " + sSearchText;
                            nSearchID = 4;
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
                    DataSet objDataSetSearch = obDBAdsManager.ArabiSkySearch(Convert.ToInt16(arabiSkyCountry[0]), nSearchID, sSearchText, nSearchSubCat, nCityID);
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