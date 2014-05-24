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
using System.Data.SqlClient;
using System.Configuration;

public partial class Category : System.Web.UI.Page
{
    #region variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    private int PageSize = 50;
    #endregion

    #region Pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!string.IsNullOrEmpty(Page.RouteData.Values["CatID"].ToString()))
            {
                DBAdsManager objDBAdsManager = new DBAdsManager();
                DataSet objDataSet = objDBAdsManager.GetAdsCategoiresByCatID(int.Parse(Page.RouteData.Values["CatID"].ToString()), FormsFunction.GetCookieValueCountryInfo());
                if (objDataSet.Tables[0].Rows.Count > 0)
                {
                    string pageTitle = objDataSet.Tables[0].Rows[0].ItemArray[2].ToString() + " - " + objDataSet.Tables[0].Rows[0].ItemArray[3].ToString();
                    CatName.InnerHtml = pageTitle;
                    Page.Title = " سوق سماء العرب | " + pageTitle;
                    Page.MetaDescription = "ArabiSky.com | سوق سماء العرب | " + pageTitle;
                    sp_PageTitle.InnerHtml = pageTitle;
                }
            }
            else
            {
                Response.Redirect("~/", false);
            }
            this.GetCustomersPageWise(1);

        }
        catch (Exception ex)
        {
            _logger.Error("Category:::Page_Load:::" + ex.Message);
        }
    }
    #endregion


    protected void Page_Changed(object sender, EventArgs e)
    {
        int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
        this.GetCustomersPageWise(pageIndex);
    }

    private void GetCustomersPageWise(int pageIndex)
    {
        string constring = ConfigurationManager.ConnectionStrings["SqlCon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("sp_GetMainAdsCategoiresByCatIDMethods", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CatID", int.Parse(Page.RouteData.Values["CatID"].ToString()));
                cmd.Parameters.AddWithValue("@countryID", FormsFunction.GetCookieValueCountryInfo());
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                con.Open();
                IDataReader idr = cmd.ExecuteReader();
                rptSlimlerAds.DataSource = idr;
                rptSlimlerAds.DataBind();
                idr.Close();
                con.Close();
                int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                this.PopulatePager(recordCount, pageIndex);
            }
        }
    }


    private void PopulatePager(int recordCount, int currentPage)
    {
        double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(PageSize));
        int pageCount = (int)Math.Ceiling(dblPageCount);
        List<ListItem> pages = new List<ListItem>();
        if (pageCount > 0)
        {
            for (int i = 1; i <= pageCount; i++)
            {
                pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
            }
        }
        rptPager.DataSource = pages;
        rptPager.DataBind();
    }


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
        strTitle = string.Format("../../ViewAds/{0}/{1}", strId, strTitle);
        return strTitle;
    }
    #endregion
}