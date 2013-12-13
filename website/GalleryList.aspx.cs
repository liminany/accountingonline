using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NLog;

public partial class GalleryList : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["Tag"] != null)
            {
                switch (Request.QueryString["Tag"].ToString())
                {
                    case "RC":
                        trGC.Style.Add("display", "none");
                        trCC.Style.Add("display", "none");
                        trCR.Style.Add("display", "");
                        sp_PageTitle.InnerHtml = "مكاتب تاجير سيارات";
                        break;
                    case "GC":
                        trGC.Style.Add("display", "");
                        trCC.Style.Add("display", "none");
                        trCR.Style.Add("display", "none");
                        sp_PageTitle.InnerHtml = "معارض سيارات";
                        break;
                    case "CC":
                        trGC.Style.Add("display", "none");
                        trCC.Style.Add("display", "");
                        trCR.Style.Add("display", "none");
                        sp_PageTitle.InnerHtml = "مراكز فحص";
                        break;
                    default:
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("GalleryList:::Page_Load:::" + ex.Message);
        }
    }
    #endregion
}