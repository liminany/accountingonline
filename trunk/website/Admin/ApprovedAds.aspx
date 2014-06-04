<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="ApprovedAds.aspx.cs" Inherits="Admin_ApprovedAds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                        <div style="height: 20px; clear: both;">
                        </div>
                        <!--  start product-table ..................................................................................... -->
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                            <asp:Repeater runat="server" ID="rptPenddingAds">
                                <HeaderTemplate>
                                    <th class="table-header-repeat line-left" align="center">
                                        <a href="" style="font-size: 11px;">إسم المستخدم</a>
                                    </th>
                                    <th class="table-header-repeat line-left" align="center">
                                        <a href="" style="font-size: 11px;">القسم</a>
                                    </th>
                                    <th class="table-header-repeat line-left" align="center">
                                        <a href="" style="font-size: 11px;">القسم الفرعي</a>
                                    </th>
                                    <th class="table-header-repeat line-left" align="center">
                                        <a href="" style="font-size: 11px;">البلد</a>
                                    </th>
                                    <th class="table-header-repeat line-left" align="center">
                                        <a href="" style="font-size: 11px;">المدينة</a>
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
                                            <%# DataBinder.Eval(Container.DataItem, "CatName").ToString()%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "CountryName")%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "AdsCreateDate")%>
                                        </td>
                                        <td class="options-width" align="center">
                                            <a href='/admin/SeeAds?AdsID=<%# DataBinder.Eval(Container.DataItem,"AdsID") %>' title="View Ads"
                                                class="icon-1 info-tooltip"></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr class="alternate-row">
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "User_FullName")%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "CatName").ToString()%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "CountryName")%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                        </td>
                                        <td align="center">
                                            <%# DataBinder.Eval(Container.DataItem, "AdsCreateDate")%>
                                        </td>
                                        <td class="options-width" align="center">
                                            <a href='/admin/SeeAds?AdsID=<%# DataBinder.Eval(Container.DataItem,"AdsID") %>' title="View Ads"
                                                class="icon-1 info-tooltip"></a>
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
</asp:Content>
