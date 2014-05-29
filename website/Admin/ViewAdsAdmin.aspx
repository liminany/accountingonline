<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="ViewAdsAdmin.aspx.cs" Inherits="Admin_ViewAds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function funAds(varIDs) {
            if (varIDs == "1") {
                return confirm("هل تريد رفض هذا الاعلان ؟");
            }
            else {
                return confirm("هل تريد قبول هذا الاعلان ؟");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%" dir="rtl">
        <tr>
            <td id="tbl-border-left">
            </td>
            <td>
                <!--  start content-table-inner ...................................................................... START -->
                <div id="content-table-inner" style="font-weight: bold; font-size: 15px; line-height: 30px;">
                    <!--  start table-content  -->
                    <table border="2" cellpadding="0" cellspacing="0" width="100%" dir="rtl">
                        <tr>
                            <td style="padding-right: 10px;">
                                عنوان الإعلان
                            </td>
                            <td style="padding-right: 10px;">
                                <span id="AdsTitle" runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 50px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 10px;">
                                نص الإعلان
                            </td>
                            <td style="padding-right: 10px;">
                                <span id="spAdsFullDescription" runat="server"></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 50px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 10px;">
                                صور الإعلان
                            </td>
                            <td style="padding-right: 10px;">
                                <div id="div_Images" runat="server">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 50px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 10px;">
                                فيديو يوتيوب
                            </td>
                            <td style="padding-right: 10px;">
                                <div id="div_YouTubeURL" runat="server">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td style="padding-right: 10px; height: 50px;">
                                <asp:Button ID="btnRejected" runat="server" Text="رفض" Width="100" OnClientClick="return funAds('1')"
                                    OnClick="btnRejected_Click" />
                                <asp:Button ID="btnAccepted" runat="server" Text="قبول" Width="100" OnClientClick="return funAds('2')"
                                    OnClick="btnAccepted_Click" />
                                <asp:Button ID="Button3" runat="server" Text="رجوع" Width="100" OnClientClick="window.location='PinddingAds'" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <span id="sp_UserMessage" runat="server"></span>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
