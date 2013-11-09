<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="AddUsers.aspx.cs" Inherits="Admin_AddUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server"> 
    <asp:HiddenField runat="server" ID="hfCountry" />
    <asp:HiddenField runat="server" ID="hfCity" />
    <div id="content-table-inner" dir="rtl">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tbody>
                <tr valign="top">
                    <td>
                        <!-- start id-form -->
                        <table border="0" cellpadding="0" cellspacing="0" id="id-form">
                            <tbody>
                                <tr>
                                    <th valign="top" style="text-align: right;">
                                        إسم المستخدم:
                                    </th>
                                    <td>
                                        <asp:TextBox ID="txtUserFullName" Style="width: 236px" class="inp-form" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <th valign="top" style="text-align: right;">
                                        البريد الإلكتروني:
                                    </th>
                                    <td>
                                        <asp:TextBox ID="txtEmailAddress" Style="width: 236px" class="inp-form" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr id="tr_Password" runat="server">
                                    <th valign="top" style="text-align: right;">
                                        كلمة المرور:
                                    </th>
                                    <td>
                                        <asp:TextBox ID="txtPassword" Style="width: 236px" class="inp-form" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr id="tr_FacebookID" runat="server">
                                    <th valign="top" style="text-align: right;">
                                        رقم حساب الفيسبوك:
                                    </th>
                                    <td>
                                        <asp:TextBox ID="txtFacebookID" Style="width: 236px" class="inp-form" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <th valign="top" style="text-align: right;">
                                        حالة المستخدم:
                                    </th>
                                    <td>
                                        <asp:DropDownList ID="ddlUserStatus" runat="server" class="styledselect-year" Style="width: 250px;">
                                            <asp:ListItem Text="إيقاف" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="تفعيل" Value="1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <th valign="top" style="text-align: right;">
                                        نوع المستخدم:
                                    </th>
                                    <td>
                                        <asp:DropDownList ID="ddlUserType" runat="server" class="styledselect-year" Style="width: 250px;">
                                            <asp:ListItem Text="مستخدم عادي" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="مستخدم كامل" Value="1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <th valign="top" style="text-align: right;">
                                        عدد الإعلانات المسموح بها:
                                    </th>
                                    <td>
                                        <asp:DropDownList ID="ddlAdsCount" runat="server" class="styledselect-year" Style="width: 250px;">
                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                            <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                            <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                            <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                            <asp:ListItem Text="60" Value="60"></asp:ListItem>
                                            <asp:ListItem Text="70" Value="70"></asp:ListItem>
                                            <asp:ListItem Text="80" Value="80"></asp:ListItem>
                                            <asp:ListItem Text="90" Value="90"></asp:ListItem>
                                            <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr id="tr_Country" runat="server">
                                    <th valign="top" style="text-align: right;">
                                        إسم البلد:
                                    </th>
                                    <td>
                                        <asp:DropDownList ID="ddlCountryName" runat="server" class="styledselect-year" Style="width: 250px;"
                                            AutoPostBack="True" OnSelectedIndexChanged="ddlCountryName_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr id="tr_City" runat="server">
                                    <th valign="top" style="text-align: right;">
                                        إسم المدينة:
                                    </th>
                                    <td>
                                        <asp:DropDownList ID="ddlCityName" runat="server" class="styledselect-year" Style="width: 250px;">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <th valign="top" style="text-align: right;">
                                        رقم الهاتف المحمول :
                                    </th>
                                    <td>
                                        <asp:TextBox ID="txtMobileNumber" Style="width: 236px" class="inp-form" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        &nbsp;
                                    </th>
                                    <td valign="top">
                                        <asp:Button ID="btnSubmit" class="btnClass" runat="server" Text="Submit" Width="124"
                                            OnClick="btnSubmit_Click" />
                                        <input type="button" id="btnClose" class="btnClass" value="Exit" style="width: 124px;"
                                            onclick="window.location='Users'" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        &nbsp;
                                    </th>
                                    <td valign="top" id="tr_UserMessage" runat="server">
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- end id-form  -->
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="../img/shared/blank.gif" width="695" height="1" alt="blank" alt="ArabiSky.com">
                    </td>
                    <td>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="clear">
        </div>
    </div>
</asp:Content>
