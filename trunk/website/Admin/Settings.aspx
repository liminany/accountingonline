<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true"
    CodeFile="Settings.aspx.cs" Inherits="Admin_Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .layer1
        {
            margin: 0;
            padding: 0;
            width: 500px;
        }
        
        .heading
        {
            color: #fff;
            padding: 3px 10px;
            cursor: pointer;
            position: relative;
            background-color: #5e5e5e;
            height: 30px;
            line-height: 30px;
            font-size: 17px;
            top: 0px;
            left: 0px;
        }
        .content
        {
            padding: 5px 10px;
            background-color: #fafafa;
            
        }
        input[type="text"]
        {
            height: 26px;
            border: 1px solid #598ede;
            padding-left: 5px;
        }
        input[type="text"]:hover
        {
            height: 26px;
            border: 1px solid #598ede;
        }
    </style>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            ExbandableControls();
        });
        function ExbandableControls() {
            jQuery(document).ready(function () {
                jQuery(".contentLog").show();
                jQuery(".content").hide();
                //toggle the componenet with class msg_body
                jQuery(".heading").click(function () {
                    jQuery(this).next(".content").slideToggle(500);
                });
                jQuery(".heading").click(function () {
                    jQuery(this).next(".contentLog").slideToggle(500);
                });
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfResetPoral" runat="server" Value="false" />
    <script type="text/javascript" language="javascript">
        var tID;
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            clearTimeout(tID);
        }
        function EndRequestHandler(sender, args) {
            ExbandableControls();
            if ($("#ctl00_ContentPlaceHolder1_hfResetPoral").val() == "true") {
                var r = confirm("To apply new changes we should make reset admin portal!")
                if (r == true) {
                    window.location = "../admin/login";
                }
            }
        }                                  
    </script>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr valign="top">
            <td>
                <!-- start id-form -->
                <table border="0" cellpadding="0" cellspacing="0" id="id-form">
                    <tbody>
                        <tr>
                            <td colspan="2" align="left">
                                <asp:Button ID="btnSaveSettings" runat="server" Width="120" Text="Save" OnClick="btnSaveSettings_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 0px;">
                                <div class="layer1">
                                    <p class="heading">
                                        إدارة الموقع
                                    </p>
                                    <div class="content" style="height: 290px; background-color: #e6e6e6; border: 1px solid #ccc;">
                                        <table width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td colspan="2" style="height: 10px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 140px;">
                                                    عنوان صفحة الموقع الرئيسية:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSiteName" Width="270" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 140px;">
                                                    شرح عن الموقع :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSiteMetaDescription" Width="270" Height="90" TextMode="MultiLine"
                                                        runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 140px;">
                                                    الكلمات الدلالية :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSiteMetaKeywords" Width="270" Height="90" TextMode="MultiLine"
                                                        runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 140px;">
                                                    حالة الموقع:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSiteStstus" runat="server">
                                                        <asp:ListItem Text="فعال" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="غير فعال" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height: 10px;">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 100px;">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- end id-form  -->
            </td>
        </tr>
    </table>
</asp:Content>
