using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class SiteConfiguration
    {
        /*Site*/
        private string _sSiteName = string.Empty;
        private string _sMetaDescription = string.Empty;
        private string _sMetaKeywords = string.Empty;
        private string _sSiteOffline = string.Empty;
        /*System*/
        private string _sLogStatus = string.Empty;
        private string _sLogPath = string.Empty;
        private string _sCacheStatus = string.Empty;
        private int _sSessionLifetime = 0;
        /*System*/
        /*Database Settings*/
        private string _sDatabaseType = string.Empty;
        private string _sHost = string.Empty;
        private string _sDatabaseUsername = string.Empty;
        private string _sDatabasePassword = string.Empty;
        private string _sDatabaseName = string.Empty;
        /*System*/
        /*Email Settings*/
        private string _sFromEmail = string.Empty;
        private string _sFromName = string.Empty;
        private string _sSMTPAuthentication = string.Empty;
        private int _sSMTPSecurity = 0;
        private int _sSMTPPort = 0;
        private string _sSMTPUsername = string.Empty;
        private string _sSMTPPassword = string.Empty;
        private string _sSMTPHost = string.Empty;

        private string _sBuiltInUserName = string.Empty;
        private string _sBuiltInPassword = string.Empty;


        private int _nIsLiveStreamEnable = 0;
 


        public string SiteName
        {
            get { return _sSiteName; }
            set { _sSiteName = value; }
        }
        public string MetaDescription
        {
            get { return _sMetaDescription; }
            set { _sMetaDescription = value; }
        }
        public string MetaKeywords
        {
            get { return _sMetaKeywords; }
            set { _sMetaKeywords = value; }
        }
        public string SiteOffline
        {
            get { return _sSiteOffline; }
            set { _sSiteOffline = value; }
        }


        public string LogStatus
        {
            get { return _sLogStatus; }
            set { _sLogStatus = value; }
        }
        public string LogPath
        {
            get { return _sLogPath; }
            set { _sLogPath = value; }
        }
        public string CacheStatus
        {
            get { return _sCacheStatus; }
            set { _sCacheStatus = value; }
        }
        public int SessionLifetime
        {
            get { return _sSessionLifetime; }
            set { _sSessionLifetime = value; }
        }


        public string DatabaseType
        {
            get { return _sDatabaseType; }
            set { _sDatabaseType = value; }
        }
        public string Host
        {
            get { return _sHost; }
            set { _sHost = value; }
        }
        public string DatabaseUsername
        {
            get { return _sDatabaseUsername; }
            set { _sDatabaseUsername = value; }
        }
        public string DatabasePassword
        {
            get { return _sDatabasePassword; }
            set { _sDatabasePassword = value; }
        }
        public string DatabaseName
        {
            get { return _sDatabaseName; }
            set { _sDatabaseName = value; }
        }


        public string FromEmail
        {
            get { return _sFromEmail; }
            set { _sFromEmail = value; }
        }
        public string FromName
        {
            get { return _sFromName; }
            set { _sFromName = value; }
        }
        public string SMTPAuthentication
        {
            get { return _sSMTPAuthentication; }
            set { _sSMTPAuthentication = value; }
        }
        public int SMTPSecurity
        {
            get { return _sSMTPSecurity; }
            set { _sSMTPSecurity = value; }
        }
        public int SMTPPort
        {
            get { return _sSMTPPort; }
            set { _sSMTPPort = value; }
        }
        public string SMTPUsername
        {
            get { return _sSMTPUsername; }
            set { _sSMTPUsername = value; }
        }
        public string SMTPPassword
        {
            get { return _sSMTPPassword; }
            set { _sSMTPPassword = value; }
        }
        public string SMTPHost
        {
            get { return _sSMTPHost; }
            set { _sSMTPHost = value; }
        }



        public string BuiltInUserName
        {
            get { return _sBuiltInUserName; }
            set { _sBuiltInUserName = value; }
        }
        public string BuiltInPassword
        {
            get { return _sBuiltInPassword; }
            set { _sBuiltInPassword = value; }
        }


        public int IsLiveStreamEnable
        {
            get { return _nIsLiveStreamEnable; }
            set { _nIsLiveStreamEnable = value; }
        }
 
    }
}
