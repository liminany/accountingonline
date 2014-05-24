using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SearchEngineOptimization objSearchEngineOptimization = new SearchEngineOptimization();
            DBAdsManager objDBAdsManager = new DBAdsManager();

            foreach (System.Data.DataRow item in objDBAdsManager.GetAllApprovedAds().Tables[0].Rows)
            {
                objSearchEngineOptimization.SiteMapGenerater(string.Format("http://www.arabisky.com/ViewAds/{0}/{1}", item[0], item[1]), DateTime.Now.ToString(), "daily", "0.69");
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
}