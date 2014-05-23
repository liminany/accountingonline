<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="description" content="سوق سماء العرب هو الطريق الأسهل لنشر اعلانات مبوبة مجانية  لبيع او شراء العقارات و الإسكان او السيارات او المركبات او الكهربائيات و الإلكترونيات او الأثاث و المفروشات او أرقام هواتف مميزة  و كذلك لنشر اعلانات  في مجال الخدمات اوللاعلان عن وظائف شاغرة او لايجاد فرصة عمل في قسم الباحثين عن عمل" />
    <meta name="keywords" content="اعلانات مبوبة مجانية  ,  للبيع , شراء , العقارات و الإسكان , السيارات , المركبات , الكهربائيات و الإلكترونيات , الأثاث و المفروشات , أرقام هواتف مميزة , الخدمات , وظائف شاغرة , الباحثين عن عمل,سوق سماء العرب,كل ما تحتاجة في الأردن,جوردان ماركت,إعلانات تجارية,إعلانات مبوبة,أضف إعلان,إعلان,الأردن,عمان,السلط,جرش,إربد,معان,الزرقاء,مادبا,العقبة,المفرق,الكرك,كهربائيات,إلكترونيات,أثاث بيتي,أثاث مكتبي,سلع مستعملة,سياحة وسفر,خدمات,عقارات,شقق,منازل,بيوت,أراضي,عناية صحية وجمالية,مركبات,سيارات,ملابس,للإيجار,للبيع,كمبيوتر,لابتوب,خلوي,نقليات,سياحة,فنادق,شاليهات,ألعاب,فيديو,طابعات,ماكنات تصوير,ثلاجات,غسالات,أفران,غرف نوم, غرف سفرة,غرف جلوس,كراسي,فرشات,صالونات" />
    <meta name="title" content="ArabiSky  -  سوق سماء العرب | وظائف | إعلانات | بيع و شراء | سيارات و مركبات" />
    <title>ArabiSky - سوق سماء العرب | وظائف | إعلانات | بيع و شراء</title>
    <meta http-equiv="content-language" content="ar" />
    <meta name="author" content="arabisky.com" />
    <meta name="contact" content="info@arabisky.com" />
    <meta name="copyright" content="Copyright (c)2013. All Rights Reserved." />
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
        function MakeDownSearch() { var e = document.getElementById("ctl00_ContentPlaceHolder1_ddlCountryName").value; var t = document.getElementById("ctl00_ContentPlaceHolder1_ddlCityName").value; var n = document.getElementById("ctl00_ContentPlaceHolder1_home_search_cat_id_Default").value; var r = ""; if (e == "-2" || e == "") { r += "الرجاء إختيار البلد\n" } if (t == "-2" || t == "") { r += "الرجاء إختيار المدينة\n" } if (n == "-2" || n == "") { r += "الرجاء إختيار القسم\n" } if (r != "") { alert(r) } else { $("#" + "<%= lbtnRefreshGVDownSearch.ClientID %>").trigger("click") } }
    </script>
    <style type="text/css">
        .thumb {
            background-color: #fff;
            border: solid 1px #ccc;
            box-shadow: 0 0 3px rgba(30,30,30,0.2);
            padding: 3px;
        }

        .tr_AdsRows td {
            border-bottom: 1px solid #ccc;
        }

        .tr_AdsRows:hover {
            background-color: #e0f4ff !important;
        }
    </style> 
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
                            <div style="float: left;">
                                    <script type="text/javascript"><!--
                            google_ad_client = "ca-pub-8724688346081785";
                            /* LeaderBoard */
                            google_ad_slot = "7597006556";
                            google_ad_width = 728;
                            google_ad_height = 90;
                            //-->
                                    </script>
                                    <script type="text/javascript"
                                        src="//pagead2.googlesyndication.com/pagead/show_ads.js">
                                    </script>
                                </div>
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
                        <div style="width: 30%; float: left; height: 50px; font-size: 15px;">
                            <div class="arabiSky-postClassifieds MetroButton" style="float: left; background-color: #ededed;
                                border-bottom: 1px solid #ccc; border-radius: 0px; width: 120px; margin-left: 0px;
                                border-top: 2px solid #f89a21; height: 38px;">
                                <a href="AdvanceSearch" style="display: block; width: 100%; height: 100%; text-decoration: none;">
                                    بحث متقدم</a>
                            </div>
                            <div style="float: left; width: 5px;">
                                &nbsp;</div>
                            <div class="arabiSky-postClassifieds MetroButton" style="float: left; background-color: #ededed;
                                border-bottom: 1px solid #ccc; border-radius: 0px; width: 120px; margin-left: 0px;
                                border-top: 2px solid #f89a21; height: 38px;">
                                <a href="Brand" style="display: block; width: 100%; height: 100%; text-decoration: none;">
                                    بحث بواسطة نوع السيارة</a>
                            </div>
                        </div>
                    </div>
                    <div class="arabiSky-clear" style="height: 20px;">
                    </div> 
                    <div class="arabiSky-indexMainBlocks">
                        <div class="arabiSky-indexInnerBlocks">
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent">
                                <a href="Categories/4/للإيجار" title="للإيجار" style="color: #111111;
                                    font-size: 20px;">للإيجار</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <div class="arabiSky-indexContent" style="height: 100px;">
                                <ul>
                                    <li><a href="Category/30/العقارات-الإسكان" title="العقارات و الإسكان">العقارات
                                        و الإسكان </a></li>
                                    <li><a href="Category/31/السيارات-المركبات" title="السيارات و المركبات">
                                        السيارات و المركبات</a></li>
                                    <li><a href="Category/32/أشياء أخرى" title="أشياء أخرى">أشياء أخرى</a></li>
                                </ul>
                            </div>
                            <!-- closing arabiSky-indexContent -->
                        </div>
                        <div class="arabiSky-indexInnerBlocks">
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent">
                                <a href="Categories?CatID=5&Title=الباحثين عن عمل" title="الباحثين عن عمل" style="color: #111111;
                                    font-size: 20px;">الباحثين عن عمل</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <div class="arabiSky-indexContent" style="height: 40px;">
                                <ul>
                                    <li><a href="Category?CatID=33&Title=الباحثين عن عمل" title="الباحثين عن عمل">الباحثين
                                        عن عمل </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="arabiSky-indexMainBlocks">
                        <div class="arabiSky-indexInnerBlocks">
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent">
                                <a href="Categories/3/وظائف-شاغرة" title="وظائف شاغرة" style="color: #111111;
                                    font-size: 20px;">وظائف شاغرة</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <!-- arabiSky-indexContent starts -->
                            <div class="arabiSky-indexContent" style="height: 230px;">
                                <ul>
                                    <li><a href="Category/22/إدارة-سكرتارية" title="ادارة-سكرتارية">إدارة / سكرتارية</a></li>
                                    <li><a href="Category/23/تسويق-مبيعات" title="تسويق-مبيعات">تسويق / مبيعات </a></li>
                                    <li><a href="Category/24/تدريس-تدريب" title="تدريس-تدريب">تدريس / تدريب</a></li>
                                    <li><a href="Category/25/كمبيوتر-تقنية-المعلومات" title="كمبيوتر-تقنية المعلومات">كمبيوتر / تقنية المعلومات </a></li>
                                    <li><a href="Category/26/محاسبة-مالية" title="محاسبة-مالية">محاسبة / مالية</a></li>
                                    <li><a href="Category/27/طب-تمريض" title="طب-تمريض">طب / تمريض</a></li>
                                    <li><a href="Category/28/هندسة" title="هندسة">هندسة </a></li>
                                    <li><a href="Category/29/أشغال-أخرى" title="أشغال-أخرى">أشغال أخرى</a></li>
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
                                <a href="Categories/2/الخدمات" title="الخدمات" style="color: #111111; font-size: 20px;">الخدمات</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <div class="arabiSky-indexContent" style="height: 230px;">
                                <ul>
                                    <li><a href="Category/12/دروس-دورات-تدريبية" title="دروس و دورات تدريبية"> دروس و دورات تدريبية</a></li>
                                    <li><a href="Category/13/الكومبيوتر-الإنترنت" title="الكومبيوتر و الإنترنت"> الكومبيوتر و الإنترنت</a></li>
                                    <li><a href="Category/14/بناء-مقاولات" title="بناء و مقاولات">بناء و مقاولات</a></li>
                                    <li><a href="Category/15/خدمات-كهربائية" title="خدمات كهربائية">خدمات كهربائية</a></li>
                                    <li><a href="Category/16/السفر-السياحة" title="السفر و السياحة">السفر و السياحة</a></li>
                                    <li><a href="Category/17/خدمات-طبية" title="خدمات طبية">خدمات طبية </a></li>
                                    <li><a href="Category/18/تجهيز-الأطعمة-الحفلات" title="تجهيز الأطعمة و الحفلات">تجهيز الأطعمة و الحفلات </a></li>
                                    <li><a href="Category/19/إصلاح-صيانة-السيارات" title="إصلاح و صيانة السيارات"> إصلاح و صيانة السيارات</a></li>
                                    <li><a href="Category/20/خدمات-قانونية" title="خدمات قانونية">خدمات قانونية </a></li>
                                    <li><a href="Category/21/خدمات-أخرى" title="خدمات أخرى">خدمات أخرى</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="arabiSky-indexMainBlocks last">
                        <div class="arabiSky-indexInnerBlocks">
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent">
                                <a href="Categories/1/للبيع" title="للبيع" style="color: #111111; font-size: 20px;"> للبيع</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <div class="arabiSky-indexContent" style="height: 120px;">
                                <ul>
                                    <li><a href="Category/6/العقارات-الإسكان" title="العقارات و الإسكان">العقارات و الإسكان</a></li>
                                    <li><a href="Category/7/السيارات-المركبات" title="السيارات و المركبات">السيارات و المركبات</a></li>
                                    <li><a href="Category/8/الكهربائيات-الإلكترونيات" title="الكهربائيات و الإلكترونيات"> الكهربائيات و الإلكترونيات</a></li>
                                    <li><a href="Category/9/الأثاث-المفروشات" title="الأثاث و المفروشات">الأثاث و المفروشات</a></li>
                                    <li><a href="Category/10/أرقام-هواتف-مميزة" title="ارقام هواتف مميزة">أرقام هواتف مميزة</a></li>
                                    <li><a href="Category/11/أشياء-أخرى" title="اشياء أخرى">أشياء أخرى</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="arabiSky-indexInnerBlocks">
                            <div class="arabiSky-indexHeadingLeftCurve">
                            </div>
                            <div class="arabiSky-indexHeadingContent">
                                <a href="Categories/6/مطلوب-شراء" title="مطلوب-شراء" style="color: #111111; font-size: 20px;">مطلوب شراء</a>&nbsp;<span></span>
                            </div>
                            <div class="arabiSky-indexHeadingRightCurve">
                            </div>
                            <div class="arabiSky-indexContent">
                                <ul>
                                    <li><a href="Category/34/" title="الباحثين-عن-عمل">مطلوب شراء </a></li>
                                </ul>
                            </div>
                            <!-- closing arabiSky-indexContent -->
                        </div>
                    </div>
                </div>
                <div style="height:10px;clear:both;"></div>
                <div style="width: 100%; height: auto;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr id="ArabiSkyTools" runat="server">
                            <td colspan="3">
                                <div style="width: 100%; height: auto;">
                                    <div>
                                        <div class="arabiSky-indexHeadingLeftCurve" style="width: 1%;">
                                        </div>
                                        <div class="arabiSky-indexHeadingContent" style="width: 98%;">
                                            <div style="float: right;">
                                                <span style="color: #111111; font-size: 20px;">أدوات الموقع</span>
                                            </div>
                                        </div>
                                        <div class="arabiSky-indexHeadingRightCurve" style="width: 1%;">
                                        </div>
                                    </div>
                                    <div style="clear: both;">
                                    </div>
                                    <div>
                                        <div style="border: 1px solid #ccc; height: auto; text-align: center; height: 70px;
                                            padding-right: 20px;">
                                            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="3" style="height: 10px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 300px;">
                                                        <img src="images/carLogo.png" alt="ArabiSky car Image" style="width: 50px; height: 50px;" />
                                                        <a href="GalleryList?Tag=RC" style="position: relative; bottom: 10px; font-weight: bold;">
                                                            &nbsp;&nbsp;تأجير سيارات&nbsp;&nbsp;</a>
                                                    </td>
                                                    <td align="right" style="width: 300px;">
                                                        <img src="images/CarGrey.png" alt="ArabiSky car Image" style="width: 50px; height: 50px;" />
                                                        <a href="GalleryList?Tag=GC" style="position: relative; bottom: 10px; font-weight: bold;">
                                                            &nbsp;&nbsp; معارض سيارات &nbsp;&nbsp;</a>
                                                    </td>
                                                    <td align="right" style="width: 300px;">
                                                        <img src="images/carCheck.png" alt="ArabiSky car Image" style="width: 50px; height: 50px;" />
                                                        <a href="GalleryList?Tag=CC" style="position: relative; bottom: 10px; font-weight: bold;">
                                                            &nbsp;&nbsp; مراكز الفحص &nbsp;&nbsp;</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="height: 10px;">
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 5px;">
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
                                                        <tr class="tr_AdsRows" style="color: #333; font-weight: bolder; height: 60px; cursor: pointer;"
                                                            onclick="window.location='<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>'">
                                                            <td align="right" style="width: 65%; padding-right: 30px;">
                                                                <a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">
                                                                    <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a>  
                                                            </td>
                                                            <td style="width: 15%" align="center">
                                                                <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                                            </td>
                                                            <td align="center" style="width: 10%; font-size: 13px;">
                                                                <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                            </td>
                                                            <td align="center" style="padding-left: 20px; width: 10%">
                                                                <p>
                                                                    <a href="javascript:void(0)" class="screenshot" rel='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                        title='<%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>'>
                                                                        <img class="thumb" src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                            width="40" height="40" alt="ArabiSky.com" />
                                                                    </a>
                                                                </p>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <AlternatingItemTemplate>
                                                        <tr class="tr_AdsRows" style="background-color: #fafafa; color: #333; font-weight: bolder;
                                                            height: 60px; cursor: pointer;" onclick="window.location='<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>'">
                                                            <td align="right" style="width: 65%; padding-right: 30px;">
                                                                <a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">
                                                                    <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a>  
                                                            </td>
                                                            <td style="width: 15%" align="center">
                                                                <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                                            </td>
                                                            <td align="center" style="width: 10%; font-size: 13px;">
                                                                <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                            </td>
                                                            <td align="center" style="padding-left: 20px; width: 10%;">
                                                                <p>
                                                                    <a href="javascript:void(0)" class="screenshot" rel='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                        title='<%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>'>
                                                                        <img style="font-size: 11px; color: #333;" class="thumb" src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                            width="40" height="40" alt="ArabiSky.com" />
                                                                    </a>
                                                                </p>
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
                                   <div style="float: left;">
            <script type="text/javascript"><!--
    google_ad_client = "ca-pub-8724688346081785";
    /* LeaderBoard */
    google_ad_slot = "7597006556";
    google_ad_width = 728;
    google_ad_height = 90;
    //-->
            </script>
            <script type="text/javascript"
                src="//pagead2.googlesyndication.com/pagead/show_ads.js">
            </script>
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
                                                       <tr class="tr_AdsRows" style="color: #333; font-weight: bolder; height: 60px; cursor: pointer;"
                                                            cursor: pointer;" onclick="window.location='<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>'">
                                                            <td align="right" style="width: 65%; padding-right: 30px;">
                                                                <a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">
                                                                    <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a>
                                                            </td>
                                                            <td style="width: 15%" align="center">
                                                                <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                                            </td>
                                                            <td align="center" style="width: 10%; font-size: 13px;">
                                                                <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                            </td>
                                                            <td align="center" style="padding-left: 20px; width: 10%">
                                                                <p>
                                                                    <a href="javascript:void(0)" class="screenshot" rel='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                        title='<%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>'>
                                                                        <img class="thumb" src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                            width="40" height="40" alt="ArabiSky.com" />
                                                                    </a>
                                                                </p>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <AlternatingItemTemplate>
                                                        <tr class="tr_AdsRows last" style="background-color: #fafafa; color: #333; font-weight: bolder;height:60px;
                                                            cursor: pointer;" onclick="window.location='<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>'">
                                                            <td align="right" style="width: 65%; padding-right: 30px;">
                                                                <a href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">
                                                                    <%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a>
                                                            </td>
                                                            <td style="width: 15%" align="center">
                                                                <%# DataBinder.Eval(Container.DataItem, "SubCategoriesName")%>
                                                            </td>
                                                            <td align="center" style="width: 10%; font-size: 13px;">
                                                                <%# DataBinder.Eval(Container.DataItem, "CityName")%>
                                                            </td>
                                                            <td align="center" style="padding-left: 20px; width: 10%">
                                                                <p>
                                                                    <a href="javascript:void(0)" class="screenshot" rel='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                        title='<%# DataBinder.Eval(Container.DataItem, "AdsTitle")%>'>
                                                                        <img class="thumb" src='<%# CheckImage(DataBinder.Eval(Container.DataItem, "AdsImages").ToString()) %>'
                                                                            width="40" height="40" alt="ArabiSky.com" />
                                                                    </a>
                                                                </p>
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
                                   <div style="float: left;">
            <script type="text/javascript"><!--
    google_ad_client = "ca-pub-8724688346081785";
    /* LeaderBoard */
    google_ad_slot = "7597006556";
    google_ad_width = 728;
    google_ad_height = 90;
    //-->
            </script>
            <script type="text/javascript"
                src="//pagead2.googlesyndication.com/pagead/show_ads.js">
            </script>
        </div>
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
