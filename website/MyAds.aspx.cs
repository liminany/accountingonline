using System;
using NLog;
using DAL;
using System.Data;
using Entity;

public partial class MyAds : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    EntityRegUsers objEntityRegUsers = new EntityRegUsers();
    UserAuthentication objUserAuthentication = new UserAuthentication();
    #endregion

    #region Pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (FormsFunction.GetCookieData().Length != 0 || Session["UserInfo"] != null)
                {
                    if (FormsFunction.GetCookieData().Length != 0)
                    {
                        string[] arrUserCookieInfo = FormsFunction.GetCookieData();
                        objEntityRegUsers.UserID = Convert.ToInt32(arrUserCookieInfo[0].ToString());
                    }
                    else
                    {
                        objEntityRegUsers = (EntityRegUsers)Session["UserInfo"];
                    }
                    objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(objEntityRegUsers.UserID);
                    sp_PageTitle.InnerHtml = string.Format("إعلاناتي الخاصة - عدد الإعلانات المتبقية لك : {0} إعلانات", (objEntityRegUsers.UserCountAds - objEntityRegUsers.CountAdsUsed).ToString());
                    DBAdsManager objDBAdsManager = new DBAdsManager();
                    DataSet dsMyAds = objDBAdsManager.GetAllMyAdsByUserID(objEntityRegUsers.UserID);
                    if (dsMyAds.Tables[0].Rows.Count > 0)
                    {
                        div_AdsTable.Style.Add("display", "");
                        div_EmptyAdsTable.Style.Add("display", "none");
                        rptSlimlerAds.DataSource = dsMyAds;
                        rptSlimlerAds.DataBind();
                    }
                    else
                    {
                        div_AdsTable.Style.Add("display", "none");
                        div_EmptyAdsTable.Style.Add("display", "");
                    }
                }
                else
                {
                    Response.Redirect("login", false);
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("MyAds:::Page_Load:::" + ex.Message);
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

    protected string GenerateURL(object Title, object strId)
    {
        string strTitle = Title.ToString();

        //#region Generate SEO Friendly URL based on Title

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
        strTitle = "ViewAds/" + strId + "/" + strTitle;

        return strTitle;
    }


    #endregion
}