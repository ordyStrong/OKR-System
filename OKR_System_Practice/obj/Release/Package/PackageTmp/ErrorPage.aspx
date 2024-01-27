<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="OKR_System_Practice.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="ErrorLabelTittle" runat="server" Text="Label" ClientIDMode="Static" ></asp:Label>
        <br />
        <hr />
        <asp:Label ID="ErrorLabelContent" runat="server" Text="Label" ClientIDMode="Static"  ></asp:Label>
        <br />
        <hr />
        <asp:Label ID="ErrorLabelFoot" runat="server" Text="Label" ClientIDMode="Static"  ></asp:Label>
    </div>
    </form>
</body>
</html>
