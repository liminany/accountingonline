using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NLog;
using DAL;
using System.Web.Services;
using Entity;

public partial class Admin_PinddingAds : ParentPage
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
                rptPenddingAds.DataSource = objDBAdsManager.GetAllPenddingAds();
                rptPenddingAds.DataBind();
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