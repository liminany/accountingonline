<%@ Page Title="سوق سماء العرب | إتصل بنا و إرسال رسالة للدعم الفني" MetaDescription="سوق سماء العرب | ArabiSky.com | إتصل بنا و إرسال رسالة للدعم الفني" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="height: 30px; float: right;">
                <a href='/'>سوق سماء العرب </a>» <span>إتصل بنا</span>
            </div>
            <div style="clear: both;">
            </div>
            <div style="width: 100%; height: auto;">
                <div>
                    <div class="arabiSky-indexHeadingLeftCurve">
                    </div>
                    <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                        <a href="" title="Education & Learning" style="color: #111111; font-size: 20px;"
                            runat="server" id="spAdsTitle">إتصل بنا</a>
                    </div>
                    <div class="arabiSky-indexHeadingRightCurve">
                    </div>
                </div>
                <div style="clear: both;">
                </div>
                <div>
                    <div style="float: right; border: 1px solid #ccc; height: auto; width: 933px; margin-right: 10px; text-align: right; padding-right: 20px; padding-top: 15px; padding-left: 20px;">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="line-height: 30px;">نشكر لكم تواصلكم مع فريق سوق سماء العرب، كما نشكركم على زيارتكم لصفحات الموقع وثقتكم
                                    الغالية به، وهي الثقة التي نعتز بها كثيرا، وتدفعنا للعمل المتواصل لتقديم
                                    <br />
                                    المادة الممتعة المتميزة بالمهنية والمصداقية على مدار اليوم من خلال مختلف صفحات الموقع.
                                    هذه الصفحة تقدم لكم طرقا مختلفة للتواصل معنا: نرحب بتعليقاتكم واقتراحاتكم وشكاواكم
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="freecontactform" style="background-image: url(images/free-form-background-grey.jpg); background-repeat: repeat-x">
                                        <tbody>
                                            <tr>
                                                <td colspan="3" style="font-weight: bold; width: 110px;">
                                                    <div class="freecontactformmessage">
                                                        الخانات ذات العلامة <span class="required_star">* </span>هي إلزامية.
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="height: 10px;"></td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <label for="Full_Name" class="required">
                                                        الإسم الكريم<span class="required_star"> * </span>
                                                    </label>
                                                </td>
                                                <td valign="top">
                                                    <input type="text" name="Full_Name" runat="server" id="Full_Name" maxlength="80"
                                                        style="width: 400px" />
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvUserName" ErrorMessage="الرجاء إدخال الاسم الكريم"
                                                        ControlToValidate="Full_Name"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <label for="Email_Address" class="required">
                                                        البريد الإلكتروني<span class="required_star"> * </span>
                                                    </label>
                                                </td>
                                                <td valign="top">
                                                    <input type="text" name="Email_Address" runat="server" id="Email_Address" maxlength="100"
                                                        style="width: 400px" />
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvEmailEmpty" ErrorMessage="الرجاء إدخال البريد الالكتروني الخاص بك"
                                                        ControlToValidate="Email_Address" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="إدخال عنوان البريد الالكتروني بالشكل الصحيح"
                                                        ControlToValidate="Email_Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        Display="Dynamic"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <label for="Your_Message" class="required">
                                                        نص الرسالة<span class="required_star"> * </span>
                                                    </label>
                                                </td>
                                                <td valign="top">
                                                    <textarea style="width: 400px; height: 160px" runat="server" name="Your_Message"
                                                        id="Your_Message" maxlength="2000"></textarea>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvMessage" ErrorMessage="الرجاء إدخال نص الرسالة التي تريد ارسالها"
                                                        ControlToValidate="Your_Message"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr> 
                                            <tr>
                                                <td valign="top">&nbsp;
                                                </td>
                                                <td colspan="2">
                                                    <recaptcha:RecaptchaControl ID="recaptcha" runat="server" PublicKey="6Lc23PISAAAAAOmIdAcnaWthMMgvisMJW6ky2hwI" PrivateKey="6Lc23PISAAAAAPwaKIs3XDUytrAqxH6Yd6V61t_r" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">&nbsp;
                                                </td>
                                                <td valign="top" colspan="2">
                                                    <asp:Button runat="server" Text="إرسال الرسالة" ID="btnSendMessage" Style="width: 150px; border: 0px; cursor: pointer; width: 180px; background: #ededed; border-top: 2px solid #f9ae4c; border-radius: 0px; margin-left: 5px; height: 29px; padding: 5px; font-size: 15px !important;"
                                                        OnClick="btnSendMessage_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;
                                                </td>
                                                <td style="height: 50px;" id="td_UserMessage" runat="server" colspan="2"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
