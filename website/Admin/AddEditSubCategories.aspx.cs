using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using DAL;
using Entity.Country;
using NLog;
using Entity.City;

public partial class Admin_AddEditSubCategories : ParentPage
{
    #region Varabiles
    ManageSubCategory objManageSubCategory = new ManageSubCategory();
    ManageCategory objManageCategory = new ManageCategory();

    SubCategory objSubCategory = new SubCategory();
    Category objCategory = new Category();

    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                FormsFunction.BindDDL(ref ddlCategoryName, objManageCategory.GetAllCategory(), "CatName", "Cat_ID", "إختر القسم");
                if (Request.Url.AbsoluteUri.IndexOf("SubCategoriesID=") >= 0)
                {

                    objSubCategory.SubCategoryID = Convert.ToInt16(Request.QueryString["SubCategoriesID"].ToString());
                    objSubCategory.SubCategoryStatus = 0;
                    objSubCategory.SubCategoryName = "";
                    objSubCategory.CategoryID_FK = 0;

                    objSubCategory = objManageSubCategory.GetSubCategoryInfo(objSubCategory.SubCategoryID.ToString());
                    txtCityName.Text = objSubCategory.SubCategoryName;
                    ddlSubCategoryStatus.SelectedValue = objSubCategory.SubCategoryStatus.ToString();
                    ddlCategoryName.SelectedValue = objSubCategory.CategoryID_FK.ToString();
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddEditSubCategories:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {

            if (Request.RawUrl.IndexOf("SubCategoriesID=") >= 0)
            {
                objSubCategory.SubCategoryID = Convert.ToInt16(Request.QueryString["SubCategoriesID"].ToString());
                objSubCategory.SubCategoryName = txtCityName.Text;
                objSubCategory.SubCategoryStatus = ddlSubCategoryStatus.SelectedIndex;
                objSubCategory.CategoryID_FK = int.Parse(ddlCategoryName.SelectedValue);

                int nReturnValue = objManageSubCategory.EditSubGategoryInfo(objSubCategory);
                if (nReturnValue == 1)
                {
                    tr_UserMessage.InnerHtml = "Edit Sub Category Successfully";
                    Response.Redirect("SubCategories", false);
                }
                else
                {
                    tr_UserMessage.InnerHtml = "you have issues please contact the system support";
                }
            }
            else
            {
                objSubCategory.SubCategoryID = 0;
                objSubCategory.SubCategoryName = txtCityName.Text;
                objSubCategory.SubCategoryStatus = ddlSubCategoryStatus.SelectedIndex;
                objSubCategory.CategoryID_FK = int.Parse(ddlCategoryName.SelectedValue);
                int returnValue = objManageSubCategory.AddNewSubCategory(objSubCategory);
                if (returnValue == 1)
                {
                    //Response.Redirect("SubCategories", false);
                    txtCityName.Text = string.Empty;
                }

            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddEditSubCategories:::btnSubmit_Click:::" + ex.Message);
        }
    }
    #endregion
}