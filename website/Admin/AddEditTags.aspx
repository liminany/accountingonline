<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="AddEditTags.aspx.cs" Inherits="Admin_AddEditTags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-table-inner">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" id="id-form" dir="rtl">
            <tbody>
                <tr>
                    <th valign="top" style="text-align: right;">إسم الوسم :
                    </th>
                    <td>
                        <asp:TextBox ID="txtTagName" Style="width: 500px" class="inp-form" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th valign="top" style="text-align: right;">رابط الوسم :
                    </th>
                    <td>
                        <asp:TextBox ID="txtTagURL" Style="width: 500px" class="inp-form" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th valign="top" style="text-align: right;">إسم القسم الفرعي:
                    </th>
                    <td>
                        <asp:DropDownList ID="ddlSubCategoryName" runat="server" class="styledselect-year" Style="width: 250px;">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="ddlSubCategoryName" InitialValue="-2" ID="RequiredFieldValidator1" runat="server" ErrorMessage="please choose sub cat"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <th>&nbsp;
                    </th>
                    <td valign="top">
                        <asp:Button ID="btnSubmit" class="btnClass" runat="server" Text="Submit" Width="124"
                            OnClick="btnSubmit_Click" />
                        <input type="button" id="btnClose" class="btnClass" value="Exit" style="width: 124px;"
                            onclick="window.location = 'SubCategories'" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th>&nbsp;
                    </th>
                    <td valign="top" id="tr_UserMessage" runat="server"></td>
                    <td>&nbsp;
                    </td>
                </tr>
                <tr style="height: 100px;">
                    <th>&nbsp;
                    </th>
                    <td>
                        <!--  start content-table-inner ...................................................................... START -->
                        <div id="Div1">
                            <!--  start table-content  -->
                            <div id="table-content">
                                <input type="button" value="إضافة مدينة جديدة" class="btnClass" style="width: 150px;"
                                    onclick="window.location = 'AddEditCity'" />
                                <div style="height: 20px; clear: both;">
                                </div>
                                <!--  start product-table ..................................................................................... -->
                                <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                                    <asp:Repeater runat="server" ID="rptManageTags">
                                        <HeaderTemplate>
                                            <th class="table-header-repeat line-left" align="center">
                                                <a href="" style="display: block;">الرقم المتسلسل</a>
                                            </th>
                                            <th class="table-header-repeat line-left minwidth-1">
                                                <a href="">اسم الوسم</a>
                                            </th> 
                                            <th class="table-header-repeat line-left">
                                                <a href="">القسم</a>
                                            </th>
                                            <th align="center" class="table-header-repeat line-left">
                                                <a href="">الحالة</a>
                                            </th>
                                            <th class="table-header-options line-left">
                                                <a href="">خيارات</a>
                                            </th>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "ID")%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "TagText")%>
                                                </td>
 
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "subCategories")%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "Status")%>
                                                </td>
                                                <td class="options-width" align="center">
                                                    <a href='AddEditTags?TagsID=<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                        title="Edit" class="icon-1 info-tooltip"></a><a href='javascript:void(0)' onclick="DeleteCityInfo(<%# DataBinder.Eval(Container.DataItem,"ID") %>)"
                                                            title="Delete" class="icon-2 info-tooltip"></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                                <!--  end product-table................................... -->
                            </div>
                            <!--  end content-table  -->
                            <div class="clear">
                            </div>
                        </div>
                        <!--  end content-table-inner ............................................END  -->
                    </td>
                    <td>&nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
