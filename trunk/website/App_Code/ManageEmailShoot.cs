using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
/// <summary>
/// Summary description for ManageEmailShoot
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class ManageEmailShoot : System.Web.Services.WebService
{

    public ManageEmailShoot()
    {

    }

    [WebMethod]
    public int InsertNewEmailAddress(string sEmailAddress)
    {
        using (SqlConnection objSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCon"].ConnectionString))
        {
            SqlCommand objSqlCommand = new SqlCommand();
            objSqlCommand.Connection = objSqlConnection;
            objSqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
            objSqlCommand.CommandText = "sp_InsertEmailShoot";
            objSqlCommand.Parameters.AddWithValue("@emailAddress", sEmailAddress);
            objSqlConnection.Open();
            return objSqlCommand.ExecuteNonQuery();
        }
    }

    [WebMethod]
    public DataSet GetEmailShoot()
    {
        using (SqlConnection objSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCon"].ConnectionString))
        {
            SqlCommand objSqlCommand = new SqlCommand();
            SqlDataAdapter objSqlDataAdapter = new SqlDataAdapter(objSqlCommand);
            DataSet objDataSet = new DataSet();
            objSqlCommand.Connection = objSqlConnection;
            objSqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
            objSqlCommand.CommandText = "sp_GetEmailShoot";
            objSqlDataAdapter.Fill(objDataSet);
            return objDataSet;
        }
    }

    [WebMethod]
    public int UpdateEmailAddressFlag(string sEmailID)
    {
        using (SqlConnection objSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCon"].ConnectionString))
        {
            SqlCommand objSqlCommand = new SqlCommand();
            objSqlCommand.Connection = objSqlConnection;
            objSqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
            objSqlCommand.CommandText = "sp_InsertEmailShoot";
            objSqlCommand.Parameters.AddWithValue("@emailID", sEmailID);
            objSqlConnection.Open();
            return objSqlCommand.ExecuteNonQuery();
        }
    }

}
