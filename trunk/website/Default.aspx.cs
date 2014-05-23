using System;
using DAL;
using Entity;
using Entity.City;
using Entity.Country;
using NLog;
using System.Web;

public partial class _Default : System.Web.UI.Page
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
                ManageCountry objDALManageCountry = new ManageCountry();
                EntiryCountry objEntiryCountry = new EntiryCountry();
                EntityRegUsers objEntityRegUsers = new EntityRegUsers();
                UserAuthentication objUserAuthentication = new UserAuthentication();
                objEntiryCountry.Action = 6;
                FormsFunction.BindDDL(ref ddlCountryName, objDALManageCountry.GetAllCountry(objEntiryCountry), "CountryName", "CountryID", "إختر البلد");
                DBAdsManager obDBAdsManager = new DBAdsManager();
                rptlatstAdsAdded.DataSource = obDBAdsManager.GetDashbaordAds(FormsFunction.GetCookieValueCountryInfo()).Tables[0];
                rptlatstAdsAdded.DataBind();
                rptMostViewd.DataSource = obDBAdsManager.GetDashbaordAds(FormsFunction.GetCookieValueCountryInfo()).Tables[1];
                rptMostViewd.DataBind();
            }
            if (FormsFunction.GetCookieValueCountryInfo() != 12)
                ArabiSkyTools.Style.Add("display", "none");
            else
                ArabiSkyTools.Style.Add("display", "");

        }
        catch (Exception ex)
        {
            _logger.Error("_Default:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void ddlCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ManageCity objManageCity = new ManageCity();
            EntiryCity objEntiryCity = new EntiryCity();
            objEntiryCity.Action = 6;
            objEntiryCity.CityStatus = 1;
            objEntiryCity.CityName = string.Empty;
            objEntiryCity.Country_FK_ID = int.Parse(ddlCountryName.SelectedValue);
            FormsFunction.BindDDL(ref ddlCityName, objManageCity.GetAllCityByCountryID(objEntiryCity), "CityName", "CityID", "إختر المدينة");
        }
        catch (Exception ex)
        {
            _logger.Error("_Default:::ddlCountryName_SelectedIndexChanged:::" + ex.Message);
        }
    }
    protected void lbtnRefreshGVDownSearch_Click(object sender, EventArgs e)
    {
        try
        {
            string sCountryCode = ddlCountryName.SelectedValue;
            string sCityID = ddlCityName.SelectedValue;
            string sSelectedSubCat = home_search_cat_id_Default.Value;
            Response.Redirect(string.Format("~/Search?Type=Search&CountryCode={0}&CityID={1}&SubCat={2}", sCountryCode, sCityID, sSelectedSubCat), false);
        }
        catch (Exception ex)
        {
            _logger.Error("_Default:::lbtnRefreshGVDownSearch_Click:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
    protected string SplitArticlsTitle(string sArticlsText)
    {
        try
        {
            if (sArticlsText.Length > 55)
            {
                return sArticlsText.Substring(0, 54) + "...";
            }
            else
            {
                return sArticlsText.Replace("<p><br>", "");
            }
        }
        catch (Exception)
        {
            return "Unknown";
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