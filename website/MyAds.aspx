<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="MyAds.aspx.cs" Inherits="MyAds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 30px; float: right;">
        <a href='/'>سوق سماء العرب </a>» إعلاناتي
    </div>
    <div style="clear: both;">
    </div>
    <div style="width: 100%; height: auto;">
        <div>
            <div class="clickin-indexHeadingLeftCurve">
            </div>
            <div class="clickin-indexHeadingContent" style="width: 97%;">
                <div style="float: right;">
                    <span style="color: #111111; font-size: 20px;" runat="server" id="sp_PageTitle">
                    </span>
                </div>
            </div>
            <div class="clickin-indexHeadingRightCurve">
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
                                    <th align="right" style="width: 40%; padding-right: 30px;">
                                        عنوان الإعلان
                                    </th>
                                    <th style="width: 10%" align="center">
                                        عدد المشاهدات
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
                                <td align="right" style="width: 55%; padding-right: 30px;">
                                    <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>
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
                                    <img src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                        width="50" height="50" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr style="background-color: #ededed; color: #333; font-weight: bolder; height: 60px;
                                cursor: pointer;" onclick="window.location='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'">
                                <td align="right" style="width: 55%; padding-right: 30px;">
                                    <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>
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
                                    <img src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                        width="50" height="50" />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <div style="text-align:center;border:1px solid #ccc;margin-right: 10px;height: 45px;padding-top: 30px;font-weight:bold;font-size:20px;" id="div_EmptyAdsTable" runat="server">
                لايوجد لديك إعلانات مضافة - لإضافة إعلان جديد <a href="AdsPage">انقر هنا</a>
            </div>
        </div>
    </div>
</asp:Content>
