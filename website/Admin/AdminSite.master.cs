using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NLog;
using Entity;

public partial class Admin_AdminSite : System.Web.UI.MasterPage
{
    private static Logger _logger = LogManager.GetCurrentClassLogger();


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            
        }
        catch (Exception ex)
        {
           // _logger.Error("Admin_Users:::lbtnRefreshGV_Click:::" + ex.Message);

        }
    }
}
