using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NLog;

public partial class Admin_logout : System.Web.UI.Page
{

    private static Logger _logger = LogManager.GetCurrentClassLogger();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Session["Admin"] = null;
            Session.Remove("Admin");
            Session.Abandon();
            Response.Redirect("Login", false);
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_logout:::Page_Load:::" + ex.Message);
        }
    }
}