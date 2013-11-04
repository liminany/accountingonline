#region Using
using System;
using System.Xml;
using System.Collections.ObjectModel;
using RSSManagers;
using System.Xml.Linq;
using System.Linq;
using System.Collections;
using System.Net;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.IO;
using HtmlAgilityPack;
#endregion
[Serializable]
public class RssManager : IDisposable
{
    #region Variables
    private string _url;
    private string _feedTitle;
    private string _feedDescription;
    private string _image;
    private string _player;
    private string _fullNews;
    private Collection<Rss.Items> _rssItems = new Collection<Rss.Items>();
    private bool _IsDisposed;
    #endregion

    #region Constructors
    /// <summary>
    /// Empty constructor, allowing us to
    /// instantiate our class and set our
    /// _url variable to an empty string
    /// </summary>
    public RssManager()
    {
        _url = string.Empty;
    }

    /// <summary>
    /// Constructor allowing us to instantiate our class
    /// and set the _url variable to a value
    /// </summary>
    /// <param name="feedUrl">The URL of the Rss feed</param>
    public RssManager(string feedUrl)
    {
        _url = feedUrl;
    }

    #endregion

    #region Properties
    /// <summary>
    /// Gets or sets the URL of the RSS feed to parse.
    /// </summary>
    public string Url
    {
        get { return _url; }
        set { _url = value; }
    }


    /// <summary>
    /// Gets all the items in the RSS feed.
    /// </summary>
    public Collection<Rss.Items> RssItems
    {
        get { return _rssItems; }
    }

    /// <summary>
    /// Gets the title of the RSS feed.
    /// </summary>
    public string FeedTitle
    {
        get { return _feedTitle; }
    }

    /// <summary>
    /// Gets the description of the RSS feed.
    /// </summary>
    public string FeedDescription
    {
        get { return _feedDescription; }
    }

    /// <summary>
    /// Gets the Image of the RSS feed.
    /// </summary>
    public string Image
    {
        get { return _image; }
    }

    /// <summary>
    /// Gets the Full Name of the RSS feed.
    /// </summary>
    public string FullNews
    {
        get { return _fullNews; }
    }




    /// <summary>
    /// Gets the Player of the RSS feed.
    /// </summary>
    public string Player
    {
        get { return _player; }
    }

    #endregion

    #region Methods

    /// <summary>
    /// Retrieves the remote RSS feed and parses it.
    /// </summary>
    public Collection<Rss.Items> GetFeed()
    {
        //check to see if the FeedURL is empty
        if (String.IsNullOrEmpty(Url))
            //throw an exception if not provided
            throw new ArgumentException("You must provide a feed URL");
        //start the parsing process
        using (XmlReader reader = XmlReader.Create(Url))
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(reader);
            //parse the items of the feed
            ParseDocElements(xmlDoc.SelectSingleNode("//channel"), "title", ref _feedTitle);
            ParseDocElements(xmlDoc.SelectSingleNode("//channel"), "description", ref _feedDescription);
            ParseRssItems(xmlDoc);
            //return the feed items
            return _rssItems;
        }
    }

    /// <summary>
    /// Parses the xml document in order to retrieve the RSS items.
    /// </summary>
    private void ParseRssItems(XmlDocument xmlDoc)
    {
        _rssItems.Clear();
        XmlNodeList nodes = xmlDoc.SelectNodes("rss/channel/item");

        foreach (XmlNode node in nodes)
        {
            Rss.Items item = new Rss.Items();
            ParseDocElements(node, "title", ref item.Title);
            ParseDocElements(node, "description", ref item.Description);
            ParseDocElements(node, "link", ref item.Link);




            XmlNamespaceManager nsMgr = new XmlNamespaceManager(xmlDoc.NameTable);
            nsMgr.AddNamespace("media", "http://search.yahoo.com/mrss/");
            XmlNode Image = node.SelectSingleNode("media:content", nsMgr);
            XmlNode Vedio = node.SelectSingleNode("media:player", nsMgr);

            if (Image != null)
                item.Image = null;
            else
                item.Image = GetImageFormArticls(item.Link, item.Title);


            if (Vedio == null)
                item.Player = null;
            else
                item.Player = Vedio.Attributes["url"].Value;

            if (FullNews != null)
                item.FullNews = null;
            else
                item.FullNews = GetFullNewsFormArticls(item.Link);


            string date = null;
            ParseDocElements(node, "pubDate", ref date);
            DateTime.TryParse(date, out item.Date);

            _rssItems.Add(item);
        }
    }

    

    /// <summary>
    /// Parses the XmlNode with the specified XPath query 
    /// and assigns the value to the property parameter.
    /// </summary>
    private void ParseDocElements(XmlNode parent, string xPath, ref string property)
    {
        XmlNode node = parent.SelectSingleNode(xPath);
        if (node != null)
        {
            property = node.InnerText;
        }
        else
        {
            property = "Unresolvable";
        }
    }

    /// <summary>
    /// GetFullNewsFormArticls
    /// </summary>
    /// <param name="newsLink"></param>
    /// <returns></returns>
    private string GetFullNewsFormArticls(string newsLink)
    {
        try
        {
            WebClient client = new WebClient();
            String htmlCode = client.DownloadString(newsLink);
            HtmlDocument objHtmlDocument = new HtmlDocument();
            objHtmlDocument.LoadHtml(htmlCode);
            var node = objHtmlDocument.DocumentNode.SelectNodes("//p[@class='article_content']")[0].InnerHtml;
            return node;
        }
        catch (Exception)
        {
            throw;
        }
    }


    /// <summary>
    /// 
    /// </summary>
    /// <param name="url"></param>
    /// <param name="imageTitle"></param>
    /// <returns></returns>
    private string GetImageFormArticls(string url, string imageTitle)
    {
        try
        {
            WebClient client = new WebClient();
            String htmlCode = client.DownloadString(url);
            HtmlDocument objHtmlDocument = new HtmlDocument();
            objHtmlDocument.LoadHtml(htmlCode);
            var node = objHtmlDocument.DocumentNode.SelectNodes("//img[@alt='" + imageTitle + "']")[0].Attributes["src"].Value;
            System.Drawing.Image image = DownloadImageFromUrl(node);
            string rootPath = System.Web.HttpContext.Current.Server.MapPath("~/ArticalsImage/Full/");
            string fileName = System.IO.Path.Combine(rootPath, "livekora_" + Guid.NewGuid().ToString() + ".jpg");
            image.Save(fileName);
            return "../ArticalsImage/Full/livekora_" + Guid.NewGuid().ToString() + ".jpg";
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="imageUrl"></param>
    /// <returns></returns>
    public System.Drawing.Image DownloadImageFromUrl(string imageUrl)
    {
        System.Drawing.Image image = null;
        try
        {
            System.Net.HttpWebRequest webRequest = (System.Net.HttpWebRequest)System.Net.HttpWebRequest.Create(imageUrl);
            webRequest.AllowWriteStreamBuffering = true;
            webRequest.Timeout = 30000;
            using (System.Net.WebResponse webResponse = webRequest.GetResponse())
            {
                System.IO.Stream stream = webResponse.GetResponseStream();
                image = System.Drawing.Image.FromStream(stream);
            }
        }
        catch (Exception ex)
        {
            return null;
        }
        return image;
    }

    #endregion

    #region IDisposable Members

    /// <summary>
    /// Performs the disposal.
    /// </summary>
    private void Dispose(bool disposing)
    {
        if (disposing && !_IsDisposed)
        {
            _rssItems.Clear();
            _url = null;
            _feedTitle = null;
            _feedDescription = null;
            _image = null;
            _player = null;
        }

        _IsDisposed = true;
    }

    /// <summary>
    /// Releases the object to the garbage collector
    /// </summary>
    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }

    #endregion

}