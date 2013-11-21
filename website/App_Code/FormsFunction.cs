using System;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Entity;
using NLog;
using System.Collections;

/// <summary>
/// Summary description for FormsFunction
/// </summary>
public class FormsFunction
{

    #region Variables
    private static XmlDocument xmlDoc = null;
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    /// <summary>
    /// Retrieve Web Config
    /// </summary>
    /// <returns>retrive SiteConfiguration object</returns>
    public static SiteConfiguration RetrieveWebConfig()
    {
        try
        {
            SiteConfiguration objSiteConfiguration = new SiteConfiguration();
            using (StreamReader objStreamReader = new StreamReader(HttpContext.Current.Server.MapPath("~/Settings_App/Settings.xml")))
            {

                XmlDocument xmlDocument = new XmlDocument();
                xmlDoc = new XmlDocument();
                xmlDoc.LoadXml(objStreamReader.ReadToEnd());
                XmlNodeList xmlNodeSiteName = xmlDoc.GetElementsByTagName("SiteName");
                XmlNodeList xmlNodeSiteMetaDescription = xmlDoc.GetElementsByTagName("SiteMetaDescription");
                XmlNodeList xmlNodeSiteMetaKeywords = xmlDoc.GetElementsByTagName("SiteMetaKeywords");
                XmlNodeList xmlNodeSiteOffline = xmlDoc.GetElementsByTagName("SiteOffline");
                XmlNodeList xmlNodeLogStatus = xmlDoc.GetElementsByTagName("LogStatus");
                XmlNodeList xmlNodeLogPath = xmlDoc.GetElementsByTagName("LogPath");
                XmlNodeList xmlNodeCacheStatus = xmlDoc.GetElementsByTagName("CacheStatus");
                XmlNodeList xmlNodeSessionLifetime = xmlDoc.GetElementsByTagName("SessionLifetime");
                XmlNodeList xmlNodeTestServer = xmlDoc.GetElementsByTagName("TestServer");
                XmlNodeList xmlNodeDatabaseType = xmlDoc.GetElementsByTagName("DatabaseType");
                XmlNodeList xmlNodeHost = xmlDoc.GetElementsByTagName("Host");
                XmlNodeList xmlNodeDatabaseUsername = xmlDoc.GetElementsByTagName("DatabaseUsername");
                XmlNodeList xmlNodeDatabasePassword = xmlDoc.GetElementsByTagName("DatabasePassword");
                XmlNodeList xmlNodeDatabaseName = xmlDoc.GetElementsByTagName("DatabaseName");
                XmlNodeList xmlNodeFromEmail = xmlDoc.GetElementsByTagName("FromEmail");
                XmlNodeList xmlNodeFromName = xmlDoc.GetElementsByTagName("FromName");
                XmlNodeList xmlNodeSMTPAuthentication = xmlDoc.GetElementsByTagName("SMTPAuthentication");
                XmlNodeList xmlNodeSMTPSecurity = xmlDoc.GetElementsByTagName("SMTPSecurity");
                XmlNodeList xmlNodeSMTPPort = xmlDoc.GetElementsByTagName("SMTPPort");
                XmlNodeList xmlNodeSMTPUsername = xmlDoc.GetElementsByTagName("SMTPUsername");
                XmlNodeList xmlNodeSMTPPassword = xmlDoc.GetElementsByTagName("SMTPPassword");
                XmlNodeList xmlNodeSMTPHost = xmlDoc.GetElementsByTagName("SMTPHost");
                XmlNodeList xmlNodeIsStreamLive = xmlDoc.GetElementsByTagName("IsStreamLive");
                if (xmlDoc != null)
                {
                    objSiteConfiguration.SiteName = xmlNodeSiteName[0].InnerText;
                    objSiteConfiguration.MetaDescription = xmlNodeSiteMetaDescription[0].InnerText;
                    objSiteConfiguration.MetaKeywords = xmlNodeSiteMetaKeywords[0].InnerText;
                    objSiteConfiguration.SiteOffline = xmlNodeSiteOffline[0].InnerText;
                    objSiteConfiguration.LogStatus = xmlNodeLogStatus[0].InnerText;
                    objSiteConfiguration.LogPath = xmlNodeLogPath[0].InnerText;
                    objSiteConfiguration.CacheStatus = xmlNodeCacheStatus[0].InnerText;
                    objSiteConfiguration.SessionLifetime = Convert.ToInt16(xmlNodeSessionLifetime[0].InnerText);
                    objSiteConfiguration.DatabaseType = xmlNodeDatabaseType[0].InnerText;
                    objSiteConfiguration.Host = xmlNodeHost[0].InnerText;
                    objSiteConfiguration.DatabaseUsername = xmlNodeDatabaseUsername[0].InnerText;
                    objSiteConfiguration.DatabasePassword = xmlNodeDatabasePassword[0].InnerText;
                    objSiteConfiguration.DatabaseName = xmlNodeDatabaseName[0].InnerText;
                    objSiteConfiguration.FromEmail = xmlNodeFromEmail[0].InnerText;
                    objSiteConfiguration.FromName = xmlNodeFromName[0].InnerText;
                    objSiteConfiguration.SMTPAuthentication = xmlNodeSMTPAuthentication[0].InnerText;
                    objSiteConfiguration.SMTPSecurity = Convert.ToInt16(xmlNodeSMTPSecurity[0].InnerText);
                    objSiteConfiguration.SMTPPort = Convert.ToInt16(xmlNodeSMTPPort[0].InnerText);
                    objSiteConfiguration.SMTPUsername = xmlNodeSMTPUsername[0].InnerText;
                    objSiteConfiguration.SMTPPassword = xmlNodeSMTPPassword[0].InnerText;
                    objSiteConfiguration.SMTPHost = xmlNodeSMTPHost[0].InnerText;
                    objSiteConfiguration.IsLiveStreamEnable = Convert.ToInt16(xmlNodeIsStreamLive[0].InnerText);
                }
            }
            return objSiteConfiguration;
        }
        catch (Exception ex)
        {
            _logger.Error("FormsFunction:::RetrieveWebConfig:::" + ex.Message);
            throw ex;
        }
    }

    /// <summary>
    /// UpdateWebConfig
    /// </summary>
    /// <param name="objSiteConfiguration">set SiteConfiguration object</param>
    public static void UpdateWebConfig(SiteConfiguration objSiteConfiguration)
    {
        try
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(HttpContext.Current.Server.MapPath("~/Settings_App/Settings.xml"));
            doc.SelectSingleNode("//SiteName").InnerText = objSiteConfiguration.SiteName;
            doc.SelectSingleNode("//SiteMetaDescription").InnerText = objSiteConfiguration.MetaDescription;
            doc.SelectSingleNode("//SiteMetaKeywords").InnerText = objSiteConfiguration.MetaKeywords;
            doc.SelectSingleNode("//SiteOffline").InnerText = objSiteConfiguration.SiteOffline;
            doc.SelectSingleNode("//LogStatus").InnerText = objSiteConfiguration.LogStatus;
            doc.SelectSingleNode("//LogPath").InnerText = objSiteConfiguration.LogPath;
            doc.SelectSingleNode("//CacheStatus").InnerText = objSiteConfiguration.CacheStatus;
            doc.SelectSingleNode("//SessionLifetime").InnerText = objSiteConfiguration.SessionLifetime.ToString();
            doc.SelectSingleNode("//DatabaseType").InnerText = objSiteConfiguration.DatabaseType;
            doc.SelectSingleNode("//Host").InnerText = objSiteConfiguration.Host;
            doc.SelectSingleNode("//DatabaseUsername").InnerText = objSiteConfiguration.DatabaseUsername;
            doc.SelectSingleNode("//DatabasePassword").InnerText = objSiteConfiguration.DatabasePassword;
            doc.SelectSingleNode("//DatabaseName").InnerText = objSiteConfiguration.DatabaseName;
            doc.SelectSingleNode("//FromEmail").InnerText = objSiteConfiguration.FromEmail;
            doc.SelectSingleNode("//FromName").InnerText = objSiteConfiguration.FromName;
            doc.SelectSingleNode("//SMTPAuthentication").InnerText = objSiteConfiguration.SMTPAuthentication;
            doc.SelectSingleNode("//SMTPSecurity").InnerText = objSiteConfiguration.SMTPSecurity.ToString();
            doc.SelectSingleNode("//SMTPPort").InnerText = objSiteConfiguration.SMTPPort.ToString();
            doc.SelectSingleNode("//SMTPUsername").InnerText = objSiteConfiguration.SMTPUsername;
            doc.SelectSingleNode("//SMTPPassword").InnerText = objSiteConfiguration.SMTPPassword;
            doc.SelectSingleNode("//SMTPHost").InnerText = objSiteConfiguration.SMTPHost;
            doc.SelectSingleNode("//IsStreamLive").InnerText = objSiteConfiguration.IsLiveStreamEnable.ToString();
            doc.Save(HttpContext.Current.Server.MapPath("~/Settings_App/Settings.xml"));
        }
        catch (Exception ex)
        {
            _logger.Error("FormsFunction:::RetrieveWebConfig:::" + ex.Message);
            throw ex;
        }
    }

    /// <summary>
    /// This Methods Allow the Application to Send the Bugs Error to the Developer 
    /// </summary>
    /// <param name="sMailAccount">Set Email Address Developer Account "Set A String Value"</param>
    /// <param name="sPassword">Set Email Account Password Developer Account "Set A String Value"</param>
    /// <param name="sToUser">Set Email Address for How is recive Address Developer Account "Set A String Value"</param>
    /// <param name="sSubjectEmail">Set Email Subject "Set A String Value"</param>
    /// <param name="sMessageBody">Set Email Body Account "Set A String Value"</param>
    /// <returns>Retrun True if the Email Send Successfully otherwiaw return Flase</returns>
    public static bool SendMail(string sToUser, string sSubjectEmail, string sMessageBody)
    {
        try
        {
            SiteConfiguration objSiteConfiguration = RetrieveWebConfig();
            var loginInfo = new NetworkCredential(objSiteConfiguration.SMTPUsername, objSiteConfiguration.SMTPPassword);
            var msg = new MailMessage { From = new MailAddress(objSiteConfiguration.FromEmail, objSiteConfiguration.FromName) };
            msg.To.Add(new MailAddress(sToUser));
            msg.Subject = sSubjectEmail;
            msg.Body = sMessageBody;
            msg.IsBodyHtml = true;
            var client = new SmtpClient(objSiteConfiguration.SMTPHost, objSiteConfiguration.SMTPPort)
            {
                UseDefaultCredentials = false,
                EnableSsl = Convert.ToBoolean(objSiteConfiguration.SMTPSecurity),
                Credentials = loginInfo
            };
            client.Send(msg);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    /// <summary>
    /// Bind Drop Down list Without Adding Default Item
    /// </summary>
    /// <param name="ddl"> Ref Drop Down List</param>
    /// <param name="strSPName"> Store Procedure Name</param>
    /// <param name="strTextField">Text Field Name</param>
    /// <param name="strValueField">Value Field Name</param>
    public static void BindDDL(ref DropDownList ddl, DataSet objDataSet, string strTextField, string strValueField)
    {
        BindDDL(ref ddl, objDataSet, strTextField, strValueField, "");
    }

    /// <summary>
    /// Bind Drop Down list With Adding Default Item
    /// </summary>
    /// <param name="ddl">Ref Drop Down List</param>
    /// <param name="strSPName">Stored Procedure</param>
    /// <param name="strTextField">Text Field Name</param>
    /// <param name="strValueField">Value Field Name</param>
    /// <param name="strDefultItemText">Default Item Name, AND It Value Will be 0</param>
    public static void BindDDL(ref DropDownList ddl, DataSet objDataSet, string strTextField, string strValueField, string strDefultItemText)
    {
        try
        {

            DataSet ds = objDataSet;
            ddl.DataTextField = strTextField;
            ddl.DataValueField = strValueField;
            ddl.DataSource = ds;
            ddl.DataBind();
            if (strDefultItemText != string.Empty)
            {
                ListItem item = new ListItem();
                item.Text = strDefultItemText;
                item.Value = "-2";
                ddl.Items.Insert(0, item);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    /// <summary>
    /// Send Email Address For A User from our system
    /// </summary>
    /// <param name="sToEmailAddress">set Email Address to send the user "string value"</param>
    /// <param name="sEmailBody">set Email Body "string value"</param>
    /// <param name="sEmailSubject">set email Subject "string value"</param>
    /// <returns>return Success if send sucessfully otherwise return Execption</returns>
    public static int SendEmailService(string sToEmailAddress, string sEmailBody, string sEmailSubject)
    {
        try
        {
            MailMessage message = new MailMessage("info@arabisky.com", sToEmailAddress);
            SmtpClient smtpClient = new SmtpClient("smtpout.asia.secureserver.net", 80);
            smtpClient.EnableSsl = false;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential("info@arabisky.com", "osm_kho_q1w2e3r4");
            smtpClient.Timeout = 10000;

            message.From = new MailAddress("info@arabisky.com", "موقع سماء العرب");
            message.Subject = sEmailSubject;
            message.Body = sEmailBody;
            message.IsBodyHtml = true;
            message.BodyEncoding = System.Text.UTF8Encoding.UTF8;
            message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

            smtpClient.Send(message);
            return 1;
        }
        catch (Exception ex)
        {
            _logger.Error("FormsFunction:::SendEmailService:::" + ex.Message);
            return -1;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="nEmailTempleteID"></param>
    /// <returns></returns>
    public static SendEMail SendAndGetEmailTemplete(int nEmailTempleteID, string sEmailAddress, string sPassword)
    {
        try
        {
            string sEmailText = string.Empty;
            switch (nEmailTempleteID)
            {
                case 0:
                    //Send Email Activation First Time
                    using (StreamReader objStreamReader = new StreamReader(HttpContext.Current.Server.MapPath("~/UserEmail/FirstEmail.htm")))
                    {
                        sEmailText = objStreamReader.ReadToEnd();
                    }
                    sEmailText = sEmailText.Replace("#UserEmailAddress#", sEmailAddress);
                    sEmailText = sEmailText.Replace("#UserPassword#", sPassword);
                    SendEmailService(sEmailAddress, sEmailText, "موقع سماء العرب | تفعيل الحساب");
                    return SendEMail.Success;
                case 1:
                    //Send Email forget Password
                    using (StreamReader objStreamReader = new StreamReader(HttpContext.Current.Server.MapPath("~/UserEmail/ForGetPasswordAccount.htm")))
                    {
                        sEmailText = objStreamReader.ReadToEnd();
                    }
                    sEmailText = sEmailText.Replace("#UserEmailAddress#", sEmailAddress);
                    sEmailText = sEmailText.Replace("#UserPassword#", sPassword);
                    SendEmailService(sEmailAddress, sEmailText, "موقع سماء العرب | تفعيل الحساب");
                    return SendEMail.Success;
                default:
                    return SendEMail.Error;
            }
        }
        catch (Exception ex)
        {
            _logger.Error("FormsFunction:::SendEmailService:::" + ex.Message);
            return SendEMail.Execption;
        }
    }

    #region Path Cookie
    public static void SetCookieValue(string UserID, string UserFullName, string EmailAddress, string Password)
    {
        try
        {
            if (HttpContext.Current.Request.Cookies["ArabiSkyCookie"] != null)
            {
                HttpContext.Current.Request.Cookies["ArabiSkyCookie"].Expires = DateTime.Now.AddDays(-1);
            }
            HttpCookie cookie = new HttpCookie("ArabiSkyCookie");
            cookie.Expires = DateTime.Now.AddDays(60);
            cookie.Name = "ArabiSkyCookie";

            if (!string.IsNullOrEmpty(UserFullName))
            {
                cookie.Value = EncryptionMethods.Encryption.Encrypt(UserID + "|" + EmailAddress + "|" + Password + "|" + UserFullName);
            }
            else
            {
                cookie.Value = EncryptionMethods.Encryption.Encrypt(UserID + "|" + EmailAddress + "|" + Password);
            }

            HttpContext.Current.Response.Cookies.Add(cookie);
            HttpContext.Current.Request.Cookies["ArabiSkyCookie"].Expires = DateTime.Now.AddDays(60);
        }
        catch (Exception)
        {
            HttpContext.Current.Response.Cookies["ArabiSkyCookie"].Expires = DateTime.Now.AddDays(-1);
        }
    }
    public static string[] GetCookieData()
    {
        string[] arrCookieInfo = new string[] { };
        try
        {
            if (HttpContext.Current.Request.Cookies["ArabiSkyCookie"] != null && !string.IsNullOrEmpty(HttpContext.Current.Request.Cookies["ArabiSkyCookie"].Value))
                return EncryptionMethods.Encryption.Decrypt(HttpContext.Current.Request.Cookies["ArabiSkyCookie"].Value).Split('|');
            else
                return arrCookieInfo;
        }
        catch (Exception ex)
        {
            _logger.Error("FormsFunction:::SendEmailService:::" + ex.Message);
            return arrCookieInfo;
        }
    }
    public static int GetCookieValueCountryInfo()
    {
        try
        {
            if (HttpContext.Current.Request.Cookies["ArabiSkyCheckCountry"] != null)
                return Convert.ToInt16(HttpContext.Current.Request.Cookies["ArabiSkyCheckCountry"].Value);
            else
                return 12;
        }
        catch (Exception ex)
        {
            _logger.Error("FormsFunction:::GetCookieValueCountryInfo:::" + ex.Message);
            return 12;
        }
    }
    //public static string GetCountryName()
    //{
    //    try
    //    {
    //        ////string sCountryStr = objWebClient.DownloadString("http://api.hostip.info/country.php");
    //        //XmlDocument objXmlDocument = new XmlDocument();
    //        //objXmlDocument.LoadXml(objWebClient.DownloadString("http://api.hostip.info/get_html.php?ip=86.108.52.57"));
    //        //XmlNode node = objXmlDocument.DocumentElement.SelectSingleNode("/Response/CountryCode");
    //        string userHost = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
    //        if (String.IsNullOrEmpty(userHost) || String.Compare(userHost, "unknown", true) == 0)
    //        {
    //            WebClient objWebClient = new WebClient();
    //            string s = objWebClient.DownloadString("http://api.hostip.info/get_html.php?ip=" + HttpContext.Current.Request.UserHostAddress);
    //            if (s == "Unknown Country?")
    //            {
    //                return "SA";
    //            }
    //            else
    //            {
    //                return s.Split(new char[] { '(', ')' })[1];
    //            }
    //        }
    //        else
    //        {
    //            return "SA";
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        _logger.Error("FormsFunction:::GetCountryName:::" + ex.Message);
    //        return "SA";
    //    }
    //}
    //public static void SetCookieValueCountryInfo(int sCountryID, string sCountryName)
    //{
    //    try
    //    {
    //        if (HttpContext.Current.Request.Cookies["ArabiSkyCountry2013"] != null)
    //        {
    //            HttpContext.Current.Request.Cookies["ArabiSkyCountry2013"].Expires = DateTime.Now.AddDays(-1);
    //        }
    //        HttpCookie cookie = new HttpCookie("ArabiSkyCountry2013");
    //        cookie.Expires = DateTime.Now.AddDays(60);
    //        cookie.Name = "ArabiSkyCountry2013";

    //        if (sCountryID != 0)
    //        {
    //            cookie.Value = EncryptionMethods.Encryption.Encrypt(sCountryID + "|" + sCountryName);
    //        }
    //        else
    //        {
    //            cookie.Value = EncryptionMethods.Encryption.Encrypt(1 + "|الممكلة الأردنية الهاشمية");
    //        }

    //        HttpContext.Current.Response.Cookies.Add(cookie);
    //        HttpContext.Current.Request.Cookies["ArabiSkyCountry2013"].Expires = DateTime.Now.AddDays(60);
    //    }
    //    catch (Exception)
    //    {
    //        HttpContext.Current.Response.Cookies["ArabiSkyCountry2013"].Expires = DateTime.Now.AddDays(-1);
    //    }
    //}

    #endregion
}