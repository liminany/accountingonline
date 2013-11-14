using System;
using System.Text;
using System.Web;
using System.Xml;
using NLog;

/// <summary>
/// RSS writer that emits RSS feeds. 
/// </summary>
public class SearchEngineOptimization
{

    #region Variable
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    XmlTextWriter xtwFeed;
    #endregion

    public void DoRSSGenerater(string sAdsID ,string sAdsTitle,string sAdsDescription,string sCreateDate)
    {
        try
        {
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.UTF8;
            HttpContext.Current.Response.ContentType = "text/xml";
            xtwFeed = new XmlTextWriter(HttpContext.Current.Server.MapPath("~/Settings_App/ArabiSkyRSS.xml"), Encoding.UTF8);
            xtwFeed.WriteStartDocument();
            xtwFeed.WriteStartElement("rss");
            xtwFeed.WriteAttributeString("version", "2.0");
            xtwFeed.WriteStartElement("channel");
            xtwFeed.WriteElementString("title", "ArabiSky.com classified (سوق سماء العرب)");
            xtwFeed.WriteElementString("link", "http://livekora.net");
            xtwFeed.WriteElementString("description", "سوق سماء العرب هو الطريق الأسهل لنشر اعلانات مبوبة مجانية  لبيع او شراء العقارات و الإسكان او السيارات او المركبات او الكهربائيات و الإلكترونيات او الأثاث و المفروشات او أرقام هواتف مميزة  و كذلك لنشر اعلانات  في مجال الخدمات اوللاعلان عن وظائف شاغرة او لايجاد فرصة عمل في قسم الباحثين عن عمل");
            xtwFeed.WriteElementString("copyright", "© 2013 Arabisky.com");
            xtwFeed.WriteStartElement("item");
            xtwFeed.WriteElementString("title", sAdsTitle);
            xtwFeed.WriteElementString("description", sAdsDescription);
            xtwFeed.WriteElementString("link", string.Format("http://arabisky.com/ViewAds?AdsID={0}", sAdsID));             
            xtwFeed.WriteElementString("pubDate", sCreateDate);

            xtwFeed.WriteEndElement();
            xtwFeed.WriteEndElement();
            xtwFeed.WriteEndElement();
            xtwFeed.WriteEndDocument();

            xtwFeed.Flush();
        }
        catch (System.Exception ex)
        {
            _logger.Error("RSSFeedsGeneraters:::DoRSSGenerater():::" + ex.Message);
        }
        finally
        {
            xtwFeed.Close();
        }

    }

    public void SiteMapGenerater(string loc, string lastmod, string changefreq, string priority)
    {
        //_root root for new element
        // path sitemap physical location eg sitemap.xml  (at root)

        string path = "sitemap/sitemap.xml";
        try
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(HttpContext.Current.Server.MapPath(path));
            XmlNode snippet = doc.CreateNode(XmlNodeType.Element, "url", doc.DocumentElement.NamespaceURI);
            XmlNode _loc = doc.CreateNode(XmlNodeType.Element, "loc", doc.DocumentElement.NamespaceURI);
            _loc.InnerText = loc;
            XmlNode _lastmod = doc.CreateNode(XmlNodeType.Element, "lastmod", doc.DocumentElement.NamespaceURI);
            _lastmod.InnerText = DateTime.Now.ToString("yyyy-MM-dd");
            XmlNode _changefreq = doc.CreateNode(XmlNodeType.Element, "changefreq", doc.DocumentElement.NamespaceURI);
            _changefreq.InnerText = changefreq;
            XmlNode _priority = doc.CreateNode(XmlNodeType.Element, "priority", doc.DocumentElement.NamespaceURI);
            _priority.InnerText = priority;
            snippet.AppendChild(_loc);
            snippet.AppendChild(_lastmod);
            snippet.AppendChild(_changefreq);
            snippet.AppendChild(_priority);
            int cnt = doc.ChildNodes.Count;
            int g = snippet.Attributes.Count;
            doc.ChildNodes.Item(cnt - 1).AppendChild(snippet);
            doc.Save(HttpContext.Current.Server.MapPath(path));
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}