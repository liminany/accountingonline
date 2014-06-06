<%@ Page Title="موقع سماء العرب | إعلاناتي" MetaDescription="موقع سماء العرب | إعلاناتي - ArabiSky.com"
    Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="MyAds.aspx.cs"
    Inherits="MyAds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .thumb {
            padding: 3px;
            background-color: #fff;
            border: solid 1px #ccc;
            box-shadow: 0 0 3px rgba(30, 30, 30, 0.2);
        }

        .tr_AdsRows td {
            border-bottom: 1px solid #ccc;
        }

        .tr_AdsRows:hover {
            background-color: #e0f4ff !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField runat="server" ID="hfUserID" Value="" />

    <div style="width: 100%">
        <div style="height: 30px; float: right;width:20%">
            <a href='/'>سوق سماء العرب </a>» إعلاناتي
        </div>
        <div style="width: 74%; float: left;">
            <script type="text/javascript"><!--
    google_ad_client = "ca-pub-8724688346081785";
    /* LeaderBoard */
    google_ad_slot = "7597006556";
    google_ad_width = 728;
    google_ad_height = 90;
    //-->
            </script>
            <script type="text/javascript"
                src="//pagead2.googlesyndication.com/pagead/show_ads.js">
            </script>
        </div>
    </div>
    <div style="clear:both;height:10px;"></div>
    <div style="width: 100%; height: auto;">
        <div>
            <div class="arabiSky-indexHeadingLeftCurve">
            </div>
            <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                <div style="float: right;">
                    <h1 style="color: #111111; font-size: 20px;" runat="server" id="sp_PageTitle"></h1>
                </div>
            </div>
            <div class="arabiSky-indexHeadingRightCurve">
            </div>
        </div>
        <div style="clear: both;">
        </div>
        <div>
            <div id="div_AdsTable" runat="server" style="border: 1px solid #ccc; height: auto; width: 973px; margin-right: 10px; text-align: center;">
                <table class="tbMainAds" width="100%" cellpadding="0" cellspacing="0">
                    <asp:Repeater runat="server" ID="rptSlimlerAds">
                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th align="right" style="width: 40%; padding-right: 30px;">عنوان الإعلان
                                    </th>
                                    <th style="width: 10%" align="center">عدد المشاهدات
                                    </th>
                                    <th style="width: 13%" align="center">القسم الفرعي
                                    </th>
                                    <th align="center" style="width: 10%;">المدينة
                                    </th>
                                    <th colspan="2" align="center" style="padding-left: 20px; width: 10%">الصورة
                                    </th>
                                </tr>
                            </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="tr_AdsRows" style="color: #333; font-weight: bolder; height: 60px; cursor: pointer;"
                                onclick="window.location='<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>'">
                                <td align="right" style="width: 55%; padding-right: 30px;padding-top:15px;">
                                    <h2><a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">
                                        <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a></h2>
                                </td>
                                <td style="width: 10%" align="center">
                                    <%# DataBinder.Eval(Container.DataItem, "AdsHit")%>
                                </td>
                                <td style="width: 15%" align="center">
                                    <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                </td>
                                <td align="center" style="width: 10%; font-size: 13px;">
                                    <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                </td>
                                <td align="center" style="padding-left: 20px; width: 10%">
                                    <p>
                                        <a href="javascript:void(0)" class="screenshot" rel='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                            title='<%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>'>
                                            <img src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                width="40" height="40" class="thumb" alt="ArabiSky.com" />
                                        </a>
                                    </p>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="tr_AdsRows" style="background-color: #fafafa; color: #333; font-weight: bolder; height: 60px; cursor: pointer;"
                                onclick="window.location='<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>'">
                                <td align="right" style="width: 55%; padding-right: 30px;padding-top:15px;">
                                    <h2><a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">
                                        <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a></h2>
                                </td>
                                <td style="width: 10%" align="center">
                                    <%# DataBinder.Eval(Container.DataItem, "AdsHit")%>
                                </td>
                                <td style="width: 15%" align="center">
                                    <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                </td>
                                <td align="center" style="width: 10%; font-size: 13px;">
                                    <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                </td>
                                <td align="center" style="padding-left: 20px; width: 10%">
                                    <p>
                                        <a href="javascript:void(0)" class="screenshot" rel='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                            title='<%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>'>
                                            <img src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                width="40" height="40" class="thumb" alt="ArabiSky.com" />
                                        </a>
                                    </p>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <div style="text-align: center; border: 1px solid #ccc; margin-right: 10px; height: 45px; padding-top: 30px; font-weight: bold; font-size: 20px;"
                id="div_EmptyAdsTable"
                runat="server">
                لايوجد لديك إعلانات مضافة - لإضافة إعلان جديد <a href="AdsPage">انقر هنا</a>
            </div>
        </div>
        <div style="clear: both; height: 10px;">
        </div>
        <div style="text-align: center;">
            <script type="text/javascript"><!--
    google_ad_client = "ca-pub-8724688346081785";
    /* LeaderBoard */
    google_ad_slot = "7597006556";
    google_ad_width = 728;
    google_ad_height = 90;
    //-->
            </script>
            <script type="text/javascript"
                src="//pagead2.googlesyndication.com/pagead/show_ads.js">
            </script>
        </div>
    </div>
</asp:Content>
