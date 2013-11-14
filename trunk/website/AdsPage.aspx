﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="AdsPage.aspx.cs" Inherits="AdsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
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
                theme_advanced_resizing: true,
                // Example content CSS (should be your site CSS)
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

        function funDeleteImage(imgID) {
            $("#" + imgID).remove();
        }

        function GetImageToUpdateAds() {
            var imageNew = "";
            $('img.AdsImage').each(function () {
                imageNew = imageNew + $(this).attr("src").replace("../", "~/") + "|";
            });
            $("#ctl00_ContentPlaceHolder1_hfEditImageAds").val(imageNew);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField runat="server" ID="hfUserID" Value="0" />
    <asp:HiddenField runat="server" ID="hfCountryID" Value="0" />
    <asp:HiddenField runat="server" ID="hfEditImageAds" Value="0" />
    <div style="height: 30px; float: right;">
        <a href='/'>سوق سماء العرب </a>» <span id="spPageTitle" runat="server"></span>
    </div>
    <div style="clear: both;">
    </div>
    <div style="width: 100%; height: auto;">
        <div>
            <div class="arabiSky-indexHeadingLeftCurve">
            </div>
            <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                <a href="" title="Education & Learning" style="color: #111111; font-size: 20px;"
                    runat="server" id="spAdsTitle">إضافة إعلان</a>
            </div>
            <div class="arabiSky-indexHeadingRightCurve">
            </div>
        </div>
        <div style="clear: both;">
        </div>
        <div>
            <div style="float: right; border: 1px solid #ccc; height: auto; width: 933px; margin-right: 10px;
                text-align: center; padding-right: 20px; padding-top: 15px; padding-left: 20px;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr id="trUserMessage" runat="server" style="display: none;">
                        <td>
                            &nbsp;
                        </td>
                        <td colspan="2" align="right">
                            <span style="font-weight: bold; font-size: 15px;" id="spUserMessages" runat="server">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="font-weight: bold; width: 121px;">
                            عنوان الإعلان :
                        </td>
                        <td align="right" colspan="2">
                            <input type="text" style="width: 300px;" id="txtAdsTitle" runat="server" maxlength="100" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAdsTitle"
                                ValidationGroup="AddAds" ErrorMessage="الرجاء إدخال عنوان الإعلان"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table width="75%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="right" style="font-weight: bold">
                                                القسم :
                                            </td>
                                            <td align="right" colspan="2">
                                                <asp:DropDownList ID="ddlCategoryName" runat="server" CssClass="arabiSky-homeSelectbox"
                                                    Style="width: 250px;" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoryName_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlCategoryName"
                                                    ValidationGroup="AddAds" ErrorMessage="الرجاء إختيار القسم" InitialValue="-2"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="font-weight: bold">
                                                القسم الفرعي :
                                            </td>
                                            <td align="right" colspan="2">
                                                <asp:DropDownList ID="ddlSubCategoryName" runat="server" CssClass="arabiSky-homeSelectbox"
                                                    Style="width: 250px;">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlCategoryName"
                                                    ValidationGroup="AddAds" ErrorMessage="الرجاء إختيار القسم الفرعي" InitialValue="-2"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" style="font-weight: bold">
                            البلد :
                        </td>
                        <td align="right" colspan="2">
                            <span style="font-weight: bold;" id="sp_CountryName" runat="server">الممكلة الاردنية
                                الهاشمية</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="font-weight: bold">
                            المدينة :
                        </td>
                        <td align="right" colspan="2">
                            <asp:DropDownList ID="ddlCityName" runat="server" CssClass="arabiSky-homeSelectbox"
                                Style="width: 250px;">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlCityName"
                                ValidationGroup="AddAds" ErrorMessage="الرجاء إختيار المدينة" InitialValue="-2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="font-weight: bold">
                            السعر :
                        </td>
                        <td colspan="2" align="right">
                            <input type="text" onkeypress="return numbersonly(event)" style="width: 235px;" id="txtPrice"
                                runat="server" />&nbsp;&nbsp;<span id="spCurrany" style="font-weight: bold;" runat="server"></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="font-weight: bold">
                            نص الإعلان :
                        </td>
                        <td colspan="2" align="right" style="text-align:right;">
                            <textarea runat="server" id="editor" name="elm1" rows="5" cols="80" style="width: 80%"
                                runat="server">
			                            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px; border-bottom: 1px solid #ccc;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="3">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="right" style="font-weight: bold; width: 100px;">
                                        رابط الفيديو :
                                    </td>
                                    <td align="right" style="padding-right: 20px;">
                                        <input type="text" style="width: 300px;" id="txtYouTubeURL" runat="server" />
                                    </td>
                                    <td align="right" style="font-size: 12px; padding-bottom: 6px;">
                                        الرجاء إدخال رابط الفيديو من اليوتيوب مثل هذا الرابط : http://www.youtube.com/watch?v=youtubeID
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="font-weight: bold;">
                                        صور الإعلان
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:FileUpload ID="file_upload" class="multi" runat="server" accept="png|jpg" maxlength="6" />
                                        <asp:Label ID="lblMessage" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="right" id="imgAdsImage" runat="server">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;">
                        </td>
                    </tr>
                    <tr style="background-color: #f5f5f5; height: 50px; border: 1px solid #ccc;">
                        <td>
                            &nbsp;
                        </td>
                        <td style="height: 30px;" align="right">
                            <asp:Button ID="btnAddNewAds" runat="server" ValidationGroup="AddAds" CssClass="btnClass"
                                Text="إضافة الإعلان" OnClick="btnAddNewAds_Click" />
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
