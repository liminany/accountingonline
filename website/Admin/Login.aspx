<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Login</title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/reset.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/animate.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center">
                <img src="../images/ArabiSkyLogo.png" style="height: 90px;width: 98px;"  alt="arabisky.com" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center">
                <div id="container" style="text-align: left;">
                    <label for="username">
                        إسم المستخدم:</label>
                    <input type="text" id="username" name="username" runat="server" autocomplete="off" />
                    <label for="password">
                        كلمة المرور:</label>
                    <p>
                        <input type="password" id="password" runat="server" name="password" autocomplete="off">
                        <div id="lower" style="text-align: left;">
                            <asp:Button ID="btnLogin" runat="server" Text="دخول" OnClick="btnLogin_Click" />
                        </div>
                </div>
                <div style="clear: both; height: 20px;">
                </div>
                <div id="div_ErrorCode" runat="server" style="color: Red;">
                </div>
            </td>
        </tr>
        <tr>
            <td style="height: 20px;">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center">
                <a href="http://arabisky.com/">Arabisky</a> © 2013-2013 جميع الحقوق محفوظة.
              <br />  الإصدار 1.0.0
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
