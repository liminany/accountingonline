using System;
using System.Xml;
using System.IO;
namespace SiteMapGeneraterCore
{
    public class SiteMapFeedGenerator
    {
        public int CreateXML()
        {
            try
            {
                string _sMainXMLFile = "<?xml version='1.0' encoding='utf-8' ?>" +
                        "<ClinicKit>" +
                              "<ProductName></ProductName>" +
                              "<IsActivate>false</IsActivate>" +
                        "</ClinicKit>";

                File.Create("AppSettings.xml.Enc").Close();
                using (StreamWriter objStreamWriter = new StreamWriter("AppSettings.xml.Enc"))
                {
                    objStreamWriter.Write(_sMainXMLFile);
                    objStreamWriter.Flush();
                }
                return 0;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}