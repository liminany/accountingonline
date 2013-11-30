<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="mail.aspx.cs" Inherits="mail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
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
