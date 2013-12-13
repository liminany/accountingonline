<%@ Page Title="موقع سماء العرب - تسجيل مستخدم جديد" MetaDescription="موقع سماء العرب - تسجيل مستخدم جديد - ArabiSky.com"
    Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="signup.aspx.cs"
    Inherits="signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="height: 30px; float: right;">
                <a href='/'>سوق سماء العرب </a>»&nbsp;تسجيل حساب جديد في سماء العرب
            </div>
            <div style="clear: both;">
            </div>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="height: 20px;">
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <div>
                            <div id="arabiSky-signInSignUpBlockInner" style="width: 700px; height: 450px;">
                                <div id="arabiSky-signUpBlock">
                                    <h2>
                                        تسجيل حساب جديد في سماء العرب
                                    </h2>
                                    <div style="height: 20px; clear: both;">
                                    </div>
                                    <div style="float: right">
                                        <div class="singInTextField" style="text-align: right;">
                                            <label>
                                                الإسم :<asp:RequiredFieldValidator runat="server" ID="rfvUserFullName" Font-Bold="true"
                                                    Display="Dynamic" ControlToValidate="txtUserFullName">الرجاء إدخال الإسم</asp:RequiredFieldValidator>
                                            </label>
                                            <input type="text" name="userFullName" runat="server" style="width: 300px; height: 30px;"
                                                id="txtUserFullName" value="" size="40" class="singinTextBox" />
                                        </div>
                                        <div class="singInTextField" style="text-align: right;">
                                            <label>
                                                البريد الإلكتروني :<asp:RequiredFieldValidator runat="server" ID="rfvEmailAddress"
                                                    Font-Bold="true" Display="Dynamic" ControlToValidate="email">الرجاء إدخال البريد الإلكتروني</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revEmailAddress" runat="server" Font-Bold="true"
                                                    ControlToValidate="email" Display="Dynamic" ErrorMessage="RegularExpressionValidator"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">الرجاء إدخال البريد الإلكتروني بالشكل الصحيح</asp:RegularExpressionValidator>
                                            </label>
                                            <input type="text" name="email" runat="server" style="width: 300px; height: 30px;"
                                                id="email" value="" size="40" class="singinTextBox">
                                        </div>
                                        <div class="singInTextField" style="text-align: right;">
                                            <label>
                                                كلمة المرور :<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="password"
                                                    Font-Bold="true" Display="Dynamic" ErrorMessage="الرجاء إدخال كلمة المرور"></asp:RequiredFieldValidator></label>
                                            <input type="password" style="padding-left: 20px; width: 287px; height: 30px;" name="password"
                                                runat="server" id="password" value="" maxlength="15" class="singinTextBox" autocomplete="off">
                                        </div>
                                        <div class="singInTextField" style="text-align: right;">
                                            <label>
                                                تأكيد كلمة المرور :<asp:CompareValidator ID="cv" runat="server" ErrorMessage="تأكيد كلمة المرور غير مطابقة لكلمة المرور"
                                                    Display="Dynamic" ControlToCompare="password" ControlToValidate="re_password"
                                                    Font-Bold="true"></asp:CompareValidator><asp:RequiredFieldValidator Font-Bold="true"
                                                        ID="RequiredFieldValidator1" runat="server" ControlToValidate="re_password" Display="Dynamic"
                                                        ErrorMessage="الرجاء إدخال تأكيد كلمة المرور"></asp:RequiredFieldValidator></label>
                                            <input type="password" style="padding-left: 20px; width: 287px; height: 30px;" name="re_password"
                                                id="re_password" runat="server" value="" maxlength="15" class="singinTextBox"
                                                autocomplete="off">
                                        </div>
                                        <div id="div_UserMessage" runat="server" style="font-weight: bold; font-size: 18px;
                                            height: 40px; text-decoration: underline; clear: both;">
                                        </div>
                                        <div class="singInTextField" style="float: right;">
                                            <asp:Button ID="btnSubmit" runat="server" Text="تسجيل" CssClass="singinBtn" OnClick="btnSubmit_Click" />
                                        </div>
                                    </div>
                                    <div style="float: right; width: 80px; border-left: 1px dashed #00629e; height: 350px;">
                                    </div>
                                    <div style="float: left; margin-left: 27px; margin-top: 130px;">
                                        <img src="images/connect-facebook.png" alt="ArabiSky - login By Facebook" onclick="loginByFacebook();" style="cursor: pointer;" />
                                        <script type="text/javascript">
                                            window.fbAsyncInit = function () {
                                                FB.init({ appId: '172727259569815',
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
                                            } ());

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
                                                var loc = '/facebookServicePage?action=newUser';
                                                if (loc.indexOf('?') > -1)
                                                    window.location = loc + '&authprv=facebook&access_token=' + response.authResponse.accessToken;
                                                else
                                                    window.location = loc + '?authprv=facebook&access_token=' + response.authResponse.accessToken;
                                            }
                                        </script>
                                    </div>
                                </div>
                            </div>
                            <div class="signupTextBold">
                                <h1>
                                    هل لديك حساب مسبقا <a href="login">تسجيل دخول من هنا</a></h1>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="height: 10px;">
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="text-align: center;">
                            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                            <!-- ArabiSky_Default_Top -->
                            <ins class="adsbygoogle" style="display: inline-block; width: 728px; height: 90px"
                                data-ad-client="ca-pub-7196218955155134" data-ad-slot="3354257605"></ins>
                            <script>                                (adsbygoogle = window.adsbygoogle || []).push({});</script>
                        </div>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
