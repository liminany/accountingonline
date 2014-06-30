<%@ Page Title="" Language="C#" MasterPageFile="~/m/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="m_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .thumb {
            padding: 3px;
            background-color: #fff;
            border: solid 1px #ccc;
            box-shadow: 0 0 3px rgba(30, 30, 30, 0.2);
        }

        .tr_AdsRows td {
            border-bottom: 1px solid #ccc;
        }

        .tr_AdsRows:hover {
            background-color: #e0f4ff !important;
        }

        .page_enabled, .page_disabled {
            display: inline-block;
            height: 35px;
            min-width: 24px;
            line-height: 36px;
            text-align: center;
            text-decoration: none;
            border: 1px solid #ccc;
        }

        .page_enabled {
            background-color: #eee;
            color: #000;
        }

        .page_disabled {
            background-color: #6C6C6C;
            color: #fff !important;
        }
    </style>
    <div id="wrapper">
        <script type="text/javascript">
            $(document).ready(function () {
                $(".cities").click(function () {
                    $(".selectCityContent").slideToggle("slow");
                });
                $("#fancybox-overlay").hide();

                $("#category-search-list").hide();
                $("#search-resultContent").hide();

                $("#postAdBlock").hide();
                $("#post_btn").click(function () {
                    $("#fancybox-overlay").show();
                    $("#postAdBlock").show("slow");
                    trackEvent('Post Link - Click', 'Header Left');
                });
                $(".cancel").click(function () {
                    $("#postAdBlock").hide("slow");
                    $("#fancybox-overlay").hide();
                });

            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#search_categories").click(function () {
                    $("#category-search-list").slideToggle("slow");
                });
                $("#search_categories_header").click(function () {
                    $("#category-search-list").slideToggle("slow");
                });
            });
        </script>


        <div id="fancybox-overlay"></div>
        <section>
            <div id="search-result">
                <div id="search-resultContent">
                    <div class="float-left subcategory-links"><a href="houses-flats-for-rent-c41.html">Houses & flats for rent</a></li></div>
                    <div style="clear: both;"></div>
                    <div class="float-left subcategory-links"><a href="houses-flats-for-sale-c40.html">Houses & flats for sale</a></li></div>
                    <div style="clear: both;"></div>
                    <div class="float-left subcategory-links"><a href="commercial-for-rent-c100.html">Commercial for rent</a></li></div>
                    <div style="clear: both;"></div>
                    <div class="float-left subcategory-links"><a href="commercial-for-sale-c44.html">Commercial for sale</a></li></div>
                    <div style="clear: both;"></div>
                    <div class="float-left subcategory-links"><a href="land-plots-c99.html">Land & plots</a></li></div>
                    <div style="clear: both;"></div>
                    <div class="float-left subcategory-links"><a href="pg-accommodation-c43.html">PG accommodation</a></li></div>
                    <div style="clear: both;"></div>
                    <div class="float-left subcategory-links"><a href="shared-rooms-for-rent-c42.html">Shared rooms for rent</a></li></div>
                    <div style="clear: both;"></div>
                    <div class="float-left subcategory-links"><a href="real-estate-agents-c96.html">Real estate agents</a></li></div>
                    <div style="clear: both;"></div>
                </div>
            </div>
            <div id="container">
                <div class="classifieds-home-block" id="classifieds-listview">
                    <asp:Repeater runat="server" ID="rptSlimlerAds">
                        <ItemTemplate>
                            <a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">
                                <div class="cols" style="cursor:pointer;" id="post_<%# DataBinder.Eval(Container.DataItem, "AdsID")%>" onclick="window.location='<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>'">
                                    <div class="image float-left-padright">
                                        <a onclick="window.location='<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>'">
                                            <img style="width: 100px; height: 103px;" src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>' alt="<%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>" border="0" /></a>
                                    </div>
                                    <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                                        <h2 style="margin-bottom: 1px;"><%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></h2>
                                        <div class="classifieds-subtitle" style="float: left;"><a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">
                                                              <%# DataBinder.Eval(Container.DataItem, "CityName")%>                                                                             </a></div>
                                        <div style="float: right; padding-right: 5px;"><a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>" class="more_text">شاهد تفاصيل الإعلان...</a></div>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </a>
                            <div class="clear"></div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="seperator"></div>
            <div>
                <asp:Repeater ID="rptPager" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                            CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
                            OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>
    </div>


</asp:Content>

