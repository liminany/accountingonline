﻿<%@ Page Title="" Language="C#" MasterPageFile="~/m/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="m_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                            <div class="cols" id="post_2793631">
                                <div class="image float-left-padright">
                                    <a onclick="window.location='<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>'">
                                        <img style="width:100px;height:103px;" src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>' alt="" border="0" /></a>
                                </div>
                                <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                                    <h2 style="margin-bottom: 1px;"><%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></h2>
                                    <div class="classifieds-subtitle">
                                        <a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>"><span class="price_text">Rs. 25,000</span><br />
                                        <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>
                                    </div>
                                    <div class="classifieds-subtitle" style="float: left;"><a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">Offer</a></div>
                                    <div style="float: right; padding-right: 5px;"><a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>" class="more_text">More details...</a></div>
                                    <div class="clear"></div>
                                </div>
                            </div>
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

