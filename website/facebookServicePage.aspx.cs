using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;
using System.Text;
using DAL;
using Entity;
using NLog;
using ASPSnippets.FaceBookAPI;

public partial class facebookServicePage : System.Web.UI.Page
{
    #region Varabile
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    private int _nUserAdsQuta = 10;
    private int _nUserStatus = 1; //if user status 1 then the user activate otherwise user pendding
    private int _nUserType = 0;//if user Type 0 then (user permission is default user otherwise Super User)
    public const string FaceBookAppKey = "efdf1c48bd7278e3d738dbe71619a8d2";//TODO: paste your facebook-app key here!!


    #endregion




    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] != null)
        {
            if (string.IsNullOrEmpty(Request.QueryString["access_token"])) return; //ERROR! No token returned from Facebook!!          
            string json = GetFacebookUserJSON(Request.QueryString["access_token"]);
            JavaScriptSerializer js = new JavaScriptSerializer();
            FacebookUser oUser = js.Deserialize<FacebookUser>(json);

            if (oUser != null)
            {
                //Response.Write("Welcome, " + oUser.name);
                //Response.Write("<br />id, " + oUser.id);
                //Response.Write("<br />email, " + oUser.email);
                //Response.Write("<br />first_name, " + oUser.first_name);
                //Response.Write("<br />last_name, " + oUser.last_name);
                //Response.Write("<br />gender, " + oUser.gender);
                //Response.Write("<br />link, " + oUser.link);
                //Response.Write("<br />updated_time, " + oUser.updated_time);
                //Response.Write("<br />birthday, " + oUser.birthday);
                //Response.Write("<br />locale, " + oUser.locale);
                //Response.Write("<br />picture, " + oUser.picture);
                //if (oUser.location != null)
                //{
                //    Response.Write("<br />locationid, " + oUser.location.id);
                //    Response.Write("<br />location_name, " + oUser.location.name);
                //}

                EntityRegUsers objEntityRegUsers = new EntityRegUsers();
                UserAuthentication objUserAuthentication = new UserAuthentication();

                switch (Request.QueryString["action"].ToString())
                {
                    case "newUser":
                        objEntityRegUsers.UserCountAds = _nUserAdsQuta;
                        objEntityRegUsers.UserType = _nUserType;
                        objEntityRegUsers.UserStatus = _nUserStatus;
                        objEntityRegUsers.UserEmailAddress = oUser.email;
                        objEntityRegUsers.UserFullName = oUser.name;
                        objEntityRegUsers.UserFacebookID = oUser.id.ToString();
                        objEntityRegUsers.UserMobileNumber = string.Empty;
                        objEntityRegUsers.UserPassword = "facebookPassword";
                        objEntityRegUsers.UserCountry = FormsFunction.GetCookieValueCountryInfo();
                        objEntityRegUsers = objUserAuthentication.RegisterNewUserFromClient(objEntityRegUsers);
                        if (objEntityRegUsers.UserID <= 0)
                        {
                            //The User Already Exists
                            Response.Redirect("~/signup?EID=1001");
                        }
                        else
                        {
                            PostInFacebook();
                            Session["UserInfo"] = objEntityRegUsers;
                            Response.Redirect("/", false);
                        }
                        break;
                    case "login":
                        PostInFacebook();
                        objEntityRegUsers.UserEmailAddress = oUser.email;
                        objEntityRegUsers.UserPassword = "facebookPassword";
                        objEntityRegUsers = objUserAuthentication.ClientLoginUser(objEntityRegUsers);
                        if (objEntityRegUsers.UserID == 0)
                        {
                            Response.Redirect("~/login?EID=1002");
                        }
                        else
                        {
                            if (objEntityRegUsers.UserStatus == 0)
                            {
                                Response.Redirect("~/login?EID=1003");
                            }
                            else
                            {
                                Session["UserInfo"] = objEntityRegUsers;
                                Response.Redirect("/", false);
                            }
                        }
                        break;
                    default:
                        break;
                }
            }
        }
    }


    private void PostInFacebook()
    {
        try
        {
            FaceBookConnect.API_Key = "172727259569815";
            FaceBookConnect.API_Secret = "efdf1c48bd7278e3d738dbe71619a8d2";
            string code = Request.QueryString["action"];
            if (!string.IsNullOrEmpty(code))
            {
                Dictionary<string, string> data1 = new Dictionary<string, string>();
                data1.Add("link", "http://www.arabisky.com/");
                data1.Add("picture", "http://www.arabisky.com/images/ArabiSkyLogo.png");
                data1.Add("caption", "Arabisky.com");
                data1.Add("name", "Arabisky.com - سوق سماء العرب");
                data1.Add("message", "سوق سماء العرب هو الطريق الأسهل لنشر اعلانات مبوبة مجانية لبيع او شراء العقارات و الإسكان او السيارات او المركبات او الكهربائيات و الإلكترونيات او الأثاث و المفروشات او أرقام هواتف مميزة و كذلك لنشر اعلانات في مجال الخدمات اوللاعلان عن وظائف شاغرة او لايجاد فرصة عمل في قسم الباحثين عن عمل");
                FaceBookConnect.Post(code, "me/feed", data1);
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
    /// <summary>
    /// sends http-request to Facebook and returns the response string
    /// </summary>
    private static string GetFacebookUserJSON(string access_token)
    {
        string url = string.Format("https://graph.facebook.com/me?access_token={0}&fields=email,name,first_name,last_name,link", access_token);

        WebClient wc = new WebClient();
        Stream data = wc.OpenRead(url);
        StreamReader reader = new StreamReader(data);
        string s = reader.ReadToEnd();
        data.Close();
        reader.Close();
        return s;
    }
}