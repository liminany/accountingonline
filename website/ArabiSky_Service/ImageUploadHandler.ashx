<%@ WebHandler Language="C#" Class="ImageUploadHandler" %>

using System;
using System.Web;

public class ImageUploadHandler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
            string path = context.Server.MapPath("~/uploadedimages/");
            if (!System.IO.Directory.Exists(path))
                System.IO.Directory.CreateDirectory(path);

            var file = context.Request.Files[0];

            string fileName;

            if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE")
            {
                string[] files = file.FileName.Split(new char[] { '\\' });
                fileName = files[files.Length - 1];
            }
            else
            {
                fileName = file.FileName;
            }
            string strFileName = fileName;
            fileName = System.IO.Path.Combine(path, fileName);
            file.SaveAs(fileName);

            string msg = "{";
            msg += string.Format("error:'{0}',\n", string.Empty);
            msg += string.Format("msg:'{0}'\n", "images/Temp/" + strFileName);
            msg += "}";
            context.Response.Write(msg);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}