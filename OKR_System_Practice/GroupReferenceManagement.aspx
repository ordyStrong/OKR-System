<%@ Page Title="" Language="C#" MasterPageFile="~/OKRMain.Master" AutoEventWireup="true" CodeBehind="GroupReferenceManagement.aspx.cs" Inherits="OKR_System_Practice.GroupReferenceManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="groupDoc">
        <div class="fileLoad">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="UpLoadButton" runat="server" OnClick="UpLoadButton_Click1" Text="UpLoad" />
        </div>

        <div class="fileList">
           



        </div>

    </div>

</asp:Content>
