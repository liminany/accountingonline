using System;
using System.Web.Services;
using DAL;
using Entity;
using NLog;
using System.Data;

/// <summary>
/// Summary description for ArabiSkyService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
//[System.Web.Script.Services.ScriptService]
public class ArabiSkyService : System.Web.Services.WebService
{
    #region Variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion


    public ArabiSkyService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string InsertNewAds(string sSecretID, int sUserID, int sCatID, int sSubCatID, int sCountryID, int sCityID, string sAdsTitle, string sAdsBody)
    {
        try
        {
            if (sSecretID == "962785946301")
            {
                DBAdsManager objDBAdsManager = new DBAdsManager();
                AdsManager objAdsManager = new AdsManager();
                int nExpireDateCounte = 8;

                objAdsManager.UserID = sUserID;
                objAdsManager.CatID = sCatID;
                objAdsManager.SubCatID = sSubCatID;
                objAdsManager.CountryID = sCountryID;
                objAdsManager.CityID = sCityID;
                objAdsManager.AdsPrice = 0;
                string sTextTitleAds = sAdsTitle.Replace("ة", "ه");
                sTextTitleAds = sTextTitleAds.Replace("أ", "ا");
                sTextTitleAds = sTextTitleAds.Replace("إ", "ا");
                sTextTitleAds = sTextTitleAds.Replace("إ", "ا");
                objAdsManager.AdsTitle = sTextTitleAds.ToLower();
                objAdsManager.AdsDescription = sAdsBody;
                objAdsManager.AdsUpdateCreateDate = DateTime.Now.AddDays(nExpireDateCounte);
                objAdsManager.AdsImages = string.Empty;
                objAdsManager.AdsYouTubeURL = string.Empty;


                int nReturnValue = objDBAdsManager.InsertNewAds(objAdsManager);
                SearchEngineOptimization objSearchEngineOptimization = new SearchEngineOptimization();
                objSearchEngineOptimization.SiteMapGenerater(string.Format("http://www.arabisky.com/ViewAds?AdsID={0}", nReturnValue), DateTime.Now.ToString(), "daily", "0.69");
                return "true";
            }
            else
            {
                return "Invalid Authentication";
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ArabiSkyService:::InsertNewAds:::" + ex.Message);
            return "false";
            throw;
        }
    }



    #region ArabiSky_Software


    [WebMethod]
    public EntityRegUsers UserLoginApplication(string sSecretID, string sEmailAddress, string sPassword)
    {
        try
        {
            if (sSecretID == "962785946301")
            {
                EntityRegUsers objEntityRegUsers = new EntityRegUsers();
                UserAuthentication objUserAuthentication = new UserAuthentication();
                objEntityRegUsers.UserEmailAddress = sEmailAddress;
                if (sPassword == "facebookPassword")
                {
                    objEntityRegUsers.UserPassword = "facebookPassword";
                }
                else
                {
                    objEntityRegUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(sPassword);
                }
                objEntityRegUsers = objUserAuthentication.ClientLoginUser(objEntityRegUsers);
                if (objEntityRegUsers.UserID == 0)
                {
                    //invalid Username or password
                    return null;
                }
                else
                {
                    if (objEntityRegUsers.UserStatus == 0)
                    {
                        //the account is supended
                        return null;
                    }
                    else
                    {
                        //the user is founded and true
                        return objEntityRegUsers;
                    }
                }
            }
            else
            {
                return null;
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ArabiSkyService:::UserLoginApplication:::" + ex.Message);
            return null;
        }
    }

    [WebMethod]
    public EntityRegUsers CreateNewUser(string sSecretID, string sEmailAddress, string sUserFullName, int sCountryCode, string sPassword)
    {
        try
        {
            int _nUserAdsQuta = 10;
            int _nUserStatus = 1; //if user status 1 then the user activate otherwise user pendding
            int _nUserType = 0;//if user Type 0 then (user permission is default user otherwise Super User)

            if (sSecretID == "962785946301")
            {
                EntityRegUsers objEntityRegUsers = new EntityRegUsers();
                UserAuthentication objUserAuthentication = new UserAuthentication();

                objEntityRegUsers.UserCountAds = _nUserAdsQuta;
                objEntityRegUsers.UserType = _nUserType;
                objEntityRegUsers.UserStatus = _nUserStatus;
                objEntityRegUsers.UserEmailAddress = sEmailAddress;
                objEntityRegUsers.UserFullName = sUserFullName;
                objEntityRegUsers.UserFacebookID = string.Empty;
                objEntityRegUsers.UserMobileNumber = string.Empty;
                objEntityRegUsers.UserPassword = EncryptionMethods.Encryption.Encrypt(sPassword);
                objEntityRegUsers.UserCountry = sCountryCode;
                objEntityRegUsers = objUserAuthentication.RegisterNewUserFromClient(objEntityRegUsers);
                if (objEntityRegUsers.UserID < 0)
                {
                    //error in system 
                    return null;
                }
                else
                {
                    if (objEntityRegUsers.UserID >= 1)
                    {
                        return objEntityRegUsers;
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            else
            {
                return null;
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ArabiSkyService:::CreateNewUser:::" + ex.Message);
            return null;
        }
    }

    [WebMethod]
    public DataTable GetUserAdsIntrestedList(string sSecretID, string sUserCountry, string sCatID, string sSubCatID)
    {
        try
        {
            if (sSecretID == "962785946301")
            {
                EntityRegUsers objEntityRegUsers = new EntityRegUsers();
                ManageCategory objManageCategory = new ManageCategory();
                objEntityRegUsers.UserCountry = int.Parse(sUserCountry);
                objEntityRegUsers.IntrestedCat = int.Parse(sCatID);
                objEntityRegUsers.IntrestedSubCat = int.Parse(sSubCatID);
                return objManageCategory.GetUserIntrestedCatg_Software(objEntityRegUsers).Tables[0];
            }
            else
            {
                return null;
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ArabiSkyService:::GetUserAdsIntrestedList:::" + ex.Message);
            return null;
        }
    }

    [WebMethod]
    public int CheckIfUserHaveEmail(string sSecretID, string sUserID)
    {
        try
        {
            if (sSecretID == "962785946301")
            {
                DBUserMessages objDBUserMessages = new DBUserMessages();
                return objDBUserMessages.GetEmailUnReaded(Convert.ToInt32(sUserID));
            }
            else
            {
                return 0;
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ArabiSkyService:::CheckIfUserHaveEmail:::" + ex.Message);
            return 0;
        }
    }

    [WebMethod]
    public DataTable GetUserPrivateMessage(string sSecretID, string sUserID)
    {
        try
        {
            if (sSecretID == "962785946301")
            {
                DBUserMessages objDBUserMessages = new DBUserMessages();
                return objDBUserMessages.GetAllUserEmailByUserID(Convert.ToInt32(sUserID)).Tables[0];
            }
            else
            {
                return null;
            }
        }
        catch (Exception ex)
        {
            _logger.Error("ArabiSkyService:::GetUserPrivateMessage:::" + ex.Message);
            return null;
        }
    }
    #endregion
}
