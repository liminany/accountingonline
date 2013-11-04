<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="Users.aspx.cs" Inherits="Admin_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function DeleteUser(userID) {
            $("#tblDeleteUser").css("display", "");
            var r = confirm("Are you sure you want delete this user?")
            if (r == true) {
                DeleteUserMethods(userID);
            }
            else {
            }
        }

        function DeleteUserMethods(userID) {
            PageMethods.DeleteUsersInfo(userID, OnDeleteUserSucceeded, OnDeleteUserFaild);
        }

        function OnDeleteUserSucceeded(result) {
            if (result == "true") {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
                $("#message-green").css("display", "");
                $("#message_4").html("Delete user successfully");
            }
            else {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
                $("#message-green").css("display", "");
                $("#message_4").html("Delete user successfully");
            }
        }
        function OnDeleteUserFaild(result) {
            alert("Error");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" language="javascript">
        var tID;
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            clearTimeout(tID);
        }

        function EndRequestHandler(sender, args) {

        }                                  
    </script>
    <table border="0" cellpadding="0" cellspacing="0" width="100%" dir="rtl">
        <tr>
            <td id="tbl-border-left">
            </td>
            <td>
                <!--  start content-table-inner ...................................................................... START -->
                <div id="content-table-inner">
                    <!--  start table-content  -->
                    <div id="table-content">
                        <input type="button" value="إضافة مستخدم جديد" style="width: 150px;" class="btnClass"
                            onclick="window.location='AddUsers'" />
                        <div style="height: 20px; clear: both;">
                        </div>
                        <!--  start product-table ..................................................................................... -->
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                            <asp:Repeater runat="server" ID="rptManageUser">
                                <HeaderTemplate> 
                                    <th class="table-header-repeat line-left minwidth-1" align="center">
                                        <a href="" style="font-size: 11px;">إسم المستخدم</a>
                                    </th>
                                    <th class="table-header-repeat line-left" align="center">
                                        <a href="" style="font-size: 11px;">البريد الإلكتروني</a>
                                    </th>
                                    <th class="table-header-repeat line-left" align="center">
                                        <a href="" style="font-size: 11px;">حالة المستخدم</a>
                                    </th>
                                    <th class="table-header-repeat line-left" align="center">
                                       <a href="" style="font-size: 11px;">عدد الاعلانات المسموح بها</a>
                                    </th>
                                    <th class="table-header-repeat line-left" align="center">
                                       <a href="" style="font-size: 11px;">عدد الإعلانات المستخدمة</a>
                                    </th>
                                    <th  class="table-header-repeat line-left" align="center">
                                        <a href="" style="font-size: 11px;">إسم البلد</a>
                                    </th>
                                    <th class="table-header-repeat line-left" align="center">
                                        <a href="" style="font-size: 11px;">تاريخ الإضافة</a>
                                    </th>
                                    <th class="table-header-options line-left" align="center">
                                        <a href="" style="font-size: 11px;">Options</a>
                                    </th>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr> 
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "User_FullName")%>
                                        </td>
                                        <td align="center">
                                            <a href='mailto:<%# DataBinder.Eval(Container.DataItem,"User_EmailAddress") %>'>
                                                <%# DataBinder.Eval(Container.DataItem, "User_EmailAddress")%></a>
                                        </td>
                                        <td align="center">
                                            <%# GetUserStatus(DataBinder.Eval(Container.DataItem, "User_Status").ToString())%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "User_CountAds") %>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "User_CountAdsUsed")%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "User_CountryRelated")%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "User_CreateDate")%>
                                        </td>
                                        <td class="options-width" align="center">
                                            <a href='AddUsers?UserID=<%# DataBinder.Eval(Container.DataItem,"UserID") %>'
                                                title="Edit" class="icon-1 info-tooltip"></a><a href='javascript:void(0)' onclick="DeleteUser(<%# DataBinder.Eval(Container.DataItem,"UserID") %>)"
                                                    title="Delete" class="icon-2 info-tooltip"></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr class="alternate-row">
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "User_FullName")%>
                                        </td>
                                        <td align="center">
                                            <a href='mailto:<%# DataBinder.Eval(Container.DataItem,"User_EmailAddress") %>'>
                                                <%# DataBinder.Eval(Container.DataItem, "User_EmailAddress")%></a>
                                        </td>
                                        <td align="center">
                                            <%# GetUserStatus(DataBinder.Eval(Container.DataItem, "User_Status").ToString())%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "User_CountAds") %>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "User_CountAdsUsed")%>
                                        </td>
                                       <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "User_CountryRelated")%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "User_CreateDate")%>
                                        </td>
                                        <td class="options-width" align="center">
                                             <a href='AddUsers?UserID=<%# DataBinder.Eval(Container.DataItem,"UserID") %>'
                                                title="Edit" class="icon-1 info-tooltip"></a><a href='javascript:void(0)' onclick="DeleteUser(<%# DataBinder.Eval(Container.DataItem,"UserID") %>)"
                                                    title="Delete" class="icon-2 info-tooltip"></a>
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
        <asp:Button ID="lbtnRefreshGV" CssClass="ClassHideDiv" runat="server" Text="" Height="0px"
            Width="0px" Style="visibility: hidden" OnClick="lbtnRefreshGV_Click"></asp:Button>
    </table>
</asp:Content>
