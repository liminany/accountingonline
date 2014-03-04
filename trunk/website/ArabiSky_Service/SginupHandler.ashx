<%@ WebHandler Language="C#" Class="SginupHandler" %>

using System;
using System.Web;

public class SginupHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            System.Text.StringBuilder sbJsonResults = new System.Text.StringBuilder();
            if (!string.IsNullOrEmpty(context.Request.Params["UserName"].ToString()) && !string.IsNullOrEmpty(context.Request.Params["Password"].ToString()))
            {
                Entity.EntityRegUsers objEntityRegUsers = new Entity.EntityRegUsers();
                DAL.UserAuthentication objUserAuthentication = new DAL.UserAuthentication();
                objEntityRegUsers.CountAdsUsed = 0;
                objEntityRegUsers.IntrestedCat = 0;
                objEntityRegUsers.IntrestedSubCat = 0;
                objEntityRegUsers.SyncEmail = 1;
                objEntityRegUsers.UserCityAddress = 0;
                objEntityRegUsers.UserCountAds = 10;
                objEntityRegUsers.UserCountry = int.Parse(context.Request.Params["CountryCode"].ToString());
                objEntityRegUsers.UserEmailAddress = context.Request.Params["UserName"].ToString();
                objEntityRegUsers.UserFacebookID = "0";
                objEntityRegUsers.UserFullName = context.Request.Params["UserFullName"].ToString(); ;
                objEntityRegUsers.UserID = 0;
                objEntityRegUsers.UserImage = "";
                objEntityRegUsers.UserMobileNumber = "";
                objEntityRegUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(context.Request.Params["Password"].ToString());
                objEntityRegUsers.UserStatus = 1;
                objEntityRegUsers.UserType = 0;


                objEntityRegUsers = objUserAuthentication.RegisterNewUserFromClient(objEntityRegUsers);

                context.Response.ContentEncoding = System.Text.Encoding.UTF8;
                serializer.Serialize(objEntityRegUsers, sbJsonResults);
                context.Response.Clear();
                context.Response.ContentType = "application/json; charset=utf-8";
                if (objEntityRegUsers.UserID > 0)
                {
                    context.Response.Write("true");
                }
                else
                {
                    context.Response.Write("false");
                }
            }
            else
            {
                serializer.Serialize("Please Enter Username and password", sbJsonResults);
                context.Response.Clear();
                context.Response.ContentType = "application/json; charset=utf-8";
            }

        }
        catch (Exception)
        {

            throw;
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