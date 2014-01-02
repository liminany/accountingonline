using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Services;
using DAL;

/// <summary>
/// Summary description for WebServiceAjax
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebServiceAjax : System.Web.Services.WebService {

    [WebMethod]
    public List<FillDDLSubCat> GetSubCatValue(string sCatVal)
    {
        try
        {
            FillDDLSubCat objFillDDLSubCat = new FillDDLSubCat();
            List<FillDDLSubCat> CountryInformation = new List<FillDDLSubCat>();


            ManageSubCategory objManageSubCategory = new ManageSubCategory();
            foreach (DataRow item in objManageSubCategory.GetAllSubCatByCatID(int.Parse(sCatVal)).Tables[0].Rows)
            {
                CountryInformation.Add(new FillDDLSubCat()
                {
                    SubCategoriesID = item["SubCategoriesID"].ToString(),
                    SubCategoriesName = item["SubCategoriesName"].ToString()
                });
            }
            return CountryInformation;
        }
        catch (Exception)
        {

            throw;
        }
    }

    public List<FillDDLSubCat> objListOfSubCat { get; set; }
    public class FillDDLSubCat
    {
        public string _sSubCatID = string.Empty;
        public string _sSubCatName = string.Empty;

        public string SubCategoriesID
        {
            set { _sSubCatID = value; }
            get { return _sSubCatID; }
        }
        public string SubCategoriesName
        {
            set { _sSubCatName = value; }
            get { return _sSubCatName; }
        }
    }
    
}
