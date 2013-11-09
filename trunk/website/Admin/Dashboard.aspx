<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="Dashboard.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var ArrayOfData = document.getElementById("ctl00_ContentPlaceHolder1_hfCatCount").value;
            var array = ArrayOfData.split("|");
            var data = google.visualization.arrayToDataTable([
                      ['Task', 'Hours per Day'],
                      ['للبيع', parseInt(array[0])],
                      ['الخدمات', parseInt(array[1])],
                      ['وظائف شاغرة', parseInt(array[2])],
                      ['للإيجار', parseInt(array[3])],
                      ['الباحثين عن عمل', parseInt(array[4])]
                    ]);
            var options = {
                title: 'My Daily Activities'
            };
            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        }
    </script>
    <script type="text/javascript">
        function DeleteAdminInfo(AdminID) {
            var r = confirm("هل انت متأكد من حذف هذة المدير من النظام ؟")
            if (r == true) {
                DeleteAdminMethods(AdminID);
            }
        }
        function DeleteAdminMethods(AdminID) {
            PageMethods.DeleteAdminInfo(AdminID, OnDeleteAdminSucceeded, OnDeleteAdminFaild);
        }
        function OnDeleteAdminSucceeded(result) {
            if (result == "true") {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
                $("#message-green").css("display", "");
                $("#message_4").html("تم حذف المدير بنجاح");
            }
            else {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
                $("#message-green").css("display", "");
                $("#message_4").html("تم حذف المدير بنجاح");
            }
        }
        function OnDeleteAdminFaild(result) {
            alert("هناك خطأ في حذف المدير الرجاء مراجعة الدعم الفني");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField runat="server" ID="hfCatCount" Value="0" />
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
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
            <asp:HiddenField ID="hfResetPoral" runat="server" Value="false" />
            <div id="content-table-inner">
                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                    <tbody id="tbDashbaord" runat="server">
                        <tr>
                            <td colspan="2" style="height: 20px; font-size: 20px;" align="center">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" style="line-height: 26px;">
                                    <tr>
                                        <td colspan="4" style="height: 20px;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="background-color: #addaf6; border: 1px solid #333;">
                                            <a href="ApprovedAds">
                                                <div>
                                                    الإعلانات المسجلة</div>
                                                <div>
                                                    <span id="sp_AdsRegister" runat="server"></span>
                                                </div>
                                            </a>
                                        </td>
                                        <td align="center" style="background-color: #addaf6; border: 1px solid #333;">
                                            <a href="PinddingAds">
                                                <div>
                                                    الإعلانات المنتظرة للقبول عليها</div>
                                                <div>
                                                    <span id="sp_AdsPennding" runat="server"></span>
                                                </div>
                                            </a>
                                        </td>
                                        <td align="center" style="background-color: #addaf6; border: 1px solid #333;">
                                            <div>
                                                عدد المستخدمين المسجلين</div>
                                            <div>
                                                <span id="sp_UserRegister" runat="server"></span>
                                            </div>
                                        </td>
                                        <td align="center" style="background-color: #addaf6; border: 1px solid #333;">
                                            <div>
                                                عدد المستخدمين الموقوفون</div>
                                            <div>
                                                <span id="sp_UserPennding" runat="server"></span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 20px;" align="right">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 20px;" align="center">
                                <div id="piechart" style="width: 900px; height: 500px;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 20px;" align="right">
                                &nbsp;
                            </td>
                        </tr>
                        <%-- <tr>
                            <td>
                                <div id="container_1" style="min-width: 310px; height: 400px; margin: 0 auto">
                                </div>
                            </td>
                            <td>
                                <div id="container_2" style="min-width: 310px; height: 400px; margin: 0 auto">
                                </div>
                            </td>
                        </tr>--%>
                        <tr>
                            <td colspan="2" style="height: 20px;" align="right">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td id="tbl-border-left">
                                        </td>
                                        <td>
                                            <!--  start content-table-inner ...................................................................... START -->
                                            <div id="Div1">
                                                <!--  start table-content  -->
                                                <div id="table-content">
                                                    <input type="button" value="إضافة مدير للنظام" style="width: 150px;" class="btnClass"
                                                        onclick="window.location='AddEditAdmin'" />
                                                    <div style="height: 20px; clear: both;">
                                                    </div>
                                                    <!--  start product-table ..................................................................................... -->
                                                    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                                                        <asp:Repeater runat="server" ID="rptManageUser">
                                                            <HeaderTemplate>
                                                                <th align="center" class="table-header-repeat line-left">
                                                                    <a href="">User ID</a>
                                                                </th>
                                                                <th class="table-header-repeat line-left minwidth-1">
                                                                    <a href="">Full Name</a>
                                                                </th>
                                                                <th class="table-header-repeat line-left">
                                                                    <a href="">Email Address</a>
                                                                </th>
                                                                <%--<th class="table-header-repeat line-left">
                                                            <a href="">User Permission</a>
                                                        </th>--%>
                                                                <th align="center" class="table-header-repeat line-left">
                                                                    <a href="">User Status</a>
                                                                </th>
                                                                <th class="table-header-repeat line-left">
                                                                    <a href="">Create Date</a>
                                                                </th>
                                                                <th class="table-header-options line-left">
                                                                    <a href="">Options</a>
                                                                </th>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td align="center">
                                                                        <%# DataBinder.Eval(Container.DataItem,"UserID") %>
                                                                    </td>
                                                                    <td>
                                                                        <%# DataBinder.Eval(Container.DataItem,"UserName") %>
                                                                    </td>
                                                                    <td>
                                                                        <a href='mailto:<%# DataBinder.Eval(Container.DataItem,"EmailAddress") %>'>
                                                                            <%# DataBinder.Eval(Container.DataItem,"EmailAddress") %></a>
                                                                    </td>
                                                                    <%--                                                            <td>
                                                                <%# GetUserPermission(DataBinder.Eval(Container.DataItem, "UserPermission").ToString())%>
                                                            </td>--%>
                                                                    <td align="center">
                                                                        <%# CheckUserStatus(DataBinder.Eval(Container.DataItem, "UserStatus").ToString())%>
                                                                    </td>
                                                                    <td>
                                                                        <%# DataBinder.Eval(Container.DataItem, "CreateDate")%>
                                                                    </td>
                                                                    <td class="options-width">
                                                                        <a href='AddEditAdmin?UserID=<%# DataBinder.Eval(Container.DataItem,"UserID") %>'
                                                                            title="Edit" class="icon-1 info-tooltip"></a><a href='javascript:void(0)' onclick="DeleteAdminInfo(<%# DataBinder.Eval(Container.DataItem,"UserID") %>)"
                                                                                title="Delete" class="icon-2 info-tooltip"></a>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                            <AlternatingItemTemplate>
                                                                <tr class="alternate-row">
                                                                    <td align="center">
                                                                        <%# DataBinder.Eval(Container.DataItem,"UserID") %>
                                                                    </td>
                                                                    <td>
                                                                        <%# DataBinder.Eval(Container.DataItem,"UserName") %>
                                                                    </td>
                                                                    <td>
                                                                        <a href='mailto:<%# DataBinder.Eval(Container.DataItem,"EmailAddress") %>'>
                                                                            <%# DataBinder.Eval(Container.DataItem,"EmailAddress") %></a>
                                                                    </td>
                                                                    <%--                                                            <td>
                                                                <%# GetUserPermission(DataBinder.Eval(Container.DataItem, "UserPermission").ToString())%>
                                                            </td>--%>
                                                                    <td align="center">
                                                                        <%# CheckUserStatus(DataBinder.Eval(Container.DataItem, "UserStatus").ToString())%>
                                                                    </td>
                                                                    <td>
                                                                        <%# DataBinder.Eval(Container.DataItem, "CreateDate")%>
                                                                    </td>
                                                                    <td class="options-width">
                                                                        <a href='AddEditAdmin?UserID=<%# DataBinder.Eval(Container.DataItem,"UserID") %>'
                                                                            title="Edit" class="icon-1 info-tooltip"></a><a href='javascript:void(0)' onclick="DeleteAdminInfo(<%# DataBinder.Eval(Container.DataItem,"UserID") %>)"
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
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <img src="../img/shared/blank.gif" width="695" height="1" alt="ArabiSky.com">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="clear">
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
