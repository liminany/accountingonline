<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>jQuery Upload multiple files in asp.net</title>
    <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="jquery.MultiFile.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="file_upload" class="multi" runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" /><br />
        <asp:Label ID="lblMessage" runat="server" />
    </div>
    </form>
</body>
</html>
