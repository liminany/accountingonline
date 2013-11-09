<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="AddEditAdmin.aspx.cs" Inherits="Admin_AddEditAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                                    <th>
                                        &nbsp;
                                    </th>
                                    <td valign="top">
                                        <asp:Button ID="btnSubmit" class="btnClass" runat="server" Text="Submit" Width="124"
                                            OnClick="btnSubmit_Click" />
                                        <input type="button" id="btnClose" class="btnClass" value="Exit" style="width: 124px;"
                                            onclick="window.location='Dashboard'" />
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
