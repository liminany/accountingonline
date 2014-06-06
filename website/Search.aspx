<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="Search" %>

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
    <div style="height: 100px;">
        <div style="float: right; width: 238px;">
            <a href='/'>سوق سماء العرب </a>»&nbsp;<span>بحث</span>
        </div>
        <div style="float: left;">
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
    <div style="clear: both;">
    </div>
    <div style="width: 100%; height: auto;">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div style="width: 100%; height: auto;">
                        <div>
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                                <div style="float: right;">
                                    <h1 style="color: #111111; font-size: 20px;" runat="server" id="sp_SearchTitle"></h1>
                                </div>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                        </div>
                        <div style="clear: both;">
                        </div>
                        <div>
                            <div style="border: 1px solid #ccc; height: auto; width: 973px; margin-right: 10px; text-align: center;">
                                <table class="tbMainAds" style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr id="trMainAds" runat="server">
                                        <td>
                                            <asp:Repeater runat="server" ID="rptlatstAdsAdded">
                                                <HeaderTemplate>
                                                    <thead>
                                                        <tr>
                                                            <th align="right" style="width: 50%; padding-right: 30px;">عنوان الإعلان
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
                                                        <td align="right" style="width: 65%; padding-right: 30px;padding-top:15px;">
                                                           <h2> <a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">
                                                                <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a></h2>
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
                                                                    <img class="thumb" src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                        width="40" height="40" alt="ArabiSky.com" />
                                                                </a>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <AlternatingItemTemplate>
                                                    <tr class="tr_AdsRows" style="background-color: #fafafa; color: #333; font-weight: bolder; height: 60px; cursor: pointer;"
                                                        onclick="window.location='<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>'">
                                                        <td align="right" style="width: 65%; padding-right: 30px;padding-top:15px;">
                                                           <h2> <a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">
                                                                <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a></h2>
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
                                                                    <img class="thumb" src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                        width="40" height="40" alt="ArabiSky.com" />
                                                                </a>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </AlternatingItemTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                    <tr id="trMainEmpty" runat="server">
                                        <td style="text-align: right; padding: 30px;">بحثك - <span id="sp_SearchWords" runat="server" style="font-weight: bold;"></span>
                                            - لم يطابق أي وثائق.<br />
                                            <br />
                                            الاقتراحات:<br />
                                            <br />
                                            <ul style="margin-right: 30px;">
                                                <li>تأكد من كتابة الكلمات بشكل صحيح. </li>
                                                <li>محاولة استخدام كلمات مختلفة </li>
                                                <li>استخدم كلمات عامة </li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </div>
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
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
