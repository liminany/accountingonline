<%@ Page Title="سوق سماء العرب | إستعادة كلمة المرور" MetaDescription="ArabiSky | سوق سماء العرب | إسترجاع كلمة المرور الخاصة بالمستخدم" Language="C#" MasterPageFile="~/master.master"
    AutoEventWireup="true" CodeFile="forgetPassword.aspx.cs" Inherits="forgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="height: 30px; float: right;">
                <a href='/'>سوق سماء العرب </a>»&nbsp;إستعادة كلمة السر
            </div>
            <div style="clear: both;">
            </div>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="height: 20px;">
                    </td>
                </tr>
                <tr id="trForgetPassword" runat="server">
                    <td align="center">
                        <div>
                            <div id="arabiSky-signInSignUpBlockInner">
                                <div id="arabiSky-signUpBlock">
                                    <h2>
                                        إستعادة كلمة السر
                                    </h2>
                                    <div style="height: 7px; clear: both;">
                                    </div>
                                    <div style="text-align: right;">
                                        من فضلك ادخل بريدك الإلكتروني وسنرسل لك كلمة السر.
                                    </div>
                                    <div style="height: 12px; clear: both;">
                                    </div>
                                    <div class="singInTextField" style="text-align: right;">
                                        <label>
                                            البريد الإلكتروني :
                                            <asp:RequiredFieldValidator runat="server" ID="rfvEmailAddress" Font-Bold="true"
                                                Display="Dynamic" ControlToValidate="email">الرجاء إدخال البريد الإلكتروني</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revEmailAddress" runat="server" Font-Bold="true"
                                                ControlToValidate="email" Display="Dynamic" ErrorMessage="RegularExpressionValidator"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">الرجاء إدخال البريد الإلكتروني بالشكل الصحيح</asp:RegularExpressionValidator></label>
                                        <input type="text" name="email" style="width: 490px; height: 30px;" id="email" value=""
                                            runat="server" size="40" class="singinTextBox" />
                                    </div>
                                    <div style="height: 20px; clear: both;">
                                    </div>
                                    <div class="singInTextField">
                                        <asp:Button ID="btnSendEmailAddress" runat="server" CssClass="singinBtn" Text="إرسال كلمة السر"
                                            OnClick="btnSendEmailAddress_Click" />
                                    </div>
                                </div>
                            </div>
                            <div style="height: 10px; clear: both;">
                            </div>
                            <div style="font-size: 17px; font-weight: bold;">
                                <a href="signup">مستخدم جديد</a> | <a href="login">تسجيل دخول</a>
                            </div>
                            <div style="height: 10px; clear: both;">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr id="trForgetPasswordUseMessage" runat="server" style="display: none;">
                    <td>
                        <div id="content">
                            <!-- Dashboard Main Starts here -->
                            <div class="textSeperator">
                            </div>
                            <div class="textSeperator">
                            </div>
                            <div class="textSeperator">
                            </div>
                            <div class="textSeperator">
                            </div>
                            <div style="border: 2px solid #FFF7E2;">
                                <div class="yellow_bg" style="padding: 4px; width: 550;">
                                    <span class="text1"><font class="error">ملاحظة: </font><strong id="div_UserMessageTitle"
                                        runat="server"></strong></span>
                                </div>
                                <div class="textSeperator">
                                </div>
                                <div class="text1" style="padding: 4px; width: 600px;" id="div_UserMessageBody" runat="server">
                                </div>
                            </div>
                            <!-- Dashboard Main Ends here -->
                            <div class="clear-all">
                            </div>
                            <!-- Premium Ads Bottom Starts here -->
                            <!-- Premium Ads Bottom Ends here -->
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="height: 15px;">
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <div style="text-align: center;">
                           <div>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
