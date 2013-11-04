using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

/// <summary>
/// Summary description for GSParentPage
/// </summary>
public class ParentPage : System.Web.UI.Page
{
    public ParentPage()
    {
       
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="e"></param>
    protected override void OnLoad(EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            string strURL = this.Request.Url.PathAndQuery.Replace(".aspx", "");
            Response.Redirect("Login?BURL=" + HttpContext.Current.Server.UrlEncode(strURL),false);
        }
        base.OnLoad(e);
    }
}