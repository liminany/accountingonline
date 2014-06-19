using System;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using ASPSnippets.FaceBookAPI;
using System.Collections.Generic;
using System.Web.Script.Serialization;
public partial class CS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FaceBookConnect.API_Key = "172727259569815";
        FaceBookConnect.API_Secret = "efdf1c48bd7278e3d738dbe71619a8d2";
        if (!IsPostBack)
        {
            string code = Request.QueryString["code"];
            if (!string.IsNullOrEmpty(code))
            {
                string data = FaceBookConnect.Fetch(code, "me/friends");
                FaceBookData facebookData = new JavaScriptSerializer().Deserialize<FaceBookData>(data);
                foreach (FaceBookUser user in facebookData.Data)
                {
                    user.PictureUrl = string.Format("https://graph.facebook.com/{0}/picture", user.Id);
                }
                gvFriends.DataSource = facebookData.Data;
                gvFriends.DataBind();

                PostMessage();
            }
        }
    }

    private void PostMessage()
    {
        Dictionary<string, string> data1 = new Dictionary<string, string>();
        data1.Add("link", "http://www.arabisky.com/");
        data1.Add("picture", "http://www.arabisky.com/images/ArabiSkyLogo.png");
        data1.Add("caption", "Arabisky.com");
        data1.Add("name", "Arabisky.com - سوق سماء العرب");
        data1.Add("message", "سوق سماء العرب هو الطريق الأسهل لنشر اعلانات مبوبة مجانية لبيع او شراء العقارات و الإسكان او السيارات او المركبات او الكهربائيات و الإلكترونيات او الأثاث و المفروشات او أرقام هواتف مميزة و كذلك لنشر اعلانات في مجال الخدمات اوللاعلان عن وظائف شاغرة او لايجاد فرصة عمل في قسم الباحثين عن عمل");
        FaceBookConnect.Post(ViewState["Code"].ToString(), "me/feed", data1);
    }
    protected void btnFetch_Click(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("user_photos,friends_photos,email", Request.Url.AbsoluteUri);
 
    }

}

public class FaceBookData
{
    public List<FaceBookUser> Data { get; set; }
}

public class FaceBookUser
{
    public string Id { get; set; }
    public string Name { get; set; }
    public string PictureUrl { get; set; }
    public string Email { get; set; }
}