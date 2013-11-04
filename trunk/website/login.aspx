<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td style="height: 20px;">
            </td>
        </tr>
        <tr>
            <td align="center">
                <div>
                    <div id="clickin-signInSignUpBlockInner">
                        <div id="clickin-signUpBlock">
                            <h2>
                                تسجيل الدخول الى سوق سماء العرب
                            </h2>
                            <div style="height: 20px; clear: both;">
                            </div>
                            <div class="singInTextField" style="text-align: right;">
                                <label>البريد الإلكتروني : <asp:RequiredFieldValidator runat="server" ID="rfvEmailAddress" Font-Bold="true" Display="Dynamic" ControlToValidate="email">الرجاء إدخال البريد الإلكتروني</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmailAddress" runat="server" Font-Bold="true"
                                    ControlToValidate="email" Display="Dynamic" 
                                    ErrorMessage="RegularExpressionValidator" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">الرجاء إدخال البريد الإلكتروني بالشكل الصحيح</asp:RegularExpressionValidator></label>
                                <input type="text" name="email" runat="server" style="width: 490px; height: 30px;" id="email" value=""
                                    size="40" class="singinTextBox">
                            </div>
                            <div class="singInTextField" style="text-align: right;">
                                <label>كلمة المرور :<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="password" Font-Bold="true" Display="Dynamic" ErrorMessage="الرجاء إدخال كلمة المرور"></asp:RequiredFieldValidator></label>
                                <input type="password" style="padding-left: 20px; width: 475px; height: 30px;" name="password"
                                    id="password" value="" runat="server" maxlength="15" class="singinTextBox" autocomplete="off" />
                            </div>
                            <div class="singInTextField">
                                <div class="floatRight"><label for="ctl00_ContentPlaceHolder1_cboxRemmberMe"><input id="cboxRemmberMe" runat="server" type="checkbox" />&nbsp;تذكرني </label></div>
                                <div class="floatLeft"><a href="forgetPassword" class="forgotPass">نسيت كلمة المرور</a></div>
                                
                                <div style="clear: both;">
                                </div>
                            </div>
                            <div style="height: 20px; clear: both;font-weight:bolder;color:Red;" id="div_UserMessage" runat="server">
                                </div>
                            <div class="singInTextField">
                                <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" Text="دخول" CssClass="singinBtn" />
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
