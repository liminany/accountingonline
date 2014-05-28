<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<script RunAt="server">    


    void Application_BeginRequest(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["AdsID"] != null)
            {
                Response.RedirectPermanent("http://www.arabisky.com/" + GenerateURLGoogle(Request.QueryString["AdsID"].ToString(), false));
            }
            
            if (HttpContext.Current.Request.Url.AbsoluteUri.StartsWith("http://arabisky"))
            {
                string newUrl = string.Empty;
                if (HttpContext.Current.Items["UrlRewritingNet.UrlRewriter.VirtualUrl"] != null)
                    newUrl = "http://arabisky.com/" + HttpContext.Current.Items["UrlRewritingNet.UrlRewriter.VirtualUrl"].ToString();
                else
                    newUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace("http://arabisky", "http://www.arabisky");


                Response.Status = "301 Moved Permanently";
                Response.StatusCode = 301;
                Response.StatusDescription = "Moved Permanently";
                Response.AddHeader("Location", newUrl);
                Response.End();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
     

    public static void RegisterRoutes(RouteCollection routeCollection)
    {
        routeCollection.MapPageRoute("RouteForAdsPage", "ViewAds/{AdsID}/{AdsTitle}", "~/ViewAds.aspx");
        routeCollection.MapPageRoute("RouteForCategoriesPage", "Categories/{CatID}/{Title}", "~/Categories.aspx");
        routeCollection.MapPageRoute("RouteForCategoryPage", "Category/{CatID}/{Title}", "~/Category.aspx");
        
    }

    protected string GenerateURLGoogle(object strId, object Title)
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
        strTitle = string.Format("ViewAds/{0}/{1}", strId, strTitle);
        return strTitle;
    }
    
    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    //static public string GetCountry()
    //{
    //    return new System.Net.WebClient().DownloadString("http://api.hostip.info/country.php");
    //}


    void Session_Start(object sender, EventArgs e)
    {
        ////Code that runs when a new session is started
        //if (FormsFunction.GetCookieData().Length == 0)
        //{
        //    try
        //    {
        //        switch (FormsFunction.GetCountryName())
        //        {
        //            case "JO":
        //                FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
        //                break;
        //            case "JOR":
        //                FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
        //                break;
        //            case "SA":
        //                FormsFunction.SetCookieValueCountryInfo(14, "المملكة العربية السعودية");
        //                break;
        //            case "SAU":
        //                FormsFunction.SetCookieValueCountryInfo(14, "المملكة العربية السعودية");
        //                break;
        //            case "PS":
        //                FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
        //                break;
        //            case "PSE":
        //                FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
        //                break;
        //            case "IL":
        //                FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
        //                break;
        //            case "ISR":
        //                FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
        //                break;
        //            default:
        //                FormsFunction.SetCookieValueCountryInfo(14, "المملكة العربية السعودية");
        //                break;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
        //    }
        //}
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
