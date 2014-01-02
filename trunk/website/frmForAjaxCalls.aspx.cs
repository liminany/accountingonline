using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using System.Collections;
public partial class frmForAjaxCalls : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sCatID = Request.QueryString["CatID"] as string;

        if (sCatID != null)
        {
            ManageSubCategory objManageSubCategory = new ManageSubCategory();
            DataTable table = objManageSubCategory.GetAllSubCatByCatID(int.Parse(sCatID)).Tables[0];

            string result = string.Empty;
            string result1 = string.Empty;

            foreach (DataRow r in table.Rows)
            {
                result += r["SubCategoriesID"].ToString() + ";";
            }
            foreach (DataRow r in table.Rows)
            {
                result1 += r["SubCategoriesName"].ToString() + ";";
            }



            Response.Clear();
            Response.Write(result + "|" + result1);
            Response.End();
        }
    }
}