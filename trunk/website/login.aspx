<%@ Page Title="سوق سماء العرب | تسجيل الدخول" MetaDescription="ArabiSky | سوق سماء العرب | تسجيل الدخول حسابي الخاص في موقع سوق سماء العرب"
    Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="login.aspx.cs"
    Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server" ID="upLogin" UpdateMode="Conditional">
        <ContentTemplate>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="height: 20px;"></td>
                </tr>
                <tr>
                    <td align="center">
                        <div>
                            <div id="arabiSky-signInSignUpBlockInner" style="width: 700px; height: 300px;">
                                <div id="arabiSky-signUpBlock">
                                    <h2>تسجيل الدخول الى سوق سماء العرب
                                    </h2>
                                    <div style="height: 20px; clear: both;">
                                    </div>
                                    <div style="float: right">
                                        <div class="singInTextField" style="text-align: right;">
                                            <label>
                                                البريد الإلكتروني :
                                                <asp:RequiredFieldValidator runat="server" ID="rfvEmailAddress" Font-Bold="true"
                                                    Display="Dynamic" ControlToValidate="email">الرجاء إدخال البريد الإلكتروني</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revEmailAddress" runat="server" Font-Bold="true"
                                                    ControlToValidate="email" Display="Dynamic" ErrorMessage="RegularExpressionValidator"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">الرجاء إدخال البريد الإلكتروني بالشكل الصحيح</asp:RegularExpressionValidator></label>
                                            <input type="text" name="email" runat="server" style="width: 300px; height: 30px;"
                                                id="email" value="" size="40" class="singinTextBox">
                                        </div>
                                        <div class="singInTextField" style="text-align: right;">
                                            <label>
                                                كلمة المرور :<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="password"
                                                    Font-Bold="true" Display="Dynamic" ErrorMessage="الرجاء إدخال كلمة المرور"></asp:RequiredFieldValidator></label>
                                            <input type="password" style="padding-left: 20px; width: 287px; height: 30px;" name="password"
                                                id="password" value="" runat="server" maxlength="15" class="singinTextBox" autocomplete="off" />
                                        </div>
                                        <div class="singInTextField">
                                            <div class="floatRight">
                                                <label for="ctl00_ContentPlaceHolder1_cboxRemmberMe">
                                                    <input id="cboxRemmberMe" runat="server" type="checkbox" />&nbsp;تذكرني
                                                </label>
                                            </div>
                                            <div class="floatLeft" style="float: right; margin-right: 180px; margin-top: 5px;">
                                                <a href="forgetPassword" class="forgotPass">نسيت كلمة المرور</a>
                                            </div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                        <div style="height: 20px; clear: both; font-weight: bolder; color: Red;" id="div_UserMessage"
                                            runat="server">
                                        </div>
                                        <div class="singInTextField" style="text-align: right; margin-right: 120px;">
                                            <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" Text="دخول" CssClass="singinBtn" />
                                        </div>
                                    </div>
                                    <div style="float: right; width: 80px; border-left: 1px dashed #00629e; height: 200px;">
                                    </div>
                                    <div style="float: left; margin-left: 27px; margin-top: 60px;">
                                        <img src="images/connect-facebook.png" alt="ArabiSky - login By Facebook" onclick="loginByFacebook();" style="cursor: pointer;" />
                                        <script type="text/javascript">
                                            window.fbAsyncInit = function () {
                                                FB.init({
                                                    appId: '172727259569815',
                                                    status: true, // check login status
                                                    cookie: true, // enable cookies to allow the server to access the session
                                                    xfbml: true, // parse XFBML
                                                    oauth: true // enable OAuth 2.0
                                                });
                                            };
                                            (function () {
                                                var e = document.createElement('script'); e.async = true;
                                                e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
                                                document.getElementById('fb-root').appendChild(e);
                                            }());

                                            function loginByFacebook() {
                                                FB.login(function (response) {
                                                    if (response.authResponse) {
                                                        FacebookLoggedIn(response);
                                                    } else {
                                                        console.log('User cancelled login or did not fully authorize.');
                                                    }
                                                }, { scope: 'user_birthday,user_about_me,user_hometown,user_location,email,publish_stream' });
                                            }

                                            function FacebookLoggedIn(response) {
                                                var loc = '/facebookServicePage?action=login';
                                                if (loc.indexOf('?') > -1)
                                                    window.location = loc + '&authprv=facebook&access_token=' + response.authResponse.accessToken;
                                                else
                                                    window.location = loc + '?authprv=facebook&access_token=' + response.authResponse.accessToken;
                                            }
                                        </script>
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
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
