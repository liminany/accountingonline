 <%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="ViewAds.aspx.cs" Inherits="ViewAds"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".fancybox").fancybox({
                openEffect: 'none',
                closeEffect: 'none',
                'closeBtn': true,
                closeOnEscape: false// disable escape event on dialog
            });
        });
    </script>
    <style type="text/css">
        .rows {
            width: 100%;
            height: 50px;
            background-color: #ededed;
            border-bottom: 1px solid #ccc;
            font-weight: bold;
            text-align: right;
        }
        .rows:hover {
                width: 100%;
                height: 50px;
                background-color: #fcfcfc;
                border-bottom: 1px solid #ccc;
                font-weight: bold;
                text-align: right;
            }
        .rows a {
                position: relative;
                top: 17px;
                right: 10px;
                cursor: pointer;
            }
    </style>

    <link rel="canonical" href="<%= sAdsURL %>" />
    <meta property="og:url" content="<%= sAdsURL %>" />
    <meta property="og:image" content='<%= facebookImage %>' />
    <meta property="fb:app_id" content="172727259569815" />
    <meta property="og:type" content="arabiskyapp:classified" />
    <meta property="og:title" content='<%= sAdsTitle %>' />
    <meta property="og:description" content='<%= sAdsDescription %>' />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField runat="server" ID="hfAdsUserIDOwner" Value="0" />
    <asp:HiddenField runat="server" ID="hfUserID" Value="0" />
    <asp:HiddenField runat="server" ID="hfUpdateDateTime" Value="0" />
    <asp:HiddenField runat="server" ID="hfImages" Value="0" /> 
    <div style="width: 100%;">
        <div id="sitemap" runat="server" style="height: 30px; float: right;">
        </div>
        <div id="UserControls" runat="server" style="float: left; position: relative; bottom: 5px;">
            <asp:Button runat="server" Text="تعديل الإعلان" ID="btnEditAds" Width="150" Style="border: 0px; cursor: pointer; width: 180px; background: #ededed; border-top: 2px solid #f9ae4c; border-radius: 0px; margin-left: 5px; height: 29px; padding: 5px; font-size: 15px !important;"
                OnClick="btnEditAds_Click" />
            <asp:Button runat="server" Text="حذف الإعلان" ID="btnDeleteAds" Width="150" OnClientClick="javascript:return funAdsManage('1');"
                Style="border: 0px; cursor: pointer; width: 180px; background: #ededed; border-top: 2px solid #f9ae4c; border-radius: 0px; margin-left: 5px; height: 29px; padding: 5px; font-size: 15px !important;"
                OnClick="btnDeleteAds_Click" />
            <asp:Button runat="server" Text="إعادة نشر الإعلان" ID="btnReactivateAds" Width="150"
                OnClientClick="javascript:return funAdsManage('0');" Style="border: 0px; cursor: pointer; width: 180px; background: #ededed; border-top: 2px solid #f9ae4c; border-radius: 0px; margin-left: 5px; height: 29px; padding: 5px; font-size: 15px !important;"
                OnClick="btnReactivateAds_Click" />
        </div>
    </div>
    <div style="clear: both; height: 1px;">
    </div>
    <div style="width: 100%; height: auto;" itemscope="" itemtype="http://data-vocabulary.org/Product">
        <div>
            <div class="arabiSky-indexHeadingLeftCurve">
            </div>
            <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                <div style="float: right;">
                    <h1 itemprop="name" style="color: #111111; font-size: 20px;" runat="server" id="spAdsTitle"></h1>
                </div>
                <div style="float: left;">
                    <span  itemprop="price" style="color: #111111; font-size: 17px; font-weight: bolder;" runat="server"
                        id="sp_Price"></span>
                </div>
            </div>
            <div class="arabiSky-indexHeadingRightCurve">
            </div>
        </div>
        <div style="clear: both;">
        </div>
        <div>
            <div style="border: 1px solid #ccc; height: auto; width: 973px; margin-right: 10px; text-align: center;">
                <div id="div_ViewAds" style="float: right; margin-top: 20px; width: 100%;">
                    <div style="float: left; display: ;">
                        <div style="float: right; padding-left: 15px;">
                            <script type="text/javascript"><!--
    google_ad_client = "ca-pub-8724688346081785";
    /* View_Ads */
    google_ad_slot = "6120273353";
    google_ad_width = 300;
    google_ad_height = 250;
    //-->
                            </script>
                            <script type="text/javascript"
                                src="//pagead2.googlesyndication.com/pagead/show_ads.js">
                            </script>
                        </div>
                    </div>
                    <div class="arabiSky-adDetails" style="float: right; width: 50%">
                        <ul style="font-size: 15px; font-weight: bolder;" itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer">
                            <li style="text-align: right;" id="liSection" runat="server"></li>
                            <li style="text-align: right;" id="liSubSection" runat="server"></li>
                            <li style="text-align: right;" id="liCountry" runat="server"></li>
                            <li style="text-align: right;" id="liCity" runat="server"></li>
                            <li style="text-align: right;" id="liCreateDate" runat="server"></li>
                        </ul>
                    </div>
                </div>
                <div style="clear: both; height: 8px; border-bottom: 1px solid #ccc;">
                </div>
                <div style="width: 59%; float: right;">
                    <div style="border-bottom: 2px dashed #ccc; padding-top: 10px; width: 102%; float: right; height: 37px; color: #111111; background-color: #ededed; display: ; font-weight: bolder; font-size: 25px; text-align: right; padding-right: 25px;">
                        تفاصيل الإعلان
                    </div>
                    <div style="clear: both; height: 20px;">
                    </div>
                    <div>
                        <h2 itemprop="description" style="text-align: right; margin-right: 30px; margin-left: 30px; width: 80%; float: right; height: auto; word-wrap: break-word; padding-left: 10px;"
                            id="div_AdsDescription"
                            runat="server">
                        </h2>
                    </div>
                    <div style="clear: both; height: 20px;">
                    </div>
                    <div style="width: 100%">
                        <div style="float: right; margin-right: 30px;">
                            <script type="text/javascript"><!--
    google_ad_client = "ca-pub-8724688346081785";
    /* View_Ads */
    google_ad_slot = "6120273353";
    google_ad_width = 300;
    google_ad_height = 250;
    //-->
                            </script>
                            <script type="text/javascript"
                                src="//pagead2.googlesyndication.com/pagead/show_ads.js">
                            </script>
                        </div>
                    </div>
                </div>
                <div style="border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; width: 40%; float: left; vertical-align: top; border-bottom: 0px;">
                    <div class="rows" style="background-color: #ccc; color: #333;">
                        <a style="color: #333; text-decoration: none;">إعلانات متشابهة </a>
                    </div>
                    <asp:Repeater runat="server" ID="rptSlimlerAds">
                        <ItemTemplate>
                            <div class="rows">
                                <a title="<%# DataBinder.Eval(Container.DataItem, "AdsTitle") %>" href="<%# GenerateURL(DataBinder.Eval(Container.DataItem, "AdsID"),DataBinder.Eval(Container.DataItem, "AdsTitle")) %>">
                                    <%# SplitArticlsTitle(DataBinder.Eval(Container.DataItem, "AdsTitle").ToString()) %>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
				<style>
.QuranTemplete {
background-image: url(img/Quran.jpg);
height: 200px;
}
</style> <div class="trending lefty QuranTemplete" style="width: 100%; text-align: center; padding-top: 75px !important; padding: 27px; margin-top: 15px;"> <iframe align="center" src="Quran/index.html" frameborder="0" allowtransparency="0" scrolling="no" width="100%" height="90px"></iframe> </div>
                <div style="clear: both; height: 20px;">
                </div>
                <div style="text-align: right; margin-right: 30px; margin-left: 30px; width: 900px; height: auto; word-wrap: break-word; padding-left: 10px;">
                    <div id="fb-root">
                    </div>
                    <script>                        (function (d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s); js.id = id;
                            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=172727259569815";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));</script>
                    <fb:like href="<%= url %>" layout="button_count" action="like" show_faces="true"
                        share="true">
                    </fb:like>
                    <a href="https://twitter.com/share" class="twitter-share-button" data-via="arabisky">Tweet</a>
                    <script>                        !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
                    <!-- Place this tag where you want the share button to render. -->
                    <div class="g-plus" data-action="share" data-annotation="none">
                    </div>
                    <!-- Place this tag after the last share tag. -->
                    <script type="text/javascript">
                        window.___gcfg = { lang: 'ar' };

                        (function () {
                            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                            po.src = 'https://apis.google.com/js/platform.js';
                            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                        })();
                    </script>
                </div>
                <div style="height: 10px; clear: both">
                </div>
                <div style="text-align: center;" id="div_YouTube" runat="server">
                    <div id="div_YouTubeURL" runat="server">
                    </div>
                </div>
                <div style="height: 10px; clear: both">
                </div>
                <div style="clear: both; height: 5px; border-bottom: 1px solid #ccc;">
                </div>
                <div id="div_Image" runat="server" style="background-color: #ededed; width: 100%; height: 37px; font-size: 23px; border-bottom: 2px dashed #ccc; float: right; color: #111111; font-size: 17px; padding-top: 10px; font-weight: bolder; font-size: 25px;">
                    صور الإعلان
                </div>
                <div style="clear: both; height: 10px;">
                </div>
                <div style="display: none; margin: 10px; text-align: center; width: 100%; padding-right: 10px;" id="div_Slider" runat="server">
                </div>
                <div id="div_ContactSpace" runat="server" style="clear: both; height: 10px;">
                </div>
                <div id="div_ContactUser" runat="server">
                    <div style="height: 20px; clear: both">
                    </div>
                    <div>
                        <div style="margin-right: 5px; float: right;" onclick="funSendEMail('facebook')">
                            <h3 class="accorRightHeader" id="sendEmailResponse" style="width: 215px;">
                                <span class="rightIcons">
                                    <img src="/images/imgFacebook.png" style="position: relative; bottom: 3px;" alt="ArabiSky.com" /></span>
                                <span class="accorText">أكتب تعليق لصحاب الإعلان </span>
                            </h3>
                        </div>
                        <div style="margin-right: 5px; float: right;" id="div_SendPrivateMessage" runat="server"
                            onclick="funSendEMail('message')">
                            <h3 class="accorRightHeader" id="H1" style="width: 215px;">
                                <span class="rightIcons">
                                    <img src="/images/sendMailIcon.png" alt="ArabiSky.com" /></span> <span class="accorText">أرسل رسالة خاصة لصاحب الإعلان </span>
                            </h3>
                        </div>
                        <div style="margin-right: 5px; float: right;" id="div_AdsHaveIssues" runat="server">
                            <h3 class="accorRightHeader" style="width: 215px;">
                                <div onclick="return funAdsHaveIssues()">
                                    <span class="rightIcons">
                                        <img src="~/img/img_Error.png" runat="server" style="width: 20px;" alt="ArabiSky.com" /></span> <span class="accorText">الإبلاغ عن إساءة الإعلان الحالي</span>
                                </div>
                            </h3>
                        </div>
                        <div id="div_UserMessage" runat="server" style="margin-right: 30px; float: right; font-weight: bold; font-size: 15px; margin-top: 7px;">
                        </div>
                    </div>
                    <div style="height: 20px; clear: both">
                    </div>
                    <div style="display: none; padding-right: 30px;" id="td_SendEmail">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>عنوان الرسالة :
                                </td>
                                <td colspan="2" align="right">
                                    <asp:TextBox ID="txtMessageTitle" Style="width: 400px;" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="revMessage_1" runat="server" ValidationGroup="SendMessage"
                                        ControlToValidate="txtMessageTitle" ErrorMessage="الرجاء إدخال عنوان الرسالة"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>نص الرسالة :
                                </td>
                                <td colspan="2" align="right">
                                    <textarea runat="server" validationgroup="SendMessage" id="editor" name="elm1" rows="5"
                                        cols="80" style="width: 700px">
			                            </textarea>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="SendMessage"
                                        ControlToValidate="editor" ErrorMessage="الرجاء إدخال نص الرسالة"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 10px;"></td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                                <td style="height: 30px;" align="right">
                                    <asp:Button ID="btnSendMessage" ValidationGroup="SendMessage" runat="server" CssClass="btnClass"
                                        Text="إرسال" OnClick="btnSendMessage_Click" />
                                </td>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 25px;"></td>
                            </tr>
                        </table>
                    </div>
                    <div style="display: ;" id="div_Facebook">
                        <table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="right" style="padding-right: 20px;">
                                    <fb:comments numposts="30" width="900" class="fb-comments" data-href='<%= url %>'>
                                    </fb:comments>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="height: 20px; clear: both;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="height: 20px; clear: both;">
    </div>
    <div style="width: 100%; height: auto;">
        <div>
            <div style="text-align: center;">
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
    <asp:Button runat="server" Style="visibility: hidden" ID="btnAdsIssues" OnClick="btnAdsIssues_Click" />
    <script type="text/javascript">
        function funAdsHaveIssues() {
            var adsHaveIssues = confirm("هل انت متأكد من التبليغ عن هذا الإعلان ؟");
            if (adsHaveIssues) {
                $("#ctl00_ContentPlaceHolder1_btnAdsIssues").click();
            }
            else {
                return false;
            }
        }
    </script>
</asp:Content>
