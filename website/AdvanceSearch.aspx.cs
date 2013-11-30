using System;
using System.Web.UI;
using DAL;
using Entity.City;
using Entity.Country;
using NLog;

public partial class AdvanceSearch : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ManageCountry objDALManageCountry = new ManageCountry();
                EntiryCountry objEntiryCountry = new EntiryCountry();
                ManageCategory objManageCategory = new ManageCategory();
                objEntiryCountry.Action = 6;
                FormsFunction.BindDDL(ref ddlCountryName, objDALManageCountry.GetAllCountry(objEntiryCountry), "CountryName", "CountryID", "إختر البلد");
                FormsFunction.BindDDL(ref ddlCategoryName, objManageCategory.GetAllCategory(), "CatName", "Cat_ID", "إختر القسم");
            }
        }
        catch (Exception ex)
        {
            _logger.Error("AdvanceSearch:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(string.Format("Search?Type=AdvanceSearch&TextSearch={0}&Country={1}&City={2}&Cat={3}&SubCat={4}&PriceForm={5}&PriceTo={6}", txtSearchText.Text.Replace(" ", "-"), ddlCountryName.SelectedValue, ddlCityName.SelectedValue, ddlCategoryName.SelectedValue, ddlSubCategoryName.SelectedValue, txtPriceForm.Text, txtPriceTo.Text), false);
        }
        catch (Exception ex)
        {
            _logger.Error("AdvanceSearch:::btnSearch_Click:::" + ex.Message);
        }
    }
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
            _logger.Error("AdvanceSearch:::ddlCountryName_SelectedIndexChanged:::" + ex.Message);
        }
    }
    protected void ddlCategoryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ManageSubCategory objManageSubCategory = new ManageSubCategory();
            FormsFunction.BindDDL(ref ddlSubCategoryName, objManageSubCategory.GetAllSubCatByCatID(int.Parse(ddlCategoryName.SelectedValue)), "SubCategoriesName", "SubCategoriesID", "إختر القسم الفرعي");
        }
        catch (Exception ex)
        {
            _logger.Error("AdvanceSearch:::ddlCategoryName_SelectedIndexChanged:::" + ex.Message);
        }
    }
    #endregion

    #region Methods
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