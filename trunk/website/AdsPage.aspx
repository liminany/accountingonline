<%@ Page Title="سوق سماء العرب | إضافة إعلان جديد" Language="C#" MetaDescription="سوق سماء العرب | ArabiSky.com | إضافة إعلان جديد"
    MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="AdsPage.aspx.cs"
    Inherits="AdsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            CKEDITOR.replace('ctl00_ContentPlaceHolder1_editor1',
	        {
	            language: 'ar'
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
    <asp:HiddenField runat="server" ID="hfEditImageAds" Value="0" />
    
    <div style="width:100%">
        <div style="height: 30px; float: right;width:20%">
        <a href='/'>سوق سماء العرب </a>» <span id="spPageTitle" runat="server"></span>
    </div> 
        <div style="width: 74%; float: left;">
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
    <div style="clear:both;"></div>
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
            <div style="border: 1px solid #ccc; height: auto; width: 933px; margin-right: 10px; text-align: center; padding-right: 20px; padding-top: 15px; padding-left: 20px; display: none;"
                id="divSoicalMedia" runat="server">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center">
                            <h1>قم بنشر إعلانك على شبكات التواصل الاجتماعي ليضاعف نسبة المشاهدات</h1>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30px;"></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table border="0" width="40%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center">
                                        <a target="_blank" href="http://www.facebook.com/sharer/sharer.php?u=<%= AdsURL %>">
                                            <img src="img/socialMedia/facebook.png" /></a>
                                    </td>
                                    <td align="center">
                                        <a target="_blank" href="https://twitter.com/intent/tweet?url=<%= AdsURL %>&text=<%= AdsText %>">
                                            <img src="img/socialMedia/twitter.png" /></a>
                                    </td>
                                    <td align="center">
                                        <a target="_blank" href="https://plus.google.com/share?url=<%= AdsURL %>">
                                            <img src="img/socialMedia/googleplus.png" /></a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 50px;"></td>
                    </tr>
                    <tr>
                        <td style="height: 30px;">
                            <strong>ليتم ايصال اعلانك لعدد اكبر من الناس الرجاء قم بعمل مشاركة او share </strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30px;"></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <a href="/AdsPage" style="font-size: 23px; font-weight: bolder; text-decoration: underline;">انقر هنا لإضافة اعلان اخر</a>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 50px;"></td>
                    </tr>
                </table>
            </div>
            <div style="float: right; border: 1px solid #ccc; height: auto; width: 933px; margin-right: 10px; text-align: center; padding-right: 20px; padding-top: 15px; padding-left: 20px; display: ;"
                id="divNewAds" runat="server">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr id="trUserMessage" runat="server" style="display: none;">
                        <td>&nbsp;
                        </td>
                        <td colspan="2" align="right">
                            <span style="font-weight: bold; font-size: 15px;" id="spUserMessages" runat="server"></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;"></td>
                    </tr>
                    <tr>
                        <td align="right" style="font-weight: bold; width: 121px;">عنوان الإعلان :
                        </td>
                        <td align="right" colspan="2">
                            <input type="text" style="width: 300px;" id="txtAdsTitle" runat="server" maxlength="100" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAdsTitle"
                                ValidationGroup="AddAds" ErrorMessage="الرجاء إدخال عنوان الإعلان"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table width="75%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="right" style="font-weight: bold">القسم :
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
                                            <td align="right" style="font-weight: bold">القسم الفرعي :
                                            </td>
                                            <td align="right" colspan="2">
                                                <asp:DropDownList ID="ddlSubCategoryName" runat="server" CssClass="arabiSky-homeSelectbox"
                                                    Style="width: 250px;">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlSubCategoryName"
                                                    ValidationGroup="AddAds" ErrorMessage="الرجاء إختيار القسم الفرعي" InitialValue="-2"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" style="font-weight: bold">البلد :
                        </td>
                        <td align="right" colspan="2">
                            <span style="font-weight: bold;" id="sp_CountryName" runat="server">الممكلة الاردنية
                                الهاشمية</span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="font-weight: bold">المدينة :
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
                        <td align="right" style="font-weight: bold">السعر :
                        </td>
                        <td colspan="2" align="right">
                            <input type="text" onkeypress="return numbersonly(event)" style="width: 235px;" id="txtPrice"
                                runat="server" />&nbsp;&nbsp;<span id="spCurrany" style="font-weight: bold;" runat="server"></span>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="font-weight: bold">نص الإعلان :
                        </td>
                        <td colspan="2" align="right" style="text-align: right;">
                            <textarea runat="server" class="ckeditor" id="editor1" name="elm1" rows="5" cols="80"
                                style="width: 80%" runat="server">
			                            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;"></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px; border-bottom: 1px solid #ccc;"></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;"></td>
                    </tr>
                    <tr>
                        <td align="right" colspan="3">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="right" style="font-weight: bold; width: 100px;">رابط الفيديو :
                                    </td>
                                    <td align="right" style="padding-right: 20px;">
                                        <input type="text" style="width: 300px;" id="txtYouTubeURL" runat="server" />
                                    </td>
                                    <td align="right" style="font-size: 12px; padding-bottom: 6px;">الرجاء إدخال رابط الفيديو من اليوتيوب مثل هذا الرابط : http://www.youtube.com/watch?v=youtubeID
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="font-weight: bold;">صور الإعلان
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:FileUpload ID="file_upload" class="multi" runat="server" accept="png|jpg|jpeg"
                                            maxlength="6" />
                                        <asp:Label ID="lblMessage" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;"></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="right" id="imgAdsImage" runat="server"></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;"></td>
                    </tr>
                    <tr style="background-color: #f5f5f5; height: 50px; border: 1px solid #ccc;">
                        <td>&nbsp;
                        </td>
                        <td style="height: 30px;" align="right">
                            <asp:Button ID="btnAddNewAds" runat="server" ValidationGroup="AddAds" CssClass="btnClass"
                                Text="إضافة الإعلان" OnClick="btnAddNewAds_Click" />
                        </td>
                        <td>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 25px;"></td>
                    </tr>
                </table>
            </div>
            <div style="clear: both; height: 10px;">
            </div>
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
</asp:Content>
