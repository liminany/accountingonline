<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="fb-root">
    </div>
    <script src="http://connect.facebook.net/en_US/all.js"></script>
    <p>
        <input type="button" onclick="sendRequestToRecipients(); return false;" value="Send Request to Users Directly" />
        <input type="text" value="User ID" name="user_ids" />
    </p>
    <p>
        <input type="button" onclick="sendRequestViaMultiFriendSelector(); return false;"
            value="Send Request to Many Users with MFS" />
    </p>
    <script>
      FB.init({
        appId  : '172727259569815',
      });

      function sendRequestToRecipients() {
        var user_ids = document.getElementsByName("user_ids")[0].value;
        FB.ui({method: 'apprequests',
          message: 'XXXXXXX',
          to: user_ids, 
        }, requestCallback);
      }

      function sendRequestViaMultiFriendSelector() {
        FB.ui({method: 'apprequests',
          message: 'My Great Request'
        }, requestCallback);
      }

      function requestCallback(response) {
        // Handle callback here
      }
    </script>
    </form>
</body>
</html>
