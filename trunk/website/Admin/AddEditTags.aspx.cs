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

public partial class Admin_AddEditTags : ParentPage
{
    #region Varabiles
    ManageTags objManageTags = new ManageTags();
    Tags objTags = new Tags();
    ManageSubCategory objManageSubCategory = new ManageSubCategory();
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                FormsFunction.BindDDL(ref ddlSubCategoryName, objManageSubCategory.GetAllSubCategory(), "SubCategoriesName", "SubCategoriesID", "إختر الفسم الفرعي");
                if (Request.Url.AbsoluteUri.IndexOf("TagsID=") >= 0)
                {
                    txtTagURL.Text = objTags.TagsName;
                    txtTagURL.Text = objTags.TagsURL;
                    ddlSubCategoryName.SelectedValue = objTags.SubCategoryIDFK.ToString();
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddEditTags:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {

            if (Request.RawUrl.IndexOf("TagsID=") >= 0)
            {
                objTags.TagsID = Convert.ToInt16(Request.QueryString["TagsID"].ToString());
                objTags.TagsName = txtTagURL.Text;
                objTags.TagsURL = txtTagURL.Text;
                objTags.SubCategoryIDFK = int.Parse(ddlSubCategoryName.SelectedValue);

                int nReturnValue = objManageTags.EditTagInfo(objTags);
                if (nReturnValue == 1)
                {
                    Response.Redirect("SubCategories", false);
                }
                else
                {
                    tr_UserMessage.InnerHtml = "you have issues please contact the system support";
                }
            }
            else
            {
                objTags.TagsName = txtTagURL.Text;
                objTags.TagsURL = txtTagURL.Text;
                objTags.SubCategoryIDFK = int.Parse(ddlSubCategoryName.SelectedValue);
                int nReturnValue = objManageTags.AddNewTags(objTags);
                if (nReturnValue == 1)
                {
                    tr_UserMessage.InnerHtml = "تم اضافة الوسوم بنجاح";
                }

            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_AddEditTags:::btnSubmit_Click:::" + ex.Message);
        }
    }
    #endregion
}