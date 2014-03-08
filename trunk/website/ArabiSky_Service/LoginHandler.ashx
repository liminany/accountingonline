<%@ WebHandler Language="C#" Class="GetDataHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Runtime.Serialization.Json;
using DAL;
using Entity;
public class GetDataHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        try
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            System.Text.StringBuilder sbJsonResults = new System.Text.StringBuilder();
            if (!string.IsNullOrEmpty(context.Request.Params["UserName"].ToString()) && !string.IsNullOrEmpty(context.Request.Params["Password"].ToString()))
            {
                EntityRegUsers objEntityRegUsers = new EntityRegUsers();
                UserAuthentication objUserAuthentication = new UserAuthentication();
                objEntityRegUsers.UserEmailAddress = context.Request.Params["UserName"].ToString();
                objEntityRegUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(context.Request.Params["Password"].ToString());
                objEntityRegUsers = objUserAuthentication.ClientLoginUser(objEntityRegUsers);
                context.Response.ContentEncoding = System.Text.Encoding.UTF8;


                serializer.Serialize(objEntityRegUsers, sbJsonResults);
                context.Response.Clear();
                context.Response.ContentType = "application/json; charset=utf-8";
                if (objEntityRegUsers.UserID == 0)
                {
                    context.Response.Write(sbJsonResults.ToString());
                }
                else
                {
                    context.Response.Write(sbJsonResults.ToString());
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