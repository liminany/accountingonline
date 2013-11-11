﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField runat="server" Value="0" ID="hfUserProfileID" />
    <asp:HiddenField runat="server" Value="0" ID="hfUserID" />
    <div style="height: 30px; float: right;">
        <a href='/'>سوق سماء العرب </a>»&nbsp;المعلومات الشخصية للمستخدم
    </div>
    <div style="clear: both;">
    </div>
    <div style="width: 100%; height: auto;">
        <div>
            <div class="arabiSky-indexHeadingLeftCurve">
            </div>
            <div class="arabiSky-indexHeadingContent" style="width: 97%; font-size: 16px;">
                المعلومات الشخصية للمستخدم
            </div>
            <div class="arabiSky-indexHeadingRightCurve">
            </div>
        </div>
        <div style="clear: both;">
        </div>
        <div>
            <div style="border: 1px solid #ccc; height: auto; width: 933px; margin-right: 10px;
                text-align: center; padding-right: 20px; padding-top: 15px; padding-left: 20px;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr style="height: 100px;">
                        <td align="right" style="width: 80px;">
                            <img id="imgUserProfile" runat="server" src="images/ArabiSkyUnknowUser.png" width="150"
                                height="150" alt="ArabiSky.com" />
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                        <td align="left" style="padding-left: 20px; vertical-align: bottom">
                            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                            <!-- ArabiSky_SqureAds -->
                            <ins class="adsbygoogle" style="display: inline-block; width: 300px; height: 250px"
                                data-ad-client="ca-pub-7196218955155134" data-ad-slot="3574583608"></ins>
                            <script>
                                (adsbygoogle = window.adsbygoogle || []).push({});
                            </script>
                            <%-- <a id="spUserFullName" class="fancybox" href="#inline1" style="font-weight: bold;
                                text-decoration: underline">إرسال رسالة</a>--%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom: 1px solid #ccc;" colspan="3">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            إسم المستخدم :
                        </td>
                        <td colspan="2" align="right">
                            <span style="color: #111111; font-size: 15px;" id="sp_UserFullName" runat="server">
                            </span>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            البريد الإلكتروني :
                        </td>
                        <td colspan="2" align="right">
                            <a href="javascript:void(0)" style="font-size: 15px;" id="aEmailAddress" runat="server">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            تاريخ التسجيل في الموقع :
                        </td>
                        <td colspan="2" align="right">
                            <span style="color: #111111; font-size: 15px;" id="spCreateDate" runat="server">
                            </span>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom: 1px solid #ccc;" colspan="3">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 20px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="font-weight: bold;" align="center" id="spTitleBrowseAds" runat="server">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 20px;">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="3">
                            <div style="width: 100%; height: auto;">
                                <div>
                                    <div class="arabiSky-indexHeadingLeftCurve">
                                    </div>
                                    <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                                        <div style="float: right;">
                                            <span style="color: #111111; font-size: 20px;" id="CatName" runat="server">إعلانات الخاصة
                                                بالمستخدم</span>
                                        </div>
                                    </div>
                                    <div class="arabiSky-indexHeadingRightCurve">
                                    </div>
                                </div>
                                <div style="clear: both;">
                                </div>
                                <div>
                                    <div style="border: 1px solid #ccc; height: auto; margin-right: 8px; text-align: center;">
                                        <table class="tbMainAds" width="100%" cellpadding="0" cellspacing="0">
                                            <asp:Repeater runat="server" ID="rptUserAds">
                                                <HeaderTemplate>
                                                    <thead>
                                                        <tr>
                                                            <th align="right" style="width: 50%; padding-right: 30px;">
                                                                عنوان الإعلان
                                                            </th>
                                                            <th style="width: 13%" align="center">
                                                                القسم الفرعي
                                                            </th>
                                                            <th align="center" style="width: 10%;">
                                                                المدينة
                                                            </th>
                                                            <th colspan="2" align="center" style="padding-left: 20px; width: 10%">
                                                                الصورة
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr style="background-color: #fff; color: #333; font-weight: bolder; height: 60px;
                                                        cursor: pointer;" onclick="window.location='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'">
                                                        <td align="right" style="width: 65%; padding-right: 30px;">
                                                            <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>
                                                        </td>
                                                        <td style="width: 15%" align="center">
                                                            <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                                        </td>
                                                        <td align="center" style="width: 10%; font-size: 13px;">
                                                            <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                        </td>
                                                        <td align="center" style="padding-left: 20px; width: 10%">
                                                            <img src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                width="50" height="50" alt="ArabiSky.com" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <AlternatingItemTemplate>
                                                    <tr style="background-color: #ededed; color: #333; font-weight: bolder; height: 60px;
                                                        cursor: pointer;" onclick="window.location='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'">
                                                        <td align="right" style="width: 65%; padding-right: 30px;">
                                                            <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>
                                                        </td>
                                                        <td style="width: 15%" align="center">
                                                            <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                                        </td>
                                                        <td align="center" style="width: 10%; font-size: 13px;">
                                                            <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                        </td>
                                                        <td align="center" style="padding-left: 20px; width: 10%">
                                                            <img src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                width="50" height="50" alt="ArabiSky.com" />
                                                        </td>
                                                    </tr>
                                                </AlternatingItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 20px;">
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
                <%--<div style="width:728px;height:90px;background-color:Red;"></div>--%>
            </div>
        </div>
    </div>
</asp:Content>