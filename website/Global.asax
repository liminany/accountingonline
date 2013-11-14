<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<script RunAt="server">    


    void RegisterRoute(System.Web.Routing.RouteCollection routes)
    {
        //routes.MapPageRoute("ViewAds", "Ads/{AdsID}/{title}", "~/ViewAds.aspx");
       
        //routes.MapPageRoute("article-category", "{catTitle}/News/{articleID}/{title}", "~/Article.aspx");
        //routes.MapPageRoute("category", "{catID}/{title}", "~/CategoryArticles.aspx");
    }
    
    
    
    protected void Application_BeginRequest(object sender, EventArgs e)
    {
        
    }

    void Application_Start(object sender, EventArgs e)
    {
        //RegisterRoute(RouteTable.Routes);
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    static public string GetCountry()
    {
        return new System.Net.WebClient().DownloadString("http://api.hostip.info/country.php");
    }


    void Session_Start(object sender, EventArgs e)
    {
        //Code that runs when a new session is started
        if (FormsFunction.GetCookieData().Length == 0)
        {
            try
            {
                System.Net.WebClient objWebClient = new System.Net.WebClient();
                //string sCountryStr = objWebClient.DownloadString("http://api.hostip.info/country.php");
                System.Xml.XmlDocument objXmlDocument = new System.Xml.XmlDocument();
                objXmlDocument.LoadXml(objWebClient.DownloadString("http://ip-json.rhcloud.com/xml"));
                System.Xml.XmlNode node = objXmlDocument.DocumentElement.SelectSingleNode("/Response/country_code");
                if (!string.IsNullOrEmpty(node.InnerText))
                {
                    switch (node.InnerText)
                    {
                        case "JO":
                            FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
                            break;
                        case "JOR":
                            FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
                            break;
                        case "SA":
                            FormsFunction.SetCookieValueCountryInfo(14, "المملكة العربية السعودية");
                            break;
                        case "SAU":
                            FormsFunction.SetCookieValueCountryInfo(14, "المملكة العربية السعودية");
                            break;
                        case "PS":
                            FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
                            break;
                        case "PSE":
                            FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
                            break;
                        case "IL":
                            FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
                            break;
                        case "ISR":
                            FormsFunction.SetCookieValueCountryInfo(15, "الاراضي الفلسطينية");
                            break;
                        default:
                            FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
                            break;
                    }
                }
                else
                {
                    FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
                }
            }
            catch (Exception)
            {
                FormsFunction.SetCookieValueCountryInfo(12, "المملكة الاردنية الهاشمية");
            }
        }
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
