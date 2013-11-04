using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Entity.Country;
using NLog;
using Entity;

public partial class Admin_AddEditCategories : ParentPage
{
    #region Varabiles
    ManageCategory objDALManageCategory = new ManageCategory();
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
                if (Request.Url.AbsoluteUri.IndexOf("CategoriesID=") >= 0)
                {
                    objCategory.CategoryID = Convert.ToInt16(Request.QueryString["CategoriesID"].ToString());
                    objCategory = objDALManageCategory.GetCategoryInfo(objCategory.CategoryID.ToString());
                    txtCategoriesName.Text = objCategory.CategoryName;
                    ddlCategoriesStatus.SelectedValue = objCategory.CategoryStatus.ToString();
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddEditCategories:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {

            if (Request.RawUrl.IndexOf("CategoriesID=") >= 0)
            {
                objCategory.CategoryID = Convert.ToInt16(Request.QueryString["CategoriesID"].ToString());
                objCategory.CategoryName = txtCategoriesName.Text;
                objCategory.CategoryStatus = ddlCategoriesStatus.SelectedIndex;

                int nReturnValue = objDALManageCategory.EditGategoryInfo(objCategory);
                if (nReturnValue == 1)
                {
                    tr_UserMessage.InnerHtml = "Edit Categories Successfully";
                    Response.Redirect("Categories", false);
                }
                else
                {
                    tr_UserMessage.InnerHtml = "you have issues please contact the system support";
                }
            }
            else
            {
                objCategory.CategoryID = 0;
                objCategory.CategoryName = txtCategoriesName.Text;
                objCategory.CategoryStatus = ddlCategoriesStatus.SelectedIndex;
                int nReturnValue = objDALManageCategory.AddNewCategory(objCategory);
                Response.Redirect("Categories", false);
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddEditCategories:::btnSubmit_Click:::" + ex.Message);
        }
    }
    #endregion
}