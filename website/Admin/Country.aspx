<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="Country.aspx.cs" Inherits="Admin_AddCountry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function DeleteCountryInfo(CountryID) {
            var r = confirm("هل انت متأكد من حذف هذة البلد من النظام ؟")
            if (r == true) {
                DeleteCountryMethods(CountryID);
            }
        }
        function DeleteCountryMethods(CountryID) {
            PageMethods.DeleteCountryInfo(CountryID, OnDeleteCountrySucceeded, OnDeleteCountryFaild);
        }
        function OnDeleteCountrySucceeded(result) {
            if (result == "true") {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
                $("#message-green").css("display", "");
                $("#message_4").html("تم حذف البلد بنجاح");
            }
            else {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
                $("#message-green").css("display", "");
                $("#message_4").html("تم حذف البلد بنجاح");
            }
        }
        function OnDeleteCountryFaild(result) {
            alert("هناك خطأ في حذف البلد الرجاء مراجعة الدعم الفني");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-table-inner" dir="rtl">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td>
                        <!--  start content-table-inner ...................................................................... START -->
                        <div id="Div1">
                            <!--  start table-content  -->
                            <div id="table-content">
                                <input type="button" value="إضافة بلد جديدة" class="btnClass" style="width: 150px;"
                                    onclick="window.location='AddEditCountry'" />
                                <div style="height: 20px; clear: both;">
                                </div>
                                <!--  start product-table ..................................................................................... -->
                                <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                                    <asp:Repeater runat="server" ID="rptManageCountry">
                                        <HeaderTemplate>
                                            <th class="table-header-repeat line-left" align="center">
                                                <a href="" style="display: block;">رقم البلد</a>
                                            </th>
                                            <th class="table-header-repeat line-left minwidth-1">
                                                <a href="">إسم البلد</a>
                                            </th>
                                            <th class="table-header-repeat line-left">
                                                <a href="">حالة البلد</a>
                                            </th>
                                            <th align="center" class="table-header-repeat line-left">
                                                <a href="">تاريخ الإنشاء</a>
                                            </th>
                                            <th class="table-header-options line-left">
                                                <a href="">خيارات</a>
                                            </th>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CountryID")%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CountryName")%>
                                                </td>
                                                <td align="center">
                                                    <%# CheckCountryStatus(DataBinder.Eval(Container.DataItem, "CountryStatus").ToString())%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CountryCreateDate")%>
                                                </td>
                                                <td class="options-width" align="center">
                                                    <a href='AddEditCountry?CountryID=<%# DataBinder.Eval(Container.DataItem,"CountryID") %>'
                                                        title="Edit" class="icon-1 info-tooltip"></a><a href='javascript:void(0)' onclick="DeleteCountryInfo(<%# DataBinder.Eval(Container.DataItem,"CountryID") %>)"
                                                            title="Delete" class="icon-2 info-tooltip"></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <tr class="alternate-row">
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CountryID")%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CountryName")%>
                                                </td>
                                                <td align="center">
                                                    <%# CheckCountryStatus(DataBinder.Eval(Container.DataItem, "CountryStatus").ToString())%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CountryCreateDate")%>
                                                </td>
                                                <td class="options-width" align="center">
                                                    <a href='AddEditCountry?CountryID=<%# DataBinder.Eval(Container.DataItem,"CountryID") %>'
                                                        title="Edit" class="icon-1 info-tooltip"></a><a href='javascript:void(0)' onclick="DeleteCountryInfo(<%# DataBinder.Eval(Container.DataItem,"CountryID") %>)"
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
                </tr>
                <tr>
                    <td>
                        <img src="../img/shared/blank.gif" width="695" height="1" alt="ArabiSky.com">
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="clear">
        </div>
    </div>
    <asp:Button ID="lbtnRefreshGV" CssClass="ClassHideDiv" runat="server" Text="" Height="0px"
        Width="0px" Style="visibility: hidden" OnClick="lbtnRefreshGV_Click"></asp:Button>
</asp:Content>
