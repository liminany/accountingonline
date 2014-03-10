<%@ WebHandler Language="C#" Class="InsertNewAdsHandler" %>

using System;
using System.Web;

public class InsertNewAdsHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            int nExpireDateCounte = 8;
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            System.Text.StringBuilder sbJsonResults = new System.Text.StringBuilder();
            Entity.EntityRegUsers objEntityRegUsers = new Entity.EntityRegUsers();
            DAL.UserAuthentication objUserAuthentication = new DAL.UserAuthentication();

            if (!string.IsNullOrEmpty(context.Request.Params["userID"].ToString()))
            {
                switch (context.Request.Params["operationType"].ToString().ToLower())
                {
                    case "addnewads":
                        objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(context.Request.Params["userID"].ToString()));
                        if (objEntityRegUsers.CountAdsUsed >= objEntityRegUsers.UserCountAds)
                        {
                            serializer.Serialize("error", sbJsonResults);
                        }
                        else
                        {
                            DAL.DBAdsManager objDBAdsManager = new DAL.DBAdsManager();
                            Entity.AdsManager objAdsManager = new Entity.AdsManager();
                            objAdsManager.UserID = Convert.ToInt32(context.Request.Params["userID"].ToString());
                            objAdsManager.CatID = Convert.ToInt32(context.Request.Params["catID"].ToString());
                            objAdsManager.SubCatID = Convert.ToInt32(context.Request.Params["subCatID"].ToString());
                            objAdsManager.CountryID = Convert.ToInt32(context.Request.Params["countryID"].ToString());
                            objAdsManager.CityID = Convert.ToInt32(context.Request.Params["cityID"].ToString());
                            objAdsManager.AdsPrice = (!string.IsNullOrEmpty(context.Request.Params["price"].ToString())) ? Convert.ToDouble(context.Request.Params["price"].ToString()) : 0;
                            string sTextTitleAds = context.Request.Params["adsTitle"].ToString().Replace("ة", "ه");
                            sTextTitleAds = sTextTitleAds.Replace("أ", "ا");
                            sTextTitleAds = sTextTitleAds.Replace("إ", "ا");
                            sTextTitleAds = sTextTitleAds.Replace("إ", "ا");
                            objAdsManager.AdsTitle = sTextTitleAds.ToLower();
                            objAdsManager.AdsDescription = context.Request.Params["adsDescription"].ToString();
                            objAdsManager.AdsUpdateCreateDate = DateTime.Now.AddDays(nExpireDateCounte);


                            //if (file_upload.HasFile)
                            //{
                            //    objAdsManager.AdsImages = UploadAdsImages();
                            //}
                            //else
                            //{
                            //    objAdsManager.AdsImages = string.Empty;
                            //}

                            objAdsManager.AdsYouTubeURL = string.Empty;
                            int nReturnValue = objDBAdsManager.InsertNewAds(objAdsManager);
                            SearchEngineOptimization objSearchEngineOptimization = new SearchEngineOptimization();
                            objSearchEngineOptimization.SiteMapGenerater(string.Format("http://www.arabisky.com/ViewAds?AdsID={0}", nReturnValue), DateTime.Now.ToString(), "daily", "0.69");
                        }
                        break;
                    case "editads":
                        break; 
                    default:
                        break;
                }
            }
            else
            {
                serializer.Serialize("error", sbJsonResults);
            }
        }
        catch (Exception)
        {
            context.Response.Write("false");
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}