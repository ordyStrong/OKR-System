<%@ Page Title="" Language="C#" MasterPageFile="~/OKRMain.Master" AutoEventWireup="true" CodeBehind="GroupTargetAdd.aspx.cs" Inherits="OKR_System_Practice.GroupTargetAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/Jquery172.js"></script>
    <script src="js/addTarget.js"></script>
    <link href="css/targetAdd.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="newTargetCon">
        <div class="conInner">
            <label>group name :</label>
            <asp:DropDownList ID="groupIdDDL" runat="server">
            </asp:DropDownList>
            <%-- groupId--%>
        </div>

        <div class="conInner">

            <label>creater :</label>
            <asp:TextBox ID="createrNameTextBox" Enabled="false" runat="server" Width="100px" />
            <%-- createrName--%>
        </div>

        <div class="conInner">
            <label>Object Name :</label>
            <asp:TextBox ID="targetNameTextBox" runat="server" Width="100px" />
            <%--targetName--%>
        </div>
        <div class="conInner">
            <label>start date :</label>

            <asp:TextBox ID="startDateTextBox" ClientIDMode="Static" OnClick="showCalendar()" runat="server" Width="100px" OnTextChanged="startDateTextBox_TextChanged" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="startDateTextBox" ValidationGroup="add"  runat="server" ErrorMessage="this is Required"></asp:RequiredFieldValidator>
            <asp:Calendar ID="Calendar1" ClientIDMode="Static" Style="display: none" OnSelectionChanged="Calendar1_SelectionChanged" runat="server"></asp:Calendar>
            <%-- startDate--%>
        </div>
        <div class="conInner">


            <label>estimate completion date :</label>
            <asp:TextBox ID="estimateCompletionDateTextBox" ClientIDMode="Static" OnClick="showCalendar2()" runat="server" Width="100px" OnTextChanged="estimateComletionDateTextBox_TextChanged" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="estimateCompletionDateTextBox" ValidationGroup="add"  runat="server" ErrorMessage="this is Required"></asp:RequiredFieldValidator>

            <asp:Calendar ID="Calendar2" ClientIDMode="Static" Style="display: none" OnSelectionChanged="Calendar2_SelectionChanged" runat="server"></asp:Calendar>
            <%--estimateComletionDate--%>
        </div>

        <div class="conInner">
            <label>key project1 :</label>
            <asp:TextBox ID="subTargetName1TextBox" runat="server" Width="100px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="subTargetName1TextBox" ValidationGroup="add"  runat="server" ErrorMessage="this is Required"></asp:RequiredFieldValidator>

            <%--subTargetName1--%>
            <label>completion1 % :</label>
            <asp:TextBox ID="subTargetFinished1TextBox" runat="server" Text="0" Width="100px" />
            <%--subTargetFinished1--%>

            <label>%  </label>

        </div>
        <div class="conInner">
        </div>

        <div class="conInner">
            <label>key project2 :</label>
            <asp:TextBox ID="subTargetName2TextBox" runat="server" Width="100px" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="subTargetName2TextBox" ValidationGroup="add"  runat="server" ErrorMessage="this is Required"></asp:RequiredFieldValidator>

            <%-- subTargetName2--%>
            
            <label>completion2 % :</label>
            <asp:TextBox ID="subTargetFinished2TextBox" runat="server" Text="0" Width="100px" />
            <%--subTargetFinished2--%>

            <label>%  </label>            
        </div>

        <div class="conInner">
            <label>reference :</label><asp:Label ID="fileNameLb" runat="server" Text=""></asp:Label>
            <%--<asp:Panel ID="newRefPanel" runat="server"></asp:Panel>--%>
            <input id="addFileBtn" type="button" value="AddFile" style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
            <div id="addFileArea" class="addFile" style="display: none">
                <label>Category : </label>
                <asp:DropDownList ID="CategoryDropDownList" runat="server">
                    <asp:ListItem Value="0">目标</asp:ListItem>
                    <asp:ListItem Value="1">议事录</asp:ListItem>
                    <asp:ListItem Value="2">技术资料</asp:ListItem>
                    <asp:ListItem Value="3">管理资料</asp:ListItem>
                    <asp:ListItem Value="4">Q&A</asp:ListItem>
                    <asp:ListItem Value="5">其他</asp:ListItem>
                </asp:DropDownList>
                <div class="fileLoad">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button ID="fileCancel" OnClick="fileCancel_Click" runat="server" Text="Cancel" />
                    <%--<input type="text"  id="text1" readonly="readonly" />
                    <input id="button1" type="button" value="select" class="button" onclick="FileUpload1.click()" />--%>
                    <%--<asp:Button ID="UpLoadButton" runat="server" OnClick="UpLoadButton_Click" Text="Add" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />--%>
                </div>
            </div>        
        </div>
        <div class="conInner">
            <br />
            <asp:Button ID="UpdateButton" runat="server" OnClick="UpdateButton_Click" CommandName="Update" Text="更新" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
            <asp:Button ID="CancelButton" runat="server" OnClick="CancelButton_Click" CommandName="Cancel" Text="取消" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
        </div>
    </div>
</asp:Content>
