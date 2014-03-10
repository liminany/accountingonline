<%@ WebHandler Language="C#" Class="GetDataHandler" %>

using System;
using System.Web;

public class GetDataHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            DAL.DBAdsManager obDBAdsManager = new DAL.DBAdsManager(); 
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            System.Text.StringBuilder sbJsonResults = new System.Text.StringBuilder();
            if (!string.IsNullOrEmpty(context.Request.Params["operationType"].ToString().ToLower()))
            {
                switch (context.Request.Params["operationType"].ToString().ToLower())
                {
                    case "country":
                        Entity.Country.EntiryCountry objEntiryCountry = new Entity.Country.EntiryCountry();
                        DAL.ManageCountry objManageCountry = new DAL.ManageCountry();
                        objEntiryCountry.Action = 6;
                        System.Data.DataTable dtCountry = objManageCountry.GetAllCountry(objEntiryCountry).Tables[0];
                        System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>> rowsCountry = new System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>();
                        System.Collections.Generic.Dictionary<string, object> rowCountry;
                        foreach (System.Data.DataRow dr in dtCountry.Rows)
                        {
                            rowCountry = new System.Collections.Generic.Dictionary<string, object>();
                            foreach (System.Data.DataColumn col in dtCountry.Columns)
                            {
                                rowCountry.Add(col.ColumnName, dr[col]);
                            }
                            rowsCountry.Add(rowCountry);
                        }
                        serializer.Serialize(rowsCountry, sbJsonResults);
                        context.Response.Write(sbJsonResults.ToString());
                        break;
                    case "city":
                        DAL.ManageCity objManageCity = new DAL.ManageCity();
                        Entity.City.EntiryCity objEntiryCity = new Entity.City.EntiryCity();
                        objEntiryCity.Action = 4;
                        System.Data.DataTable dtCity = objManageCity.GetAllCity(objEntiryCity).Tables[0];
                        System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>> rowsCity = new System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>();
                        System.Collections.Generic.Dictionary<string, object> rowCity;
                        foreach (System.Data.DataRow dr in dtCity.Rows)
                        {
                            rowCity = new System.Collections.Generic.Dictionary<string, object>();
                            foreach (System.Data.DataColumn col in dtCity.Columns)
                            {
                                rowCity.Add(col.ColumnName, dr[col]);
                            }
                            rowsCity.Add(rowCity);
                        }
                        serializer.Serialize(rowsCity, sbJsonResults);
                        context.Response.Write(sbJsonResults.ToString());
                        break;
                    case "getlatestads":
                        System.Data.DataTable dtGetTenLatestAds = obDBAdsManager.GetDashbaordAds(int.Parse(context.Request.Params["countryCode"].ToString().ToLower())).Tables[0];
                        System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>> rowsGetLatestTenAds = new System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>();
                        System.Collections.Generic.Dictionary<string, object> rowGetLatestTenAds;
                        foreach (System.Data.DataRow dr in dtGetTenLatestAds.Rows)
                        {
                            rowGetLatestTenAds = new System.Collections.Generic.Dictionary<string, object>();
                            foreach (System.Data.DataColumn col in dtGetTenLatestAds.Columns)
                            {
                                rowGetLatestTenAds.Add(col.ColumnName, dr[col]);
                            }
                            rowsGetLatestTenAds.Add(rowGetLatestTenAds);
                        }
                        serializer.Serialize(rowsGetLatestTenAds, sbJsonResults);
                        context.Response.Write(sbJsonResults.ToString());
                        break;
                    case "getmyads":
                        System.Data.DataTable dtGetAllMyAdsByUserID = obDBAdsManager.GetAllMyAdsByUserID(int.Parse(context.Request.Params["userid"].ToString().ToLower())).Tables[0];
                        System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>> rowsGetAllMyAdsByUserID = new System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>();
                        System.Collections.Generic.Dictionary<string, object> rowGetAllMyAdsByUserID;
                        foreach (System.Data.DataRow dr in dtGetAllMyAdsByUserID.Rows)
                        {
                            rowGetAllMyAdsByUserID = new System.Collections.Generic.Dictionary<string, object>();
                            foreach (System.Data.DataColumn col in dtGetAllMyAdsByUserID.Columns)
                            {
                                rowGetAllMyAdsByUserID.Add(col.ColumnName, dr[col]);
                            }
                            rowsGetAllMyAdsByUserID.Add(rowGetAllMyAdsByUserID);
                        }
                        serializer.Serialize(rowsGetAllMyAdsByUserID, sbJsonResults);
                        context.Response.Write(sbJsonResults.ToString());
                        break;
                    case "getmymessages":
                        DAL.DBUserMessages objDBUserMessages = new DAL.DBUserMessages();
                        System.Data.DataTable dtGetAllUserEmailByUserID = objDBUserMessages.GetAllUserEmailByUserID(Convert.ToInt32(context.Request.Params["userid"].ToString().ToLower())).Tables[0];
                        System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>> rowsGetAllUserEmailByUserID = new System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>();
                        System.Collections.Generic.Dictionary<string, object> rowGetAllUserEmailByUserID;
                        foreach (System.Data.DataRow dr in dtGetAllUserEmailByUserID.Rows)
                        {
                            rowGetAllUserEmailByUserID = new System.Collections.Generic.Dictionary<string, object>();
                            foreach (System.Data.DataColumn col in dtGetAllUserEmailByUserID.Columns)
                            {
                                rowGetAllUserEmailByUserID.Add(col.ColumnName, dr[col]);
                            }
                            rowsGetAllUserEmailByUserID.Add(rowGetAllUserEmailByUserID);
                        }
                        serializer.Serialize(rowsGetAllUserEmailByUserID, sbJsonResults);
                        context.Response.Write(sbJsonResults.ToString());
                        break;
                    case "getadsbycatid":
                        System.Data.DataTable dtGetAdsMainCategoiresByCatID = obDBAdsManager.GetAdsMainCategoiresByCatID(Convert.ToInt32(context.Request.Params["catID"].ToString().ToLower()), Convert.ToInt32(context.Request.Params["countryCode"].ToString().ToLower())).Tables[0];
                        System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>> rowsGetCatByID = new System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>();
                        System.Collections.Generic.Dictionary<string, object> rowGetCatByID;
                        foreach (System.Data.DataRow dr in dtGetAdsMainCategoiresByCatID.Rows)
                        {
                            rowGetCatByID = new System.Collections.Generic.Dictionary<string, object>();
                            foreach (System.Data.DataColumn col in dtGetAdsMainCategoiresByCatID.Columns)
                            {
                                rowGetCatByID.Add(col.ColumnName, dr[col]);
                            }
                            rowsGetCatByID.Add(rowGetCatByID);
                        }
                        serializer.Serialize(rowsGetCatByID, sbJsonResults);
                        context.Response.Write(sbJsonResults.ToString());
                        break; 
                    default:
                        context.Response.Write("Error");
                        break;
                }
            }
            else
            {
                context.Response.Write("false");
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
 