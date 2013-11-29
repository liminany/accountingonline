<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="description" content="سوق سماء العرب هو الطريق الأسهل لنشر اعلانات مبوبة مجانية  لبيع او شراء العقارات و الإسكان او السيارات او المركبات او الكهربائيات و الإلكترونيات او الأثاث و المفروشات او أرقام هواتف مميزة  و كذلك لنشر اعلانات  في مجال الخدمات اوللاعلان عن وظائف شاغرة او لايجاد فرصة عمل في قسم الباحثين عن عمل" />
    <meta name="keywords" content="اعلانات مبوبة مجانية  ,  للبيع , شراء , العقارات و الإسكان , السيارات , المركبات , الكهربائيات و الإلكترونيات , الأثاث و المفروشات , أرقام هواتف مميزة , الخدمات , وظائف شاغرة , الباحثين عن عمل" />
    <meta name="title" content="ArabiSky  -  سوق سماء العرب | وظائف | إعلانات | بيع و شراء | سيارات و مركبات" />
    <title>ArabiSky - سوق سماء العرب | وظائف | إعلانات | بيع و شراء</title>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <meta itemprop="name" content="ArabiSky" />
    <meta itemprop="description" content="سوق سماء العرب هو الطريق الأسهل لنشر اعلانات مبوبة مجانية  لبيع او شراء العقارات و الإسكان او السيارات او المركبات او الكهربائيات و الإلكترونيات او الأثاث و المفروشات او أرقام هواتف مميزة  و كذلك لنشر اعلانات  في مجال الخدمات اوللاعلان عن وظائف شاغرة او لايجاد فرصة عمل في قسم الباحثين عن عمل" />
    <meta itemprop="image" content="http://arabisky.com/images/ArabiSkylogo.png" />
    <meta property="fb:page_id" content="507506199302545" />
    <meta property="fb:app_id" content="172727259569815" />
    <meta property="og:image" content='http://arabisky.com/images/ArabiSkyLogo.png' />
    <meta property="og:title" content='ArabiSky  - سوق سماء العرب | وظائف | إعلانات | بيع و شراء' />
    <meta property="og:description" content="سوق سماء العرب هو الطريق الأسهل لنشر اعلانات مبوبة مجانية  لبيع او شراء العقارات و الإسكان او السيارات او المركبات او الكهربائيات و الإلكترونيات او الأثاث و المفروشات او أرقام هواتف مميزة  و كذلك لنشر اعلانات  في مجال الخدمات اوللاعلان عن وظائف شاغرة او لايجاد فرصة عمل في قسم الباحثين عن عمل" />
    <meta property="og:keyword" content="اعلانات مبوبة مجانية  ,  للبيع , شراء , العقارات و الإسكان , السيارات , المركبات , الكهربائيات و الإلكترونيات , الأثاث و المفروشات , أرقام هواتف مميزة , الخدمات , وظائف شاغرة , الباحثين عن عمل" />
    <meta property="og:url" content="http://arabisky.com/" />
    <script type="text/javascript">
        function MakeDownSearch() {
            var CountryID = document.getElementById("ctl00_ContentPlaceHolder1_ddlCountryName").value;
            var CityID = document.getElementById("ctl00_ContentPlaceHolder1_ddlCityName").value;
            var CatID = document.getElementById("ctl00_ContentPlaceHolder1_home_search_cat_id_Default").value;
            var strUserMessage = "";
            if ((CountryID == "-2" || CountryID == "")) {
                strUserMessage += "الرجاء إختيار البلد\n";
            }
            if ((CityID == "-2" || CityID == "")) {
                strUserMessage += "الرجاء إختيار المدينة\n";
            }
            if ((CatID == "-2" || CatID == "")) {
                strUserMessage += "الرجاء إختيار القسم\n";
            }

            if (strUserMessage != "") {
                alert(strUserMessage);
            }
            else {
                $("#" + '<%= lbtnRefreshGVDownSearch.ClientID %>').trigger('click');
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="upDefaultPage" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div>
                <div id="arabiSky-content" style="padding-bottom: 0; text-align: right;">
                    <div>
                        <div style="float: right;">
                            <h1>
                                سماء العرب للإعلانات المبوبة</h1>
                            <h2 style="font-size: 13px; font-weight: lighter; padding-bottom: 0px;">
                                إعلانات مبوبة مجانية للعقارات، وظائف، والسيارات</h2>
                        </div>
                        <div style="float: left; z-index: 1000">
                            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                            <!-- ArabiSky_Default_Top -->
                            <ins class="adsbygoogle" style="display: inline-block; width: 728px; height: 90px"
                                data-ad-client="ca-pub-7196218955155134" data-ad-slot="3354257605"></ins>
                            <script>                                (adsbygoogle = window.adsbygoogle || []).push({});</script>
                            <%--<div style="width:728px;height:90px;background-color:Red;"></div>--%>
                        </div>
                    </div>
                    <div style="clear: both; height: 10px;">
                    </div>
                    <div style="width: 100%">
                        <div id="arabiSky-homeSearchBlock" style="float: right; width: 70%; height: 40px;
                            padding-top: 10px;">
                            <div align="center">
                                <div class="arabiSky-homeTextfield" id="div_SecondSearch" runat="server" style="height: 40px;
                                    text-align: right; padding-right: 10px;">
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td style="width: 20%" align="right">
                                                <asp:DropDownList ID="ddlCountryName" runat="server" CssClass="arabiSky-homeSelectbox"
                                                    Style="width: 190px;" AutoPostBack="true" OnSelectedIndexChanged="ddlCountryName_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 10px;">
                                            </td>
                                            <td style="width: 16%" align="right">
                                                <asp:DropDownList ID="ddlCityName" runat="server" CssClass="arabiSky-homeSelectbox"
                                                    Style="width: 150px;">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 10px;">
                                            </td>
                                            <td align="right" style="width: 10%;">
                                                <select name="home_search_cat_id_Default" id="home_search_cat_id_Default" runat="server"
                                                    style="width: 190px;" class="arabiSky-homeSelectbox">
                                                    <option value="-2">إختر القسم</option>
                                                    <option value="0" disabled="disabled" style="color: #000; background-color: #ededed;
                                                        font-weight: bold;">للبيع</option>
                                                    <option value="6">&nbsp;&nbsp;العقارات و الإسكان</option>
                                                    <option value="7">&nbsp;&nbsp;السيارات و المركبات</option>
                                                    <option value="8">&nbsp;&nbsp;الكهربائيات و الإلكترونيات</option>
                                                    <option value="9">&nbsp;&nbsp;الأثاث و المفروشات</option>
                                                    <option value="10">&nbsp;&nbsp;أرقام هواتف مميزة</option>
                                                    <option value="11">&nbsp;&nbsp;أشياء أخرى</option>
                                                    <option value="0" disabled="disabled" style="color: #000; background-color: #ededed;
                                                        font-weight: bold;">الخدمات</option>
                                                    <option value="12">&nbsp;&nbsp;دروس و دورات تدريبية</option>
                                                    <option value="13">&nbsp;&nbsp;الكومبيوتر و الإنترنت</option>
                                                    <option value="14">&nbsp;&nbsp;بناء و مقاولات</option>
                                                    <option value="15">&nbsp;&nbsp;خدمات كهربائية</option>
                                                    <option value="16">&nbsp;&nbsp;السفر و السياحة</option>
                                                    <option value="17">&nbsp;&nbsp;خدمات طبية</option>
                                                    <option value="18">&nbsp;&nbsp;تجهيز الأطعمة و الحفلات</option>
                                                    <option value="19">&nbsp;&nbsp;إصلاح و صيانة السيارات</option>
                                                    <option value="20">&nbsp;&nbsp;خدمات قانونية</option>
                                                    <option value="21">&nbsp;&nbsp;خدمات أخرى</option>
                                                    <option value="0" disabled="disabled" style="color: #000; background-color: #ededed;
                                                        font-weight: bold;">وظائف شاغرة</option>
                                                    <option value="22">&nbsp;&nbsp;إدارة / سكرتارية</option>
                                                    <option value="23">&nbsp;&nbsp;تسويق / مبيعات</option>
                                                    <option value="24">&nbsp;&nbsp;تدريس / تدريب</option>
                                                    <option value="25">&nbsp;&nbsp;كمبيوتر / تقنية المعلومات</option>
                                                    <option value="26">&nbsp;&nbsp;محاسبة / مالية</option>
                                                    <option value="27">&nbsp;&nbsp;طب / تمريض</option>
                                                    <option value="28">&nbsp;&nbsp;هندسة</option>
                                                    <option value="29">&nbsp;&nbsp;أشغال أخرى</option>
                                                    <option value="0" disabled="disabled" style="color: #000; background-color: #ededed;
                                                        font-weight: bold;">للإيجار</option>
                                                    <option value="30">&nbsp;&nbsp;العقارات و الإسكان</option>
                                                    <option value="31">&nbsp;&nbsp;السيارات و المركبات</option>
                                                    <option value="32">&nbsp;&nbsp;أشياء أخرى</option>
                                                    <option value="0" disabled="disabled" style="color: #000; background-color: #ededed;
                                                        font-weight: bold;">الباحثين عن عمل</option>
                                                    <option value="33">&nbsp;&nbsp;الباحثين عن عمل</option>
                                                </select>
                                                <span id="locality_list"></span>
                                            </td>
                                            <td align="right">
                                                <img src="../images/search1.png" onclick="javascript:return MakeDownSearch();" style="padding-right: 5px;
                                                    padding-bottom: 10px; height: 30px;" alt="ArabiSky.com">
                                            </td>
                                            <td style="width: 10px;">
                                            </td>
                                            <td align="center">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div style="width: 30%; float: left; height: 50px;font-size:15px;">
                            <div class="arabiSky-postClassifieds MetroButton" style="float: left; background-color: #ededed;border-bottom:1px solid #ccc;
                                border-radius: 0px; width: 120px; margin-left: 0px; border-top: 2px solid #f89a21;
                                height: 38px;">
                                <a href="AdvanceSearch" style="display: block; width: 100%; height: 100%;text-decoration:none;">بحث متقدم</a>
                            </div>
                            <div style="float: left; width: 5px;">
                                &nbsp;</div>
                            <div class="arabiSky-postClassifieds MetroButton" style="float: left; background-color: #ededed;border-bottom:1px solid #ccc;
                                border-radius: 0px; width: 120px; margin-left: 0px; border-top: 2px solid #f89a21;
                                height: 38px;">
                                <a href="Brand" style="display: block; width: 100%; height: 100%;text-decoration:none;">بحث بواسطة نوع السيارة</a>
                            </div>
                        </div>
                    </div>
                    <div class="arabiSky-clear">
                    </div>
                    <div style="height: 20px;">
                    </div>
                    <div class="arabiSky-indexMainBlocks">
                        <div class="arabiSky-indexInnerBlocks">
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent">
                                <a href="Categories?CatID=4" title="للإيجار" style="color: #111111; font-size: 20px;">
                                    للإيجار</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <div class="arabiSky-indexContent" style="height: 100px;">
                                <ul>
                                    <li><a href="Category?CatID=30" title="العقارات و الإسكان">العقارات و الإسكان </a>
                                    </li>
                                    <li><a href="Category?CatID=31" title="السيارات و المركبات">السيارات و المركبات</a></li>
                                    <li><a href="Category?CatID=32" title="أشياء أخرى">أشياء أخرى</a></li>
                                </ul>
                            </div>
                            <!-- closing arabiSky-indexContent -->
                        </div>
                        <div class="arabiSky-indexInnerBlocks">
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent">
                                <a href="Categories?CatID=5" title="الباحثين عن عمل" style="color: #111111; font-size: 20px;">
                                    الباحثين عن عمل</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <div class="arabiSky-indexContent" style="height: 40px;">
                                <ul>
                                    <li><a href="Category?CatID=33" title="الباحثين عن عمل">الباحثين عن عمل </a></li>
                                </ul>
                            </div>
                            <!-- closing arabiSky-indexContent -->
                        </div>
                    </div>
                    <div class="arabiSky-indexMainBlocks">
                        <div class="arabiSky-indexInnerBlocks">
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent">
                                <a href="Categories?CatID=3" title="وظائف شاغرة" style="color: #111111; font-size: 20px;">
                                    وظائف شاغرة</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <!-- arabiSky-indexContent starts -->
                            <div class="arabiSky-indexContent" style="height: 230px;">
                                <ul>
                                    <li><a href="Category?CatID=22" title="إدارة / سكرتارية">إدارة / سكرتارية</a></li>
                                    <li><a href="Category?CatID=23" title="تسويق / مبيعات">تسويق / مبيعات </a></li>
                                    <li><a href="Category?CatID=24" title="تدريس / تدريب">تدريس / تدريب</a></li>
                                    <li><a href="Category?CatID=25" title="كمبيوتر / تقنية المعلومات">كمبيوتر / تقنية المعلومات
                                    </a></li>
                                    <li><a href="Category?CatID=26" title="محاسبة / مالية">محاسبة / مالية</a></li>
                                    <li><a href="Category?CatID=27" title="طب / تمريض">طب / تمريض</a></li>
                                    <li><a href="Category?CatID=28" title="هندسة">هندسة </a></li>
                                    <li><a href="Category?CatID=29" title="أشغال أخرى">أشغال أخرى</a></li>
                                </ul>
                            </div>
                            <!-- closing arabiSky-indexContent -->
                        </div>
                    </div>
                    <div class="arabiSky-indexMainBlocks">
                        <div class="arabiSky-indexInnerBlocks">
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent">
                                <a href="Categories?CatID=2" title="الخدمات" style="color: #111111; font-size: 20px;">
                                    الخدمات</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <div class="arabiSky-indexContent" style="height: 230px;">
                                <ul>
                                    <li><a href="Category?CatID=12" title="دروس و دورات تدريبية">دروس و دورات تدريبية</a></li>
                                    <li><a href="Category?CatID=13" title="الكومبيوتر و الإنترنت">الكومبيوتر و الإنترنت</a></li>
                                    <li><a href="Category?CatID=14" title="بناء و مقاولات">بناء و مقاولات</a></li>
                                    <li><a href="Category?CatID=15" title="خدمات كهربائية">خدمات كهربائية</a></li>
                                    <li><a href="Category?CatID=16" title="السفر و السياحة">السفر و السياحة</a></li>
                                    <li><a href="Category?CatID=17" title="خدمات طبية">خدمات طبية </a></li>
                                    <li><a href="Category?CatID=18" title="تجهيز الأطعمة و الحفلات">تجهيز الأطعمة و الحفلات
                                    </a></li>
                                    <li><a href="Category?CatID=19" title="إصلاح و صيانة السيارات">إصلاح و صيانة السيارات</a></li>
                                    <li><a href="Category?CatID=20" title="خدمات قانونية">خدمات قانونية </a></li>
                                    <li><a href="Category?CatID=21" title="خدمات أخرى">خدمات أخرى</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="arabiSky-indexMainBlocks last">
                        <div class="arabiSky-indexInnerBlocks">
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent">
                                <a href="Categories?CatID=1" title="للبيع" style="color: #111111; font-size: 20px;">
                                    للبيع</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <div class="arabiSky-indexContent" style="height: 120px;">
                                <ul>
                                    <li><a href="Category?CatID=6" title="العقارات و الإسكان">العقارات و الإسكان</a></li>
                                    <li><a href="Category?CatID=7" title="السيارات و المركبات">السيارات و المركبات</a></li>
                                    <li><a href="Category?CatID=8" title="الكهربائيات و الإلكترونيات">الكهربائيات و الإلكترونيات</a></li>
                                    <li><a href="Category?CatID=9" title="الأثاث و المفروشات">الأثاث و المفروشات</a></li>
                                    <li><a href="Category?CatID=10" title="أرقام هواتف مميزة">أرقام هواتف مميزة</a></li>
                                    <li><a href="Category?CatID=11" title="أشياء أخرى">أشياء أخرى</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="arabiSky-indexInnerBlocks">
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent">
                                <a href="Categories?CatID=6" title="مطلوب شراء" style="color: #111111; font-size: 20px;">
                                    مطلوب شراء</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <div class="arabiSky-indexContent">
                                <ul>
                                    <li><a href="Category?CatID=34" title="الباحثين عن عمل">مطلوب شراء </a></li>
                                </ul>
                            </div>
                            <!-- closing arabiSky-indexContent -->
                        </div>
                    </div>
                </div>
                <div style="width: 100%; height: auto;">
                    <table width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td style="text-align: center;">
								<a href="http://livekora.net/" target="_blank">
									<img src="http://livekora.net/Livekora_Ads/livekora.jpg" style="border: 0px;" alt="ArabiSky-Livekora" title="احدث و اخر اخبار كرة القدم">
								</a>
							</td>
						</tr>
						<tr>
							<td style="height:5px;"></td>
						</tr>
					   <tr>
                            <td>
                                <div style="width: 100%; height: auto;">
                                    <div>
                                        <div class="arabiSky-indexHeadingLeftCurve">
                                        </div>
                                        <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                                            <div style="float: right;">
                                                <span style="color: #111111; font-size: 20px;">أخر الإعلانات المضافة</span>
                                            </div>
                                        </div>
                                        <div class="arabiSky-indexHeadingRightCurve">
                                        </div>
                                    </div>
                                    <div style="clear: both;">
                                    </div>
                                    <div>
                                        <div style="border: 1px solid #ccc; height: auto; width: 973px; margin-right: 10px;
                                            text-align: center;">
                                            <table class="tbMainAds" width="100%" cellpadding="0" cellspacing="0">
                                                <asp:Repeater runat="server" ID="rptlatstAdsAdded">
                                                    <HeaderTemplate>
                                                        <thead>
                                                            <tr>
                                                                <th align="right" style="width: 50%; padding-right: 30px;">
                                                                    عنوان الإعلان
                                                                </th>
                                                                <th style="width: 13%" align="center">
                                                                    القسم الفرعي
                                                                </th>
                                                                <th align="center" style="width: 10%;">
                                                                    المدينة
                                                                </th>
                                                                <th colspan="2" align="center" style="padding-left: 20px; width: 10%">
                                                                    الصورة
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr style="background-color: #fff; color: #333; font-weight: bolder; height: 60px;
                                                            cursor: pointer;" onclick="window.location='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'">
                                                            <td align="right" style="width: 65%; padding-right: 30px;">
                                                                <a href='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'>
                                                                    <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a>
                                                            </td>
                                                            <td style="width: 15%" align="center">
                                                                <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                                            </td>
                                                            <td align="center" style="width: 10%; font-size: 13px;">
                                                                <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                            </td>
                                                            <td align="center" style="padding-left: 20px; width: 10%">
                                                                <img src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                    width="50" height="50" alt="ArabiSky.com" />
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <AlternatingItemTemplate>
                                                        <tr style="background-color: #ededed; color: #333; font-weight: bolder; height: 60px;
                                                            cursor: pointer;" onclick="window.location='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'">
                                                            <td align="right" style="width: 65%; padding-right: 30px;">
                                                                <a href='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'>
                                                                    <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a>
                                                            </td>
                                                            <td style="width: 15%" align="center">
                                                                <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                                            </td>
                                                            <td align="center" style="width: 10%; font-size: 13px;">
                                                                <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                            </td>
                                                            <td align="center" style="padding-left: 20px; width: 10%">
                                                                <img src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                    width="50" height="50" alt="ArabiSky.com" />
                                                            </td>
                                                        </tr>
                                                    </AlternatingItemTemplate>
                                                </asp:Repeater>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 10px;">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="arabiSky-postClassifieds" style="margin-right: 10px; border-radius: 0px;
                                    float: right;">
                                    <a href="Search?Type=Newest" style="display: block; width: 100%; height: 100%;">تابع
                                        مشاهدة اخر الإعلانات</a>
                                </div>
                                <div style="float: left;">
                                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                                    <!-- ArabiSky_Default_Top -->
                                    <ins class="adsbygoogle" style="display: inline-block; width: 728px; height: 90px"
                                        data-ad-client="ca-pub-7196218955155134" data-ad-slot="3354257605"></ins>
                                    <script>                                        (adsbygoogle = window.adsbygoogle || []).push({});</script>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 10px;">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="width: 100%; height: auto;">
                                    <div>
                                        <div class="arabiSky-indexHeadingLeftCurve">
                                        </div>
                                        <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                                            <div style="float: right;">
                                                <span style="color: #111111; font-size: 20px;">أكثر الإعلانات مشاهدة</span>
                                            </div>
                                        </div>
                                        <div class="arabiSky-indexHeadingRightCurve">
                                        </div>
                                    </div>
                                    <div style="clear: both;">
                                    </div>
                                    <div>
                                        <div style="border: 1px solid #ccc; height: auto; width: 973px; margin-right: 10px;
                                            text-align: center;">
                                            <table class="tbMainAds" width="100%" cellpadding="0" cellspacing="0">
                                                <asp:Repeater runat="server" ID="rptMostViewd">
                                                    <HeaderTemplate>
                                                        <thead>
                                                            <tr>
                                                                <th align="right" style="width: 50%; padding-right: 30px;">
                                                                    عنوان الإعلان
                                                                </th>
                                                                <th style="width: 13%" align="center">
                                                                    القسم الفرعي
                                                                </th>
                                                                <th align="center" style="width: 10%;">
                                                                    المدينة
                                                                </th>
                                                                <th colspan="2" align="center" style="padding-left: 20px; width: 10%">
                                                                    الصورة
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr style="background-color: #fff; color: #333; font-weight: bolder; height: 60px;
                                                            cursor: pointer;" onclick="window.location='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'">
                                                            <td align="right" style="width: 65%; padding-right: 30px;">
                                                                <a href='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'>
                                                                    <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a>
                                                            </td>
                                                            <td style="width: 15%" align="center">
                                                                <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                                            </td>
                                                            <td align="center" style="width: 10%; font-size: 13px;">
                                                                <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                            </td>
                                                            <td align="center" style="padding-left: 20px; width: 10%">
                                                                <img src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                    width="50" height="50" alt="ArabiSky.com" />
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <AlternatingItemTemplate>
                                                        <tr style="background-color: #ededed; color: #333; font-weight: bolder; height: 60px;
                                                            cursor: pointer;" onclick="window.location='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'">
                                                            <td align="right" style="width: 65%; padding-right: 30px;">
                                                                <a href='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'>
                                                                    <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a>
                                                            </td>
                                                            <td style="width: 15%" align="center">
                                                                <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                                            </td>
                                                            <td align="center" style="width: 10%; font-size: 13px;">
                                                                <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                            </td>
                                                            <td align="center" style="padding-left: 20px; width: 10%">
                                                                <img src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                    width="50" height="50" alt="ArabiSky.com" />
                                                            </td>
                                                        </tr>
                                                    </AlternatingItemTemplate>
                                                </asp:Repeater>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 10px;">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="arabiSky-postClassifieds" style="margin-right: 10px; border-radius: 0px;
                                    float: right;">
                                    <a href="Search?Type=SearchLast" style="display: block; width: 100%; height: 100%;">
                                        تابع أكثر الإعلانات مشاهدة</a>
                                </div>
                                <div style="float: left;">
                                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                                    <!-- ArabiSky_Default_Top -->
                                    <ins class="adsbygoogle" style="display: inline-block; width: 728px; height: 90px"
                                        data-ad-client="ca-pub-7196218955155134" data-ad-slot="3354257605"></ins>
                                    <script>                                        (adsbygoogle = window.adsbygoogle || []).push({});</script>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="clear-all" style="height: 10px;">
                </div>
            </div>
            <asp:Button ID="lbtnRefreshGVDownSearch" CssClass="ClassHideDiv" runat="server" Text=""
                Height="0px" Width="0px" Style="visibility: hidden" OnClick="lbtnRefreshGVDownSearch_Click">
            </asp:Button>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
