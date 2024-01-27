<%@ Page Title="" Language="C#" MasterPageFile="~/OKRMain.Master" AutoEventWireup="true" CodeBehind="addPersonTarget.aspx.cs" Inherits="OKR_System_Practice.addPersonTarget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/Jquery172.js"></script>
    <script src="js/addTarget.js"></script>
    <link href="css/targetAdd.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="newTargetCon">

        <div class="conInner">
            <label>Target Name :</label>
            <asp:TextBox ID="targetNameTextBox" runat="server" Width="100px" />
            <%--targetName--%>
        </div>
        <div class="conInner">
            <label>Target Content :</label>
            <asp:TextBox ID="targetContentTxb" runat="server" Width="100px" />
            <%--targetName--%>
        </div>
        <div class="conInner">
            <label>Start date :</label>

            <asp:TextBox ID="startDateTextBox" ClientIDMode="Static" OnClick="showCalendar()" runat="server" Width="100px" OnTextChanged="startDateTextBox_TextChanged" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="startDateTextBox" ValidationGroup="add"  runat="server" ErrorMessage="this is Required"></asp:RequiredFieldValidator>
            <asp:Calendar ID="Calendar1" ClientIDMode="Static" Style="display: none" OnSelectionChanged="Calendar1_SelectionChanged" runat="server"></asp:Calendar>
            <%-- startDate--%>
        </div>
        <div class="conInner">


            <label>End Date :</label>
            <asp:TextBox ID="estimateCompletionDateTextBox" ClientIDMode="Static" OnClick="showCalendar2()" runat="server" Width="100px" OnTextChanged="estimateComletionDateTextBox_TextChanged" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="estimateCompletionDateTextBox" ValidationGroup="add"  runat="server" ErrorMessage="this is Required"></asp:RequiredFieldValidator>

            <asp:Calendar ID="Calendar2" ClientIDMode="Static" Style="display: none" OnSelectionChanged="Calendar2_SelectionChanged" runat="server"></asp:Calendar>
            <%--estimateComletionDate--%>
        </div>

        
        <div class="conInner">
            <br />
            <asp:Button ID="UpdateButton" runat="server" OnClick="UpdateButton_Click" CommandName="Update" Text="更新" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
            <asp:Button ID="CancelButton" runat="server" OnClick="CancelButton_Click" CommandName="Cancel" Text="取消" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
        </div>
    </div>


</asp:Content>
