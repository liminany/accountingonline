<%@ WebHandler Language="C#" Class="ForgetPasswordHandler" %>

using System;
using System.Web;

public class ForgetPasswordHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {

        try
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            System.Text.StringBuilder sbJsonResults = new System.Text.StringBuilder();
            if (!string.IsNullOrEmpty(context.Request.Params["email"].ToString()))
            {
                DAL.UserAuthentication objUserAuthentication = new DAL.UserAuthentication();
                Entity.EntityRegUsers objEntityRegUsers = new Entity.EntityRegUsers();
                objEntityRegUsers.UserEmailAddress = context.Request.Params["email"].ToString();
                objEntityRegUsers = objUserAuthentication.GetUserInfoByUserEmailAddress(objEntityRegUsers);
                if (objEntityRegUsers.UserEmailAddress == context.Request.Params["email"].ToString())
                {
                    Entity.SendEMail objSendEMail = FormsFunction.SendAndGetEmailTempleteByArabiSkyInfo(1, objEntityRegUsers.UserEmailAddress, EncryptionMethods.Encryption.Decrypt(objEntityRegUsers.UserPassword));
                    if (objSendEMail == Entity.SendEMail.Success)
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
                    context.Response.Write("false");
                }
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