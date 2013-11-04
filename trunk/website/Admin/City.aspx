<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="City.aspx.cs" Inherits="Admin_City" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function DeleteCityInfo(CityID) {
            var r = confirm("هل انت متأكد من حذف هذة البلد من النظام ؟")
            if (r == true) {
                DeleteCityMethods(CityID);
            }
        }
        function DeleteCityMethods(CityID) {
            PageMethods.DeleteCityInfo(CityID, OnDeleteCitySucceeded, OnDeleteCityFaild);
        }
        function OnDeleteCitySucceeded(result) {
            if (result == "true") {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
                $("#message-green").css("display", "");
                $("#message_4").html("تم حذف المدينة بنجاح");
            }
            else {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
                $("#message-green").css("display", "");
                $("#message_4").html("تم حذف المدينة بنجاح");
            }
        }
        function OnDeleteCityFaild(result) {
            alert("هناك خطأ في حذف المدينة الرجاء مراجعة الدعم الفني");
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
                                <input type="button" value="إضافة مدينة جديدة" class="btnClass" style="width: 150px;"
                                    onclick="window.location='AddEditCity'" />
                                <div style="height: 20px; clear: both;">
                                </div>
                                <!--  start product-table ..................................................................................... -->
                                <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                                    <asp:Repeater runat="server" ID="rptManageCity">
                                        <HeaderTemplate>
                                            <th class="table-header-repeat line-left" align="center">
                                                <a href="" style="display: block;">رقم المدينة</a>
                                            </th>
                                            <th class="table-header-repeat line-left minwidth-1">
                                                <a href="">إسم المدينة</a>
                                            </th>
                                            <th class="table-header-repeat line-left minwidth-1">
                                                <a href="">إسم البلد</a>
                                            </th>
                                            <th class="table-header-repeat line-left">
                                                <a href="">حالة المدينة</a>
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
                                                    <%# DataBinder.Eval(Container.DataItem, "CityID")%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CountryName")%>
                                                </td>
                                                <td align="center">
                                                    <%# CheckCountryStatus(DataBinder.Eval(Container.DataItem, "CityStatus").ToString())%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CityCreateDate")%>
                                                </td>
                                                <td class="options-width" align="center">
                                                    <a href='AddEditCity?CityID=<%# DataBinder.Eval(Container.DataItem,"CityID") %>'
                                                        title="Edit" class="icon-1 info-tooltip"></a><a href='javascript:void(0)' onclick="DeleteCityInfo(<%# DataBinder.Eval(Container.DataItem,"CityID") %>)"
                                                            title="Delete" class="icon-2 info-tooltip"></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <tr class="alternate-row">
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CityID")%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CountryName")%>
                                                </td>
                                                <td align="center">
                                                    <%# CheckCountryStatus(DataBinder.Eval(Container.DataItem, "CityStatus").ToString())%>
                                                </td>
                                                <td align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "CityCreateDate")%>
                                                </td>
                                                <td class="options-width" align="center">
                                                    <a href='AddEditCity?CityID=<%# DataBinder.Eval(Container.DataItem,"CityID") %>'
                                                        title="Edit" class="icon-1 info-tooltip"></a><a href='javascript:void(0)' onclick="DeleteCityInfo(<%# DataBinder.Eval(Container.DataItem,"CityID") %>)"
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
                        <img src="../img/shared/blank.gif" width="695" height="1" alt="blank">
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
