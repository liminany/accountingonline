<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="ViewAds.aspx.cs" Inherits="ViewAds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.bxslider').bxSlider({
                mode: 'fade',
                captions: true
            });

            tinyMCE.init({
                // General options
                mode: "textareas",
                theme: "advanced",
                plugins: "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave,visualblocks",
                // Theme options
                theme_advanced_buttons1: "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
                theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
                theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft,visualblocks",
                theme_advanced_toolbar_location: "top",
                theme_advanced_toolbar_align: "left",
                theme_advanced_statusbar_location: "bottom",
                theme_advanced_resizing: false,
                // Example content CSS (should be your site CSS)
                content_css: "css/content.css",
                // Drop lists for link/image/media/template dialogs
                template_external_list_url: "lists/template_list.js",
                external_link_list_url: "lists/link_list.js",
                external_image_list_url: "lists/image_list.js",
                media_external_list_url: "lists/media_list.js",
                // Style formats
                style_formats: [
			{ title: 'Bold text', inline: 'b' },
			{ title: 'Red text', inline: 'span', styles: { color: '#ff0000'} },
			{ title: 'Red header', block: 'h1', styles: { color: '#ff0000'} },
			{ title: 'Example 1', inline: 'span', classes: 'example1' },
			{ title: 'Example 2', inline: 'span', classes: 'example2' },
			{ title: 'Table styles' },
			{ title: 'Table row 1', selector: 'tr', classes: 'tablerow1' }
		],
                // Replace values for the template plugin
                template_replace_values: {
                    username: "Some User",
                    staffid: "991234"
                }
            });
        }); 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField runat="server" ID="hfAdsUserIDOwner" Value="0" />
    <asp:HiddenField runat="server" ID="hfUserID" Value="0" />
    <asp:HiddenField runat="server" ID="hfUpdateDateTime" Value="0" />
    <div style="width: 100%;">
        <div id="sitemap" runat="server" style="height: 30px; float: right;">
        </div>
        <div id="UserControls" runat="server" style="float: left; position: relative; bottom: 5px;">
            <asp:Button runat="server" Text="تعديل الإعلان" ID="btnEditAds" Width="150" CssClass="arabiSky-postClassifieds"
                Style="border: 0px; cursor: pointer;" OnClick="btnEditAds_Click" />
            <asp:Button runat="server" Text="حذف الإعلان" ID="btnDeleteAds" Width="150" OnClientClick="javascript:return funAdsManage('1');"
                CssClass="arabiSky-postClassifieds" Style="border: 0px; cursor: pointer;" OnClick="btnDeleteAds_Click" />
            <asp:Button runat="server" Text="إعادة نشر الإعلان" ID="btnReactivateAds" Width="150"
                OnClientClick="javascript:return funAdsManage('0');" CssClass="arabiSky-postClassifieds"
                Style="border: 0px; cursor: pointer;" OnClick="btnReactivateAds_Click" />
        </div>
    </div>
    <div style="clear: both; height: 1px;">
    </div>
    <div style="width: 100%; height: auto;">
        <div>
            <div class="arabiSky-indexHeadingLeftCurve">
            </div>
            <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                <div style="float: right;">
                    <span style="color: #111111; font-size: 20px;" runat="server" id="spAdsTitle"></span>
                </div>
                <div style="float: left;">
                    <span style="color: #111111; font-size: 17px; font-weight: bolder;" runat="server"
                        id="sp_Price"></span>
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
                <div id="div_ViewAds" style="float: right; margin-top: 20px; width: 100%;">
                    <div style="float: left;">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr style="height: 100px;">
                                    <td align="right" style="width: 80px;">
                                        <a href="" id="ahrefUserProfile" runat="server">
                                            <img src="images/ArabiSkyUnknowUser.png" runat="server" id="imgUserProfile" width="80"
                                                height="80" alt="ArabiSky.com" />
                                        </a>
                                    </td>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 20px; vertical-align: bottom">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: 1px solid #ccc;" colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        إسم المستخدم :
                                    </td>
                                    <td colspan="2" align="right">
                                        <span id="sp_UserFullName" runat="server" style="color: #111111; font-size: 15px;">
                                        </span>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" nowrap="NoWrap">
                                        البريد الإلكتروني :
                                    </td>
                                    <td colspan="2" align="right">
                                        <a href="javascript:void(0)" id="aEmailAddress" runat="server" style="font-size: 15px;">
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom: 1px solid #ccc;" colspan="3">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="arabiSky-adDetails" style="float: right; width: 50%">
                        <ul style="font-size: 15px; font-weight: bolder;">
                            <li style="text-align: right;" id="liSection" runat="server"></li>
                            <li style="text-align: right;" id="liSubSection" runat="server"></li>
                            <li style="text-align: right;" id="liCountry" runat="server"></li>
                            <li style="text-align: right;" id="liCity" runat="server"></li>
                            <li style="text-align: right;" id="liCreateDate" runat="server"></li>
                        </ul>
                    </div>
                </div>
                <div style="clear: both; height: 30px; border-bottom: 1px solid #ccc;">
                </div>
                <div id="div1" style="float: right; margin-right: 30px; color: #111111; font-size: 17px;
                    padding-top: 10px; font-weight: bolder;">
                    تفاصيل الإعلان
                </div>
                <div style="clear: both; height: 20px;">
                </div>
                <div style="text-align: right; margin-right: 30px; margin-left: 30px; width: 900px;
                    height: auto; word-wrap: break-word; padding-left: 10px;" id="div_AdsDescription"
                    runat="server">
                </div>
                <div style="height: 20px; clear: both">
                </div>
                <div style="text-align: center;" id="div_YouTube" runat="server">
                    <div id="div_YouTubeURL" runat="server">
                    </div>
                </div>
                <div style="height: 20px; clear: both">
                </div>
                <div style="height: 10px; clear: both">
                </div>
                <div style="display: none;" id="div_Slider" runat="server">
                    <div class="arabiSky-adImages">
                        <div style="vertical-align: middle;">
                            <div class="bx-wrapper">
                                <div class="slider">
                                    <ul class="bxslider" id="ulVidewImages" runat="server">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="div_ContactSpace" runat="server" style="clear: both; height: 20px;">
                </div>
                <div id="div_ContactUser" runat="server">
                    <div style="height: 20px; clear: both">
                    </div>
                    <div>
                        <div style="margin-right: 30px; float: right;" onclick="funSendEMail('facebook')">
                            <h3 class="accorRightHeader" id="sendEmailResponse" style="width: 215px;">
                                <span class="rightIcons">
                                    <img src="/images/imgFacebook.png" style="position: relative; bottom: 3px;" alt="ArabiSky.com"></span>
                                <span class="accorText">أكتب تعليق لصحاب الإعلان </span>
                            </h3>
                        </div>
                        <div style="margin-right: 30px; float: right;" id="div_SendPrivateMessage" runat="server" onclick="funSendEMail('message')">
                            <h3 class="accorRightHeader" id="H1" style="width: 215px;">
                                <span class="rightIcons">
                                    <img src="/images/sendMailIcon.png" alt="ArabiSky.com"></span> <span class="accorText">
                                        أرسل رسالة خاصة لصاحب الإعلان </span>
                            </h3>
                        </div>
                        <div id="div_UserMessage" runat="server" style="margin-right: 30px; float: right;
                            font-weight: bold; font-size: 15px; margin-top: 7px;">
                        </div>
                        <%--<div style="margin-right: 30px; float: right;" onclick="funSendEMail('message')">
                        <h3 class="accorRightHeader" id="H2" style="width: 215px;">
                            <span class="rightIcons">
                                <img src="/images/imgStar.png" style="position: relative;bottom: 5px;" alt="ArabiSky.com"></span> 
                                <span class="accorText">أضف الى اعلاناتي المفضلة</span>
                        </h3>
                    </div>--%>
                    </div>
                    <div style="height: 20px; clear: both">
                    </div>
                    <div style="display: none;" id="td_SendEmail">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    عنوان الرسالة :
                                </td>
                                <td colspan="2" align="right">
                                    <asp:TextBox ID="txtMessageTitle" Style="width: 400px;" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="revMessage_1" runat="server" ValidationGroup="SendMessage"
                                        ControlToValidate="txtMessageTitle" ErrorMessage="الرجاء إدخال عنوان الرسالة"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    نص الرسالة :
                                </td>
                                <td colspan="2" align="right">
                                    <textarea runat="server" validationgroup="SendMessage" id="editor" name="elm1" rows="5"
                                        cols="80" style="width: 80%">
			                            </textarea>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="SendMessage"
                                        ControlToValidate="editor" ErrorMessage="الرجاء إدخال نص الرسالة"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 10px;">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td style="height: 30px;" align="right">
                                    <asp:Button ID="btnSendMessage" ValidationGroup="SendMessage" runat="server" CssClass="btnClass"
                                        Text="إرسال" OnClick="btnSendMessage_Click" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 25px;">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="display: ;" id="div_Facebook">
                        <table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="right" style="padding-right: 20px;">
                                    <div id="disqus_thread">
                                    </div>
                                    <script type="text/javascript">
                                        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                                        var disqus_shortname = 'arabisky'; // required: replace example with your forum shortname

                                        /* * * DON'T EDIT BELOW THIS LINE * * */
                                        (function () {
                                            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                                            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                                            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                                        })();
                                    </script>
                                    <noscript>
                                        Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments
                                            powered by Disqus.</a></noscript>
                                    <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">
                                        Disqus</span></a>
                                    <script type="text/javascript">
                                        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                                        var disqus_shortname = 'arabisky'; // required: replace example with your forum shortname

                                        /* * * DON'T EDIT BELOW THIS LINE * * */
                                        (function () {
                                            var s = document.createElement('script'); s.async = true;
                                            s.type = 'text/javascript';
                                            s.src = '//' + disqus_shortname + '.disqus.com/count.js';
                                            (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
                                        } ());
                                    </script>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="height: 20px; clear: both;">
    </div>
    <div style="width: 100%; height: auto;">
        <div>
            <div class="arabiSky-indexHeadingLeftCurve">
            </div>
            <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                <div style="float: right;">
                    <span style="color: #111111; font-size: 20px;">إعلانات مشابهة</span>
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
                    <asp:Repeater runat="server" ID="rptSlimlerAds">
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
                                    <a href='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'><%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a>
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
                                    <a href='ViewAds?AdsID=<%# DataBinder.Eval(Container.DataItem, "AdsID")%>'><%# DataBinder.Eval(Container.DataItem, "AdsTitle")%></a>
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
            <div style="clear: both; height: 10px;">
            </div>
            <div style="text-align: center;">
                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                <!-- ArabiSky_Default_Top -->
                <ins class="adsbygoogle" style="display: inline-block; width: 728px; height: 90px"
                    data-ad-client="ca-pub-7196218955155134" data-ad-slot="3354257605"></ins>
                <script>                    (adsbygoogle = window.adsbygoogle || []).push({});</script>
                <%--<div style="width:728px;height:90px;background-color:Red;"></div>--%>
            </div>
        </div>
    </div>
</asp:Content>
