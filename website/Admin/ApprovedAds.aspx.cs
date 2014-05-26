using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NLog;
using DAL;

public partial class Admin_ApprovedAds : ParentPage
{
    #region variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();
    #endregion

    #region pageload
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                DBAdsManager objDBAdsManager = new DBAdsManager();

                if (Request.QueryString["UserID"] == null)
                {
                    rptPenddingAds.DataSource = objDBAdsManager.GetAllApprovedAds();
                    rptPenddingAds.DataBind();
                }
                else
                {
                    rptPenddingAds.DataSource = objDBAdsManager.GetAllMyAdsByUserID(Convert.ToInt32(Request.QueryString["UserID"].ToString()));
                    rptPenddingAds.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Admin_PinddingAds:::Page_Load:::" + ex.Message);
        }
    }
    #endregion

    #region Events


    #endregion

    #region Methods
    #endregion

    #region WebMethods

    #endregion
}