<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="CS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <asp:Button ID="btnFetch" runat="server" Text="Fetch Friends" OnClick="btnFetch_Click" />
    <br />
    <asp:GridView ID="gvFriends" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:ImageField DataImageUrlField="PictureUrl" HeaderText="Picture" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
