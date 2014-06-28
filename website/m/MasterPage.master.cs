using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class m_MasterPage : System.Web.UI.MasterPage
{
    #region Variables
    private static Logger _logger = LogManager.GetCurrentClassLogger();  
    private static readonly Regex REGEX_BETWEEN_TAGS = new Regex(@">\s+<", RegexOptions.Compiled);
    private static readonly Regex REGEX_LINE_BREAKS = new Regex(@"\n\s+", RegexOptions.Compiled);
    #endregion

    #region Pageload
    protected override void Render(HtmlTextWriter writer)
    {
        try
        {
            using (HtmlTextWriter htmlwriter = new HtmlTextWriter(new System.IO.StringWriter()))
            {
                base.Render(htmlwriter);
                string html = htmlwriter.InnerWriter.ToString();
                html = REGEX_BETWEEN_TAGS.Replace(html, "> <");
                html = REGEX_LINE_BREAKS.Replace(html, string.Empty);
                writer.Write(html.Trim());
            }
        }
        catch (Exception ex)
        {
            _logger.Error("master:::Render:::" + ex.Message);
            throw;
        }
    } 
    #endregion
}
