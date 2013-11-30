<%@ Page Title="سوق سماء العرب | رسائلي الخاصة" MetaDescription="ArabiSky | سوق سماء العرب | إستطلاع رسائلي الخاصة من المستخدمين" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="Inbox.aspx.cs" Inherits="Inbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function DeleteCityInfo(MessageID) {
            var r = confirm("هل انت متأكد من حذف هذه الرسالة؟")
            if (r == true) {
                DeleteMessageMethods(MessageID);
            }
            else {
                return false;
            }
        }
        function DeleteMessageMethods(MessageID) {
            PageMethods.DeleteMessageInfo(MessageID, OnDeleteMessageSucceeded, OnDeleteMessageFaild);
        }
        function OnDeleteMessageSucceeded(result) {
            if (result == "true") {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
            }
            else {
                $("#" + '<%= lbtnRefreshGV.ClientID %>').trigger('click');
            }
        }
        function OnDeleteMessageFaild(result) {
            alert("هناك خطأ في حذف الرسالة الرجاء مراجعة الدعم الفني");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfUserID" runat="server" Value="0" />
    <div style="height: 30px; float: right;">
        <a href='/'>سوق سماء العرب </a>» رسائلي
    </div>
    <div style="clear: both;">
    </div>
    <div style="width: 100%; height: auto;">
        <div>
            <div class="arabiSky-indexHeadingLeftCurve">
            </div>
            <div class="arabiSky-indexHeadingContent" style="width: 97%;">
                <span style="color: #111111; font-size: 20px;">رسائلي</span>
            </div>
            <div class="arabiSky-indexHeadingRightCurve">
            </div>
        </div>
        <div style="clear: both;">
        </div>
        <div>
            <div id="div_EmailTable" runat="server" style="border: 1px solid #ccc; height: auto; width: 973px; margin-right: 10px; text-align: center;">
                <table class="tbMainAds" width="100%" cellpadding="0" cellspacing="0">
                    <asp:Repeater runat="server" ID="rptMyEmail">
                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th align="right" style="width: 10%; padding-right: 30px;">
                                        #
                                    </th>
                                    <th align="right" style="width: 20%; padding-right: 30px;">
                                        إسم المرسل
                                    </th>
                                    <th style="width: 30%" align="right">
                                        عنوان الرسالة
                                    </th>
                                    <th align="center" style="width: 15%;">
                                        التاريخ
                                    </th>
                                    <th colspan="2" align="center" style="padding-left: 20px; width: 10%">
                                        الصورة
                                    </th>
                                </tr>
                            </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr style='background-color: #fff; <%# GetMessageStatus(DataBinder.Eval(Container.DataItem, "MessageFlag").ToString())%>;
                                height: 40px'>
                                <td align="right" style="width: 10%; padding-right: 30px;">
                                    <img src="images/DeleteMessage.png" width="15" height="15" title="حذف الرسالة" style="cursor: pointer;"
                                        onclick="return DeleteCityInfo(<%# DataBinder.Eval(Container.DataItem, "MessageID")%>);"
                                        alt="ArabiSky.com"/>
                                    &nbsp;
                                    <img src="images/imgReadMessage.png" width="15" height="15" title="تصفح الرسالة"
                                        style="cursor: pointer;" onclick="window.location='mail?messageID=<%# DataBinder.Eval(Container.DataItem, "MessageID")%>'"
                                        alt="ArabiSky.com" />
                                </td>
                                <td align="right" style="width: 15%; padding-right: 30px;">
                                    <%# DataBinder.Eval(Container.DataItem, "sender")%>
                                </td>
                                <td style="width: 30%" align="right">
                                    <%# DataBinder.Eval(Container.DataItem, "MessageTitle")%>
                                </td>
                                <td align="center" style="width: 15%; font-size: 13px;">
                                    <%# DataBinder.Eval(Container.DataItem, "MessageCreateDate")%>
                                </td>
                                <td align="center" style="padding-left: 20px; width: 10%">
                                    <a href="UserProfile?UserID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>">
                                        <img alt="ArabiSky.com" style="border: 0px;" src="<%# GetUserImageProfile(DataBinder.Eval(Container.DataItem, "User_Image").ToString())%>"
                                            width="30" height="30" />
                                    </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr style='background-color: #ededed; <%# GetMessageStatus(DataBinder.Eval(Container.DataItem, "MessageFlag").ToString())%>;
                                height: 40px;'>
                                <td align="right" style="width: 10%; padding-right: 30px;">
                                    <img src="images/DeleteMessage.png" width="15" height="15" title="حذف الرسالة" style="cursor: pointer;"
                                        onclick="return DeleteCityInfo('<%# DataBinder.Eval(Container.DataItem, "MessageID")%>');"
                                        alt="ArabiSky-Delete Message" />
                                    &nbsp;
                                    <img src="images/imgReadMessage.png" width="15" height="15" title="تصفح الرسالة"
                                        style="cursor: pointer;" onclick="window.location='mail?messageID=<%# DataBinder.Eval(Container.DataItem, "MessageID")%>'"
                                        alt="ArabiSky-View Message" />
                                </td>
                                <td align="right" style="width: 15%; padding-right: 30px;">
                                    <%# DataBinder.Eval(Container.DataItem, "sender")%>
                                </td>
                                <td style="width: 30%" align="right">
                                    <%# DataBinder.Eval(Container.DataItem, "MessageTitle")%>
                                </td>
                                <td align="center" style="width: 15%; font-size: 13px;">
                                    <%# DataBinder.Eval(Container.DataItem, "MessageCreateDate")%>
                                </td>
                                <td align="center" style="padding-left: 20px; width: 10%">
                                    <a href="UserProfile?UserID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>">
                                        <img alt="ArabiSky UserImage" style="border: 0px;" src="<%# GetUserImageProfile(DataBinder.Eval(Container.DataItem, "User_Image").ToString())%>"
                                            width="30" height="30" />
                                    </a>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
             <div style="text-align:center;border:1px solid #ccc;margin-right: 10px;height: 45px;padding-top: 30px;font-weight:bold;font-size:20px;" id="div_EmptyEmailTable" runat="server">
               لايوجد رسائل خاصة
            </div>
        </div>
        <div style="clear: both; height: 10px;">
        </div>
        <div style="text-align: center;">
            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
            <!-- ArabiSky_Default_Top -->
            <ins class="adsbygoogle" style="display: inline-block; width: 728px; height: 90px"
                data-ad-client="ca-pub-7196218955155134" data-ad-slot="3354257605"></ins>
            <script>                (adsbygoogle = window.adsbygoogle || []).push({});</script>
            <%--<div style="width:728px;height:90px;background-color:Red;"></div>--%>
        </div>
    </div>
    <asp:Button ID="lbtnRefreshGV" CssClass="ClassHideDiv" runat="server" Text="" Height="0px"
        Width="0px" Style="visibility: hidden" OnClick="lbtnRefreshGV_Click"></asp:Button>
</asp:Content>
