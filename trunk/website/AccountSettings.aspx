﻿<%@ Page Title="سوق سماء العرب | خصائص حسابي" MetaDescription="سوق سماء العرب | ArabiSky.com | خصائص حسابي" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="AccountSettings.aspx.cs" Inherits="AccountSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfUserID" runat="server" />
    <div style="height: 30px; float: right;">
        <a href='/'>سوق سماء العرب </a>» تعديل بيانات المستخدم
    </div>
    <table width="100%" cellpadding="0" cellspacing="0" dir="rtl">
        <tr>
            <td style="background-color: #E6E7D4; height: 30px; padding-right: 20px; font-weight: bold;">
                تعديل معلومات المستخدم
            </td>
        </tr>
        <tr style="background-color: #ededed;">
            <td style="padding-right: 20px; border: 1px solid #ccc;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="3" style="height: 20px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px; padding-bottom: 5px;">
                            إسم المستخدم الكامل :
                        </td>
                        <td>
                            <input type="text" runat="server" id="txtUserFullName" validationgroup="p1" style="width: 250px;" />
                            <asp:RequiredFieldValidator Font-Bold="true" ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtUserFullName" Display="Dynamic" ValidationGroup="p1" ErrorMessage="الرجاء إدخال اسمك الكامل"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; padding-bottom: 5px;">
                            البريد الإلكتروني :
                        </td>
                        <td>
                            <input type="text" runat="server" id="txtUserEmailAddress" validationgroup="p1" style="width: 250px;"
                                readonly="readonly" disabled="disabled" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; padding-bottom: 5px;">
                            عدد الإعلانات المسموح بها :
                        </td>
                        <td>
                            <input type="text" runat="server" id="txtUserAdsQuta" validationgroup="p1" style="width: 250px;"
                                readonly="readonly" disabled="disabled" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; padding-bottom: 5px;">
                            عدد الإعلانات المستعملة :
                        </td>
                        <td>
                            <input type="text" runat="server" id="txtUserAdsCount" validationgroup="p1" style="width: 250px;"
                                readonly="readonly" disabled="disabled" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; padding-bottom: 5px;">
                            صورة ملفك :
                        </td>
                        <td>
                            <div style="width: 50%; float: right">
                                <asp:FileUpload ID="upFileUserProfile" runat="server" />
                            </div>
                            <div style="width: 50%; float: left">
                                <img id="imgUserProfile" runat="server" src="images/ArabiSkyUnknowUser.png" width="50"
                                    height="50" alt="ArabiSky.com" />
                            </div>
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                    </tr>
                    <%--  <tr>
                                <td style="width: 140px; padding-bottom: 5px;">
                                    البلد :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCountryName" runat="server" CssClass="arabiSky-homeSelectbox"
                                        Style="width: 264px;" AutoPostBack="true" OnSelectedIndexChanged="ddlCountryName_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 140px; padding-bottom: 5px;">
                                    المدينة :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCityName" runat="server" CssClass="arabiSky-homeSelectbox"
                                        Style="width: 264px;">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>--%>
                    <tr>
                        <td style="width: 140px; padding-bottom: 5px;">
                            رقم الهاتف :
                        </td>
                        <td>
                            <input type="text" runat="server" id="txtUserMobilePhoneNumber" validationgroup="p1"
                                style="width: 250px;" />
                        </td>
                        <td align="left" style="padding-left: 10px;">
                            <asp:Button ID="btnSubmit" runat="server" ValidationGroup="p1" Text="تعديل" CssClass="singinBtn"
                                OnClick="btnSubmit_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; padding-bottom: 5px;">
                        </td>
                        <td>
                            <span runat="server" id="tr_UserMessage_1"></span>
                        </td>
                        <td align="left" style="padding-left: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 20px;">
            </td>
        </tr>
        <tr>
            <td style="background-color: #E6E7D4; height: 30px; padding-right: 20px; font-weight: bold;">
                تعديل كلمة المرور
            </td>
        </tr>
        <tr style="background-color: #ededed">
            <td style="padding-right: 20px; border: 1px solid #ccc;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="3" style="height: 20px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px; padding-bottom: 5px;">
                            كلمة المرور :
                        </td>
                        <td>
                            <input type="password" runat="server" id="txtPassword" style="width: 250px;" />
                            <asp:RequiredFieldValidator Font-Bold="true" ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="txtPassword" Display="Dynamic" ValidationGroup="p2" ErrorMessage="الرجاء إدخال كلمة المرور"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; padding-bottom: 5px;">
                            تأكيد كلمة المرور :
                        </td>
                        <td>
                            <input type="password" runat="server" id="txtConfirmPassword" style="width: 250px;" />
                            <asp:CompareValidator ID="cv" runat="server" ErrorMessage="تأكيد كلمة المرور غير مطابقة لكلمة المرور"
                                Display="Dynamic" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                                Font-Bold="true" ValidationGroup="p2"></asp:CompareValidator><asp:RequiredFieldValidator
                                    ValidationGroup="p2" Font-Bold="true" ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="الرجاء إدخال تأكيد كلمة المرور"></asp:RequiredFieldValidator></label>
                        </td>
                        <td align="left" style="padding-left: 10px;">
                            <asp:Button ID="btnChangePassword" runat="server" Text="تعديل" ValidationGroup="p2"
                                CssClass="singinBtn" OnClick="btnChangePassword_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px; padding-bottom: 5px;">
                        </td>
                        <td>
                            <span runat="server" id="tr_UserMessage_2"></span>
                        </td>
                        <td align="left" style="padding-left: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="clear: both; height: 10px;">
        </div>
        <div style="text-align: center;">
            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
            <!-- ArabiSky_Default_Top -->
            <ins class="adsbygoogle" style="display: inline-block; width: 728px; height: 90px"
                data-ad-client="ca-pub-7196218955155134" data-ad-slot="3354257605"></ins>
            <script>                (adsbygoogle = window.adsbygoogle || []).push({});</script>
            <%--<div style="width:728px;height:90px;background-color:Red;"></div>--%>
        </div>
</asp:Content>
