<%@ Page Title="" Language="C#" MasterPageFile="~/m/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAd.aspx.cs" Inherits="m_ViewAd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        $(document).ready(function () {
            $("#div_Country").css("display", "none");
        });
    </script>
    <div id="containerInner" style="margin-bottom: 12px;">

        <div class="classifiedPost">
            <div class="classifieds-title">
                <span class="viewPagePremiumImage">
                    <img runat="server" src="./images/star.png" border="0"></span>
                <h1 runat="server" id="spAdsTitle">AC Furnished Paying Guest Room Rent For LADIES Kitchen, LIFT</h1>
            </div>
            <div class="classifieds-optionBlock">
                <div class="classifieds-img">
                    <div style="display: none; margin: 10px; text-align: center; width: 100%; padding-right: 10px;" id="div_Slider" runat="server">
                    </div>
                    <div id="slider_google_ads"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="arabiSky-adDetails" style="float: right; width: 50%">
                <ul style="font-size: 15px; font-weight: bolder;" itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer">
                    <li style="text-align: right;" id="liSection" runat="server"></li>
                    <li style="text-align: right;" id="liSubSection" runat="server"></li>
                    <li style="text-align: right;" id="liCountry" runat="server"></li>
                    <li style="text-align: right;" id="liCity" runat="server"></li>
                    <li style="text-align: right;" id="liCreateDate" runat="server"></li>
                </ul>
            </div>
            <div style="width: 59%; float: right;">
                <div style="border-bottom: 2px dashed #ccc; padding-top: 10px; width: 102%; float: right; height: 37px; color: #111111; background-color: #ededed; display: ; font-weight: bolder; font-size: 25px; text-align: right; padding-right: 25px;">
                    تفاصيل الإعلان
                </div>
                <div style="clear: both; height: 20px;">
                </div>
                <div>
                    <h2 itemprop="description" style="text-align: right; margin-right: 30px; margin-left: 30px; width: 80%; float: right; height: auto; word-wrap: break-word; padding-left: 10px;"
                        id="div_AdsDescription"
                        runat="server"></h2>
                </div>
                <div style="clear: both; height: 20px;">
                </div>
                <div style="width: 100%">
                    <div style="float: right; margin-right: 30px;">
                        <script type="text/javascript"><!--
    google_ad_client = "ca-pub-8724688346081785";
    /* View_Ads */
    google_ad_slot = "6120273353";
    google_ad_width = 300;
    google_ad_height = 250;
    //-->
                        </script>
                        <script type="text/javascript"
                            src="//pagead2.googlesyndication.com/pagead/show_ads.js">
                        </script>
                    </div>
                </div>
            </div>

             <div style="height: 10px; clear: both">
                </div>
                <div style="text-align: center;" id="div_YouTube" runat="server">
                    <div id="div_YouTubeURL" runat="server">
                    </div>
                </div>
            <div style="font-size: 25px; text-align: center;">
                <a href="~/m/default.aspx" runat="server">رجوع للصفحة الرئيسية</a>
            </div>
        </div>

    </div>
</asp:Content>

