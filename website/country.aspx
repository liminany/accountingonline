<%@ Page Title="سوق سماء العرب | البلدان" MetaDescription="سوق سماء العرب | ArabiSky.com | البلدان"
    Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="country.aspx.cs"
    Inherits="country" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function funChooseCountry(e) {
            switch (e) {
                case "12":
                    createCookie("ArabiSkyCheckCountryFull", "12", 1e3);
                    break;
                case "14":
                    createCookie("ArabiSkyCheckCountryFull", "14", 1e3);
                    break;
                case "15":
                    createCookie("ArabiSkyCheckCountryFull", "15", 1e3);
                    break;
                case "16":
                    createCookie("ArabiSkyCheckCountryFull", "16", 1e3);
                    break;
                case "17":
                    createCookie("ArabiSkyCheckCountryFull", "17", 1e3);
                    break;
                case "19":
                    createCookie("ArabiSkyCheckCountryFull", "19", 1e3);
                    break;
                case "24":
                    createCookie("ArabiSkyCheckCountryFull", "24", 1e3);
                    break;
                case "23":
                    createCookie("ArabiSkyCheckCountryFull", "23", 1e3);
                    break;
                case "21":
                    createCookie("ArabiSkyCheckCountryFull", "21", 1e3);
                    break;
                case "20":
                    createCookie("ArabiSkyCheckCountryFull", "20", 1e3);
                    break;
                case "18":
                    createCookie("ArabiSkyCheckCountryFull", "18", 1e3);
                    break;
                case "22":
                    createCookie("ArabiSkyCheckCountryFull", "22", 1e3);
                    break;
                case "27":
                    createCookie("ArabiSkyCheckCountryFull", "27", 1e3);
                    break;
                case "26":
                    createCookie("ArabiSkyCheckCountryFull", "26", 1e3);
                    break;
                case "25":
                    createCookie("ArabiSkyCheckCountryFull", "25", 1e3);
                    break;
                case "28":
                    createCookie("ArabiSkyCheckCountryFull", "28", 1e3);
                    break;
                case "29":
                    createCookie("ArabiSkyCheckCountryFull", "29", 1e3);
                    break;
                case "30":
                    createCookie("ArabiSkyCheckCountryFull", "30", 1e3);
                    break;
                case "31":
                    createCookie("ArabiSkyCheckCountryFull", "31", 1e3);
                    break;
                default:
                    break;
            }
            window.location = "/";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100px;">
        <div style="float: right; width: 238px;">
            <a href='/'>سوق سماء العرب </a>»&nbsp;<span>البلدان</span>
        </div>
        <div style="float: left;">
            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
            <!-- ArabiSky_Default_Top -->
            <ins class="adsbygoogle" style="display: inline-block; width: 728px; height: 90px"
                data-ad-client="ca-pub-7196218955155134" data-ad-slot="3354257605"></ins>
            <script>                (adsbygoogle = window.adsbygoogle || []).push({});</script>
        </div>
    </div>
    <div style="clear: both;">
    </div>
    <div style="width: 100%; height: auto;">
        <div>
            <div class="arabiSky-indexHeadingLeftCurve">
            </div>
            <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                <a href="" title="Education & Learning" style="color: #111111; font-size: 20px;"
                    runat="server" id="spAdsTitle">الرجاء قم بإختيار علم بلدك</a>
            </div>
            <div class="arabiSky-indexHeadingRightCurve">
            </div>
        </div>
        <div style="clear: both;">
        </div>
        <div>
            <div style="float: right; border: 1px solid #ccc; height: auto; width: 933px; margin-right: 10px;
                text-align: center; padding-right: 20px; padding-top: 15px; padding-left: 20px;">
                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('12')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_jordan.png" />
                            </a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('15')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Palastain.png" />
                            </a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('14')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_saudiArabia.png" />
                            </a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('17')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Egypt.png" />
                            </a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('19')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Emarats.png" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('12')">الأردن</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('15')">فلسطين</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('14')">السعودية</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('17')">مصر</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('19')">الإمارات</a>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 50px;" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                             <a href="javascript:void(0)" onclick="funChooseCountry('24')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Syria.png" /></a>
                        </td>
                        <td align="center">
                             <a href="javascript:void(0)" onclick="funChooseCountry('16')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Libya.png" /></a>
                        </td>
                        <td align="center">
                             <a href="javascript:void(0)" onclick="funChooseCountry('23')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Kuwait.png" /></a>
                        </td>
                        <td align="center">
                             <a href="javascript:void(0)" onclick="funChooseCountry('21')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Qatar.png" /></a>
                        </td>
                        <td align="center">
                             <a href="javascript:void(0)" onclick="funChooseCountry('20')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Bahrain.png" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('24')">سوريا</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('16')">ليبيا</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('23')">الكويت</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('21')">قطر</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('20')">البحرين</a>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 50px;" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('18')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Yemen.png" /></a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('22')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Oman.png" /></a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('27')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Morocco.png" /></a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('26')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Algeria.png" /></a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('25')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Tounis.png" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('18')">اليمن</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('22')">عُمان</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('27')">تونس</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('26')">الجزائر</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('25')">المغرب</a>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 50px;" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('28')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Lebanon.png" /></a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('29')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Iraq.png" /></a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('30')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Sudan.png" /></a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('31')">
                                <img alt="ArabiSky.com" style="border: 0px" width="64" height="42" src="img/img_Country/img_Mauritania.png" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('28')">لبنان</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('29')">العراق</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('30')">السودان</a>
                        </td>
                        <td align="center">
                            <a href="javascript:void(0)" onclick="funChooseCountry('31')">موريتانيا</a>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 50px;" align="center">
                        </td>
                    </tr>
 
                </table>
            </div>
            <div style="clear: both; height: 10px;">
            </div>
            <div style="text-align: center;">
                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                <!-- ArabiSky_Default_Top -->
                <ins class="adsbygoogle" style="display: inline-block; width: 728px; height: 90px"
                    data-ad-client="ca-pub-7196218955155134" data-ad-slot="3354257605"></ins>
                <script>                    (adsbygoogle = window.adsbygoogle || []).push({});</script>
            </div>
        </div>
    </div>
</asp:Content>
