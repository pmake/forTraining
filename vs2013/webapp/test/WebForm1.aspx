<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="test.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxGridView ID="ASPxGridView1" runat="server">
        </dx:ASPxGridView>
        <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server">
            <views>
                <weekview enabled="false">
                </weekview>
                <fullweekview enabled="true">
                </fullweekview>
            </views>
        </dxwschs:ASPxScheduler>
    
    </div>
    </form>
</body>
</html>
