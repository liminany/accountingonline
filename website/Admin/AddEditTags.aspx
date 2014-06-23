<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="AddEditTags.aspx.cs" Inherits="Admin_AddEditTags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-table-inner">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" id="id-form" dir="rtl">
            <tbody>
                <tr>
                    <th valign="top" style="text-align: right;">
                        إسم الوسم :
                    </th>
                    <td>
                        <asp:TextBox ID="txtTagName" Style="width: 500px" class="inp-form" runat="server"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <th valign="top" style="text-align: right;">
                        رابط الوسم :
                    </th>
                    <td>
                        <asp:TextBox ID="txtTagURL" Style="width: 500px" class="inp-form" runat="server"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <th valign="top" style="text-align: right;">
                       إسم القسم الفرعي:
                    </th>
                    <td>
                        <asp:DropDownList ID="ddlSubCategoryName" runat="server" class="styledselect-year" Style="width: 250px;">
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
                            onclick="window.location='SubCategories'" />
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
                <tr style="height: 100px;">
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
