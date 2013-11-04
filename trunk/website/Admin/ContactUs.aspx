<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Admin_ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function ContactUsAction(value) {
            var r = confirm("Are you sure you want Delete this message?")
            if (r == true) {
                ActionContactUsMethods(value);
            } 
        }
        function ActionContactUsMethods(value) {
            PageMethods.DeleteContactUs(value ,OnDeleteContactUsMethodsSucceeded, OnContactUsMethodsFaild);
        }
        function OnDeleteContactUsMethodsSucceeded(result) {
            if (result == "true") {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
                $("#message-green").css("display", "");
                $("#message_4").html("successfully");
            }
            else {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
                $("#message-green").css("display", "");
                $("#message_4").html("successfully");
            }
        }
        function OnContactUsMethodsFaild(result) {
            alert("Error");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td id="tbl-border-left">
            </td>
            <td>
                <!--  start content-table-inner ...................................................................... START -->
                <div id="content-table-inner">
                    <!--  start table-content  -->
                    <div id="table-content">
                        <div style="height: 20px; clear: both;">
                        </div>
                        <!--  start product-table ..................................................................................... -->
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                            <asp:Repeater runat="server" ID="rptManageContactUs">
                                <HeaderTemplate>
                                    <th align="center" class="table-header-repeat line-left">
                                        <a href="">Comments ID</a>
                                    </th>
                                    <th class="table-header-repeat line-left minwidth-1">
                                        <a href="">User FullName</a>
                                    </th>
                                    <th class="table-header-repeat line-left">
                                        <a href="">User Email Address</a>
                                    </th>
                                    <th align="center" class="table-header-repeat line-left">
                                        <a href="">Create Date</a>
                                    </th>
                                    <th class="table-header-options line-left">
                                        <a href="">Options</a>
                                    </th>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "Contact_ID")%>
                                        </td>
                                        <td>
                                            <%# DataBinder.Eval(Container.DataItem, "Contact_UserName")%>
                                        </td>
                                        <td>
                                            <%# DataBinder.Eval(Container.DataItem, "Contact_EmailAddress")%>
                                        </td>
                                        <td>
                                            <%# DataBinder.Eval(Container.DataItem, "Contact_CreateDate")%>
                                        </td>
                                        <td class="options-width">
                                            <a href='javascript:void(0)' onclick="ContactUsAction(<%# DataBinder.Eval(Container.DataItem,"Contact_ID") %>)"
                                                title="Delete" style="margin-right: 28px;" class="icon-2 info-tooltip"></a>
                                            <a href='javascript:void(0)' onclick="alert('<%# DataBinder.Eval(Container.DataItem,"Contact_Message") %>')"
                                                title="View" class="icon-3 info-tooltip"></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr class="alternate-row">
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "Contact_ID")%>
                                        </td>
                                        <td>
                                            <%# DataBinder.Eval(Container.DataItem, "Contact_UserName")%>
                                        </td>
                                        <td>
                                            <%# DataBinder.Eval(Container.DataItem, "Contact_EmailAddress")%>
                                        </td>
                                        <td>
                                            <%# DataBinder.Eval(Container.DataItem, "Contact_CreateDate")%>
                                        </td>
                                        <td class="options-width">
                                              <a href='javascript:void(0)' onclick="ContactUsAction(<%# DataBinder.Eval(Container.DataItem,"Contact_ID") %>)"
                                                title="Delete" style="margin-right: 28px;" class="icon-2 info-tooltip"></a>
                                            <a href='javascript:void(0)' onclick="alert('<%# DataBinder.Eval(Container.DataItem,"Contact_Message") %>')"
                                                title="View" class="icon-3 info-tooltip"></a>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
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
            <td id="tbl-border-right">
            </td>
        </tr>
    </table>
    <asp:Button ID="lbtnRefreshGV" CssClass="ClassHideDiv" runat="server" Text="" Height="0px"
        Width="0px" Style="visibility: hidden" OnClick="lbtnRefreshGV_Click"></asp:Button>
</asp:Content>
