<%@ Page Title="موقع سماء العرب - تسجيل مستخدم جديد" MetaDescription="موقع سماء العرب - تسجيل مستخدم جديد - ArabiSky.com"
    Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="signup.aspx.cs"
    Inherits="signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                    <div id="arabiSky-signInSignUpBlockInner">
                        <div id="arabiSky-signUpBlock">
                            <h2>
                                تسجيل حساب جديد في سماء العرب
                            </h2>
                            <div style="height: 20px; clear: both;">
                            </div>
                            <div class="singInTextField" style="text-align: right;">
                                <label>
                                    البريد الإلكتروني :<asp:RequiredFieldValidator runat="server" ID="rfvEmailAddress"
                                        Font-Bold="true" Display="Dynamic" ControlToValidate="email">الرجاء إدخال البريد الإلكتروني</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revEmailAddress" runat="server" Font-Bold="true"
                                        ControlToValidate="email" Display="Dynamic" ErrorMessage="RegularExpressionValidator"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">الرجاء إدخال البريد الإلكتروني بالشكل الصحيح</asp:RegularExpressionValidator>
                                </label>
                                <input type="text" name="email" runat="server" style="width: 490px; height: 30px;"
                                    id="email" value="" size="40" class="singinTextBox">
                            </div>
                            <div class="singInTextField" style="text-align: right;">
                                <label>
                                    كلمة المرور :<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="password"
                                        Font-Bold="true" Display="Dynamic" ErrorMessage="الرجاء إدخال كلمة المرور"></asp:RequiredFieldValidator></label>
                                <input type="password" style="padding-left: 20px; width: 475px; height: 30px;" name="password"
                                    runat="server" id="password" value="" maxlength="15" class="singinTextBox" autocomplete="off">
                            </div>
                            <div class="singInTextField" style="text-align: right;">
                                <label>
                                    تأكيد كلمة المرور :<asp:CompareValidator ID="cv" runat="server" ErrorMessage="تأكيد كلمة المرور غير مطابقة لكلمة المرور"
                                        Display="Dynamic" ControlToCompare="password" ControlToValidate="re_password"
                                        Font-Bold="true"></asp:CompareValidator><asp:RequiredFieldValidator Font-Bold="true"
                                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="re_password" Display="Dynamic"
                                            ErrorMessage="الرجاء إدخال تأكيد كلمة المرور"></asp:RequiredFieldValidator></label>
                                <input type="password" style="padding-left: 20px; width: 475px; height: 30px;" name="re_password"
                                    id="re_password" runat="server" value="" maxlength="15" class="singinTextBox"
                                    autocomplete="off">
                            </div>
                            <div id="div_UserMessage" runat="server" style="font-weight: bold; font-size: 18px;
                                height: 40px; text-decoration: underline; clear: both;">
                            </div>
                            <div class="singInTextField">
                                <asp:Button ID="btnSubmit" runat="server" Text="تسجيل" CssClass="singinBtn" OnClick="btnSubmit_Click" />
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
            <td style="height:10px;"></td>
        </tr>
        <tr>
            <td>
                <div style="text-align: center;">
                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <!-- ArabiSky_Default_Top -->
                    <ins class="adsbygoogle" style="display: inline-block; width: 728px; height: 90px"
                        data-ad-client="ca-pub-7196218955155134" data-ad-slot="3354257605"></ins>
                    <script>                        (adsbygoogle = window.adsbygoogle || []).push({});</script>
                    <%--<div style="width:728px;height:90px;background-color:Red;"></div>--%>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
