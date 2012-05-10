using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using log4net;
using System.Reflection;

namespace CloudAccounting
{
    public partial class _Default : System.Web.UI.Page
    {
        log4net.ILog logger = log4net.LogManager.GetLogger(typeof(_Default));
        protected void Page_Load(object sender, EventArgs e)
        {
            TestMethod1();
        }

        private void TestMethod1()
        {
            //for logging to file
            log4net.ILog logger = log4net.LogManager.GetLogger("File");
            //for emailing
            //log4net.ILog logger = log4net.LogManager.GetLogger("EmailLog");
            logger.Info("Starting page load");
        }
    }
}