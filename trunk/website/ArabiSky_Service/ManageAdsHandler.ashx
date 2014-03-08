<%@ WebHandler Language="C#" Class="ManageAdsHandler" %>

using System;
using System.Web;

public class ManageAdsHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            int nRequiredUpdateAdsPeroid = 8;
            DAL.DBAdsManager objDBAdsManager = new DAL.DBAdsManager();

            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            System.Text.StringBuilder sbJsonResults = new System.Text.StringBuilder();
            Entity.EntityRegUsers objEntityRegUsers = new Entity.EntityRegUsers();
            DAL.UserAuthentication objUserAuthentication = new DAL.UserAuthentication();
            int nReturnValue = 0;
            switch (context.Request.Params["operationType"].ToString().ToLower())
            {
                case "deleteads":
                    nReturnValue = objDBAdsManager.DeleteAdsAndRejected(Convert.ToInt32(context.Request.Params["adsID"].ToString()));
                    if (nReturnValue == 1)
                    {
                        context.Response.Write("true");
                    }
                    else
                    {
                        context.Response.Write("false");
                    }
                    break;
                case "reactiveate":
                    DateTime newUpdateDateTime = DateTime.Now.AddDays(nRequiredUpdateAdsPeroid);
                    nReturnValue = objDBAdsManager.ReActivateAds(Convert.ToInt32(context.Request.Params["adsID"].ToString()), Convert.ToInt32(context.Request.Params["adsID"].ToString()), newUpdateDateTime);
                    if (nReturnValue == 1)
                    {
                        context.Response.Write("true");
                    }
                    else
                    {
                        context.Response.Write("false");
                    }
                    break;
                case "editads":
                        
                    break;
                default:
                    break;
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