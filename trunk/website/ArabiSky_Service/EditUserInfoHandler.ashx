<%@ WebHandler Language="C#" Class="EditUserInfoHandler" %>

using System;
using System.Web;

public class EditUserInfoHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            System.Text.StringBuilder sbJsonResults = new System.Text.StringBuilder();
            Entity.EntityRegUsers objEntityRegUsers = new Entity.EntityRegUsers();
            DAL.UserAuthentication objUserAuthentication = new DAL.UserAuthentication();
            int nReturnValue = 0;
            switch (context.Request.Params["operationType"].ToString().ToLower())
            {
                case "changeuserinfo":
                    objEntityRegUsers = objUserAuthentication.GetUserInfoByUserID(Convert.ToInt32(context.Request.Params["userID"].ToString()));
                    objEntityRegUsers.UserFullName = context.Request.Params["userFullName"].ToString();
                    objEntityRegUsers.UserEmailAddress = context.Request.Params["userEmailAddress"].ToString();
                    objEntityRegUsers.UserMobileNumber = context.Request.Params["userMobileNumber"].ToString();
                    objEntityRegUsers.UserImage = context.Request.Params["userImageProfile"].ToString();
                    nReturnValue = objUserAuthentication.EditUserInfo(objEntityRegUsers);
                    if (nReturnValue == 1)
                    {
                        context.Response.Write("true");
                    }
                    else
                    {
                        context.Response.Write("false");
                    }
                    serializer.Serialize(objEntityRegUsers, sbJsonResults);
                    break;
                case "changepassword":
                    objEntityRegUsers.UserID = Convert.ToInt32(context.Request.Params["userID"].ToString());
                    objEntityRegUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(context.Request.Params["userPassword"].ToString());
                    nReturnValue = objUserAuthentication.EditUserPasswordFormClient(objEntityRegUsers);
                    if (nReturnValue == 1)
                    {
                        context.Response.Write("true");
                    }
                    else
                    {
                        context.Response.Write("false");
                    }
                    break;
                case "favorite":
                    objEntityRegUsers.UserID = Convert.ToInt32(context.Request.Params["userID"].ToString());
                    objEntityRegUsers.IntrestedCat = Convert.ToInt32(context.Request.Params["CatID"].ToString());
                    objEntityRegUsers.IntrestedSubCat = Convert.ToInt32(context.Request.Params["subCatID"].ToString());
                    if (Boolean.Parse(context.Request.Params["spMessageReceived"].ToString()))
                    {
                        objEntityRegUsers.SyncEmail = 1;
                    }
                    else
                    {
                        objEntityRegUsers.SyncEmail = 0;
                    }
                    nReturnValue = objUserAuthentication.EditUserSoftwareManager(objEntityRegUsers);
                    if (nReturnValue == 1)
                    {
                        context.Response.Write("true");
                    }
                    else
                    {
                        context.Response.Write("false");
                    } 
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