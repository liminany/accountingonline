<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="mail.aspx.cs" Inherits="mail" %>

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
        function funSendEUserEmail() {
            if (document.getElementById("td_SendEmail").style.display == "none") {
                document.getElementById("td_SendEmail").style.display = "";
            }
            else {
                document.getElementById("td_SendEmail").style.display = "none";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField runat="server" ID="hfUserID" Value="0" />
    <asp:HiddenField runat="server" ID="hfSendToUserID" Value="0" />
    <div style="height: 30px; float: right;">
        <a href='/'>سوق سماء العرب </a>»&nbsp;صندوق الرسائل الخاصة
    </div>
    <div style="clear: both;">
    </div>
    <div style="width: 100%; height: auto;">
        <div>
            <div class="arabiSky-indexHeadingLeftCurve">
            </div>
            <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                <a href="" title="Education & Learning" style="color: #111111; font-size: 20px;"
                    id="spMessageTitle" runat="server"></a>&nbsp;<span></span>
            </div>
            <div class="arabiSky-indexHeadingRightCurve">
            </div>
        </div>
        <div style="clear: both;">
        </div>
        <div>
            <div style="border: 1px solid #ccc; height: auto; width: 933px; margin-right: 10px;
                text-align: center; padding-right: 20px; padding-top: 15px; padding-left: 20px;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr style="height: 100px;">
                        <td align="right" style="width: 80px;">
                            <a id="ahrefUserProfile" runat="server">
                                <img style="border: 0px;" runat="server" id="imgUserProfile" src="images/ArabiSkyUnknowUser.png"
                                    width="70" height="70" alt="ArabiSky" />
                            </a>
                        </td>
                        <td align="right">
                            <span id="spUserFullName" runat="server" style="font-weight: bold;"></span>
                        </td>
                        <td align="left" style="padding-left: 20px;">
                            <span runat="server" id="spMessageDateTime"></span>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom: 1px solid #ccc;" colspan="3">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="right" dir="ltr">
                            <div dir="ltr" style="overflow-y: scroll; height: 100px; text-align: right; float: right;
                                padding-right: 10px;" id="div_EmailBody" runat="server">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 30px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom: 1px solid #ccc;" colspan="3">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 20px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 30px;">
                            <input type="button" value="رد" class="btnClass" onclick="funSendEUserEmail()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 20px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="right" style="display: none;" id="td_SendEmail">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        عنوان الرسالة :
                                    </td>
                                    <td colspan="2" align="right">
                                        <input type="text" id="txtMessageTitle" runat="server" style="width: 400px;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        نص الرسالة :
                                    </td>
                                    <td colspan="2" align="right">
                                        <textarea runat="server" id="editor" name="elm1" rows="5" cols="80" style="width: 80%">
			                            </textarea>
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
                                        <asp:Button ID="btnSendMessage" runat="server" CssClass="btnClass" Text="إرسال" OnClick="btnSendMessage_Click" />
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
