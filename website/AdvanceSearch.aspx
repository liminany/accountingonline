﻿<%@ Page Title="سوق سماء العرب | بحث متقدم" Language="C#" MetaDescription="سوق سماء العرب | ArabiSky.com | بحث متقدم" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="AdvanceSearch.aspx.cs" Inherits="AdvanceSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="height: 30px; float: right;">
                <a href='/'>سوق سماء العرب </a>» <span>بحث متقدم</span>
            </div>
            <div style="clear: both;">
            </div>
            <div style="width: 100%; height: auto;">
                <div>
                    <div class="arabiSky-indexHeadingLeftCurve">
                    </div>
                    <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                        <a href="" title="Education & Learning" style="color: #111111; font-size: 20px;"
                            runat="server" id="spAdsTitle">بحث متقدم</a>
                    </div>
                    <div class="arabiSky-indexHeadingRightCurve">
                    </div>
                </div>
                <div style="clear: both;">
                </div>
                <div>
                    <div style="float: right; border: 1px solid #ccc; height: auto; width: 903px; margin-right: 10px; text-align: right; padding-right: 50px; padding-top: 20px; padding-left: 20px;">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 70%">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                            <td style="font-weight: bold;">- الرجاء إدخال جميع الحقول لكي يتم عمل تخصيص للبحث لظهور نتائج افضل
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 70px;">كلمة البحث
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtSearchText" Width="350"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 70px;">البلد
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlCountryName" runat="server" CssClass="arabiSky-homeSelectbox"
                                                    Style="width: 300px;" AutoPostBack="true" OnSelectedIndexChanged="ddlCountryName_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 70px;">المدينة
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlCityName" runat="server" CssClass="arabiSky-homeSelectbox"
                                                    Style="width: 300px;">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 70px;">القسم
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlCategoryName" runat="server" CssClass="arabiSky-homeSelectbox"
                                                    Style="width: 250px;" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoryName_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 70px;">القسم الفرعي
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlSubCategoryName" runat="server" CssClass="arabiSky-homeSelectbox"
                                                    Style="width: 250px;">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 70px;">السعر
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtPriceForm" Width="134" placeholder="السعر من"
                                                    onkeypress="return numbersonly(event)"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="txtPriceTo" Width="134" placeholder="السعر الى" onkeypress="return numbersonly(event)"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 70px;"></td>
                                            <td>
                                                <asp:Button runat="server" ID="btnSearch" CssClass="arabiSky-postClassifieds" Text="بحث"
                                                    Style="border: 0px; cursor: pointer; width: 180px; background: #ededed; border-top: 2px solid #f9ae4c; border-radius: 0px; margin-left: 5px; height: 35px; padding: 5px; font-size: 15px !important;"
                                                    OnClick="btnSearch_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 30%">
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
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="height: 15px; clear: both;">
                    </div>
                    <div style="text-align: center;">
                        <div>
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
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
