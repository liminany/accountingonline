<%@ Page Title="" Language="C#" MasterPageFile="~/m/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="m_Category" %>

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
                    <div class="cols" id="post_2793631">
                        <div class="image float-left-padright"><a href="rent-1-2-3-4-bedrooms-furnished-unfurnished-flats-in-kolkata-c41-v2793631.html">
                            <img src="../img.click.in/thumbnails/100x100x50/41/27_10_2011_22_22_8227_Kolkata_GH_1_1_.jpg" alt="" border="0" /></a> </div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Houses & flats for rent</h2>
                            <div class="classifieds-subtitle"><a href="rent-1-2-3-4-bedrooms-furnished-unfurnished-flats-in-kolkata-c41-v2793631.html"><span class="price_text">Rs. 25,000</span><br />
                                2 bedrooms flat<br />
                                New alipur<br />
                                900 Sq. Feet</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="rent-1-2-3-4-bedrooms-furnished-unfurnished-flats-in-kolkata-c41-v2793631.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="rent-1-2-3-4-bedrooms-furnished-unfurnished-flats-in-kolkata-c41-v2793631.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="cols" id="post_8854121">
                        <div align="center" class="image float-left-padright no-image-bg"><a href="3-bhk-921-sq-ft-flat-for-rent-in-kaikhali-vip-road-c41-v8854121.html">
                            <img src="../imgwap.click.in/images/noimage-39-big.1342615996.png" border="0" alt="" style="padding-top: 15px;" height="80" width="80" /></a></div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Houses & flats for rent</h2>
                            <div class="classifieds-subtitle"><a href="3-bhk-921-sq-ft-flat-for-rent-in-kaikhali-vip-road-c41-v8854121.html"><span class="price_text">Rs. 12,000</span><br />
                                3 bedrooms apartment<br />
                                Kaikhali<br />
                                921 Sq. Feet</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="3-bhk-921-sq-ft-flat-for-rent-in-kaikhali-vip-road-c41-v8854121.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="3-bhk-921-sq-ft-flat-for-rent-in-kaikhali-vip-road-c41-v8854121.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="cols" id="post_8435140">
                        <div class="image float-left-padright"><a href="2-bhk-flat-in-shreshta-garden-chinar-park-kolkata-c41-v8435140.html">
                            <img src="http://img.click.in/thumbnails/100x100x50/41/1_5_2014_22_52_52_va3hjq4s10qsmkrket96nggul1_pg9li9k9tg.jpeg" alt="" border="0" /></a> </div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Houses & flats for rent</h2>
                            <div class="classifieds-subtitle"><a href="2-bhk-flat-in-shreshta-garden-chinar-park-kolkata-c41-v8435140.html"><span class="price_text">Rs. 12,000</span><br />
                                2 bedrooms flat<br />
                                Rajarhat<br />
                                900 Sq. Feet</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="2-bhk-flat-in-shreshta-garden-chinar-park-kolkata-c41-v8435140.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="2-bhk-flat-in-shreshta-garden-chinar-park-kolkata-c41-v8435140.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="cols" id="post_7901587">
                        <div class="image float-left-padright"><a href="4-bhk-semi-furnished-flat-for-rent-in-new-alipore-kolkata-c41-v7901587.html">
                            <img src="../img.click.in/thumbnails/100x100x50/41/8_3_2014_15_25_34_bpa4vk3bkgnslqe5pevt96tp26_srdn1cv8l3.jpg" alt="" border="0" /></a> </div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Houses & flats for rent</h2>
                            <div class="classifieds-subtitle"><a href="4-bhk-semi-furnished-flat-for-rent-in-new-alipore-kolkata-c41-v7901587.html"><span class="price_text">Rs. 60,000</span><br />
                                4 bedrooms flat<br />
                                New alipur<br />
                                2200 Sq. Feet</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="4-bhk-semi-furnished-flat-for-rent-in-new-alipore-kolkata-c41-v7901587.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="4-bhk-semi-furnished-flat-for-rent-in-new-alipore-kolkata-c41-v7901587.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="cols" id="post_7845634">
                        <div class="image float-left-padright"><a href="3-bhk-furnished-flat-for-vacational-rental-in-new-alipore-c41-v7845634.html">
                            <img src="../img.click.in/thumbnails/100x100x50/41/3_3_2014_14_18_45_on52j1qvvd6lqrqophpvbrpv92_1elkr5fx9z.jpg" alt="" border="0" /></a> </div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Houses & flats for rent</h2>
                            <div class="classifieds-subtitle"><a href="3-bhk-furnished-flat-for-vacational-rental-in-new-alipore-c41-v7845634.html"><span class="price_text">Rs. 35,000</span><br />
                                3 bedrooms flat<br />
                                Tollygunge<br />
                                1400 Sq. Feet</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="3-bhk-furnished-flat-for-vacational-rental-in-new-alipore-c41-v7845634.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="3-bhk-furnished-flat-for-vacational-rental-in-new-alipore-c41-v7845634.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="cols" id="post_7323236">
                        <div class="image float-left-padright"><a href="flat-for-sale-at-golf-green-c40-v7323236.html">
                            <img src="../img.click.in/thumbnails/100x100x50/40/9_1_2014_00_43_36_btqpf7gd5t341044outks33475_8zgktwcz8.jpg" alt="" border="0" /></a> </div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Houses & flats for sale</h2>
                            <div class="classifieds-subtitle"><a href="flat-for-sale-at-golf-green-c40-v7323236.html"><span class="price_text">Rs. 52 Lacs</span><br />
                                3 bedrooms flat<br />
                                Golf Green<br />
                                1334 Sq. Feet</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="flat-for-sale-at-golf-green-c40-v7323236.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="flat-for-sale-at-golf-green-c40-v7323236.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="cols" id="post_7293580">
                        <div align="center" class="image float-left-padright no-image-bg"><a href="4-bhk-flat-for-rent-on-ashok-road-alipore-c41-v7293580.html">
                            <img src="../imgwap.click.in/images/noimage-39-big.1342615996.png" border="0" alt="" style="padding-top: 15px;" height="80" width="80" /></a></div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Houses & flats for rent</h2>
                            <div class="classifieds-subtitle"><a href="4-bhk-flat-for-rent-on-ashok-road-alipore-c41-v7293580.html"><span class="price_text">Rs. 2.5 Lacs</span><br />
                                4 bedrooms flat<br />
                                Alipur<br />
                                3200 Sq. Feet</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="4-bhk-flat-for-rent-on-ashok-road-alipore-c41-v7293580.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="4-bhk-flat-for-rent-on-ashok-road-alipore-c41-v7293580.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="cols" id="post_7283266">
                        <div align="center" class="image float-left-padright no-image-bg"><a href="2-2-bedroom-flats-joined-together-opposite-santoshpur-lake-c40-v7283266.html">
                            <img src="../imgwap.click.in/images/noimage-39-big.1342615996.png" border="0" alt="" style="padding-top: 15px;" height="80" width="80" /></a></div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Houses & flats for sale</h2>
                            <div class="classifieds-subtitle"><a href="2-2-bedroom-flats-joined-together-opposite-santoshpur-lake-c40-v7283266.html"><span class="price_text">Rs. 24 Lacs</span><br />
                                2 bedrooms flat<br />
                                Santoshpur<br />
                                700 Sq. Feet</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="2-2-bedroom-flats-joined-together-opposite-santoshpur-lake-c40-v7283266.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="2-2-bedroom-flats-joined-together-opposite-santoshpur-lake-c40-v7283266.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="cols" id="post_8808165">
                        <div class="image float-left-padright"><a href="realty-solutions-offers-3bhk-flat-for-rent-in-tollygunge-c41-v8808165.html">
                            <img src="../img.click.in/thumbnails/100x100x50/41/18_6_2014_11_50_25_n33bcmglv4kravu3fcuc8vcvr3_tfvs8wqcsx.jpg" alt="" border="0" /></a> </div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Houses & flats for rent</h2>
                            <div class="classifieds-subtitle"><a href="realty-solutions-offers-3bhk-flat-for-rent-in-tollygunge-c41-v8808165.html"><span class="price_text">Rs. 18,000</span><br />
                                3 bedrooms apartment<br />
                                Tollygunge<br />
                                1310 Sq. Feet</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="realty-solutions-offers-3bhk-flat-for-rent-in-tollygunge-c41-v8808165.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="realty-solutions-offers-3bhk-flat-for-rent-in-tollygunge-c41-v8808165.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="cols" id="post_7847547">
                        <div class="image float-left-padright"><a href="furnished-flat-on-sharing-basis-in-tollygunge-phari-area-c42-v7847547.html">
                            <img src="../img.click.in/thumbnails/100x100x50/42/3_3_2014_16_50_24_9v5bclip55q8t6t2hj3ap7ge60_hby8nxzc3w.jpg" alt="" border="0" /></a> </div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Shared rooms for rent</h2>
                            <div class="classifieds-subtitle"><a href="furnished-flat-on-sharing-basis-in-tollygunge-phari-area-c42-v7847547.html"><span class="price_text">Rs. 15,000</span><br />
                                Tollygunge</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="furnished-flat-on-sharing-basis-in-tollygunge-phari-area-c42-v7847547.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="furnished-flat-on-sharing-basis-in-tollygunge-phari-area-c42-v7847547.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="cols" id="post_8804015">
                        <div class="image float-left-padright"><a href="offers-1154-sq-ft-flat-for-rent-at-behala-c41-v8804015.html">
                            <img src="../img.click.in/thumbnails/100x100x50/41/17_6_2014_18_13_23_9vnkb65tj7ltc5seftncict4k0_4cexs4kwoc.jpg" alt="" border="0" /></a> </div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Houses & flats for rent</h2>
                            <div class="classifieds-subtitle"><a href="offers-1154-sq-ft-flat-for-rent-at-behala-c41-v8804015.html"><span class="price_text">Rs. 16,000</span><br />
                                3 bedrooms apartment<br />
                                Behala<br />
                                1154 Sq. Feet</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="offers-1154-sq-ft-flat-for-rent-at-behala-c41-v8804015.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="offers-1154-sq-ft-flat-for-rent-at-behala-c41-v8804015.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="cols" id="post_8795112">
                        <div class="image float-left-padright"><a href="offers-2bhk-flat-for-rent-in-new-alipore-c41-v8795112.html">
                            <img src="../img.click.in/thumbnails/100x100x50/41/16_6_2014_17_39_12_c9b4n1iuhd13klipr0krke5j47_8qi4gufhve.jpg" alt="" border="0" /></a> </div>
                        <div class="classifieds-home-list" style="margin-left: 105px; height: auto;">
                            <h2 style="margin-bottom: 1px;">Houses & flats for rent</h2>
                            <div class="classifieds-subtitle"><a href="offers-2bhk-flat-for-rent-in-new-alipore-c41-v8795112.html"><span class="price_text">Rs. 20,000</span><br />
                                2 bedrooms apartment<br />
                                New alipur<br />
                                800 Sq. Feet</a> </div>
                            <div class="classifieds-subtitle" style="float: left;"><a href="offers-2bhk-flat-for-rent-in-new-alipore-c41-v8795112.html">Offer</a></div>
                            <div style="float: right; padding-right: 5px;"><a href="offers-2bhk-flat-for-rent-in-new-alipore-c41-v8795112.html" class="more_text">More details...</a></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="seperator"></div>
            <div class="text6" align="center">
                <div style="background-color: #382318; color: #ffffff; height: 30px; width: 99%;"><span class="text1" style="padding-top: 5px; display: inline-block;"><font size="2"><b>1</b> of 4</font></span><a href="4-bedroom-flats-h39-p2.html" title="next page" style="color: #ffffff; font-weight: bolder; float: right; padding-top: 5px;">Next &gt&nbsp&nbsp</a><div class="clear"></div>
                </div>
            </div>
        </section>
    </div>
    
 
</asp:Content>

