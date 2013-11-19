using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Xml;
using System.Text.RegularExpressions;
using System.IO;

public partial class CheckCountry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetCountry();
        lblCity.Text = FormsFunction.GetCountryName();
    }


    public void GetCountry()
    {
        try
        {
            if (!string.IsNullOrEmpty(FormsFunction.GetCountryName()))
            {
                switch (FormsFunction.GetCountryName())
                {
                    case "JO":
                        div_Country.InnerHtml = "JO " + 12;
                        break;
                    case "JOR":
                        div_Country.InnerHtml = "JOR " + 12;
                        break;
                    case "SA":
                        div_Country.InnerHtml = "SA " + 14;
                        break;
                    case "SAU":
                        div_Country.InnerHtml = "SAU " + 14;
                        break;
                    case "PS":
                        div_Country.InnerHtml = "PS " + 15;
                        break;
                    case "PSE":
                        div_Country.InnerHtml = "PSE " + 15;
                        break;
                    case "IL":
                        div_Country.InnerHtml = "IL " + 15;
                        break;
                    case "ISR":
                        div_Country.InnerHtml = "ISR " + 15;
                        break;
                    default:
                        div_Country.InnerHtml = "JO " + 12;
                        break;
                }
            }
            else
            {
                div_Country.InnerHtml = "Null JO " + 12;
            }
        }
        catch (Exception)
        {
            div_Country.InnerHtml = "Error - JO " + 12;
        }
    }
}