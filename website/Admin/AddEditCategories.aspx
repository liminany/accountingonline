﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="AddEditCategories.aspx.cs" Inherits="Admin_AddEditCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-table-inner">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" id="id-form" dir="rtl">
            <tbody>
                <tr>
                    <th valign="top" style="text-align: right;">
                        إسم الصنف :
                    </th>
                    <td>
                        <asp:TextBox ID="txtCategoriesName" Style="width: 236px" class="inp-form" runat="server"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <th valign="top" style="text-align: right;">
                        حالة الصنف :
                    </th>
                    <td>
                        <asp:DropDownList ID="ddlCategoriesStatus" runat="server" class="styledselect-year" Style="width: 250px;">
                            <asp:ListItem Text="موقوفة" Value="0"></asp:ListItem>
                            <asp:ListItem Text="فعالة" Value="1"></asp:ListItem>
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
                            onclick="window.location='Categories'" />
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
                <tr style="height:100px;">
                    <th>
                        &nbsp;
                    </th>
                    <td>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
