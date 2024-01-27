<%@ Page Title="" Language="C#" MasterPageFile="~/OKRMain.Master" AutoEventWireup="true" CodeBehind="PersonTarget.aspx.cs" Inherits="OKR_System_Practice.PersonTarget" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h2>My Targets</h2>
    <hr>
  <asp:Button ID="addNewTarget" runat="server"  Text="添加新目标" OnClick="addNewTarget_Click" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
    <div>


    </div>
    <asp:Repeater ID="PersonTargetRepeater" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="newTargetCon">
                </div>
                 <div class="conInner">
                    <label>ID :</label>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'>></asp:Label>
                </div>
                <div class="conInner">
                    <label>Object Name :</label>
                    <asp:Label ID="targetNameTextBoxLabel" runat="server" Text='<%# Eval("targetName") %>'>></asp:Label>
                </div>
                <div class="conInner">
                    <label>Start Date :</label>
                    <asp:Label ID="startDateTextBoxLabel" runat="server" Text='<%# Eval("startTime") %>'>></asp:Label>
                    
                </div>
                <div class="conInner">
                    <label>End Date :</label>
                    
                    <asp:Label ID="estimateCompletionDateTextBoxLabel" runat="server" Text='<%# Eval("endTime") %>'>></asp:Label>
                </div>
                    <label>Progress % :</label>
                    <asp:TextBox ID="subTargetFinished1TextBox" Text='<%# Eval("progress") %>' runat="server"  Width="100px" />
                    <label>%  </label>
                </div>
                </div>
                <div class="conInner">
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" OnClick="UpdateButton_Click" CommandArgument='<%# Eval("id") %>' Text="更新" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                    <asp:Button ID="CancelButton" runat="server"  Text="取消" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OKRSystemDbConnectionString12 %>" SelectCommand="SELECT  [Id],[userId], [targetName], [startTime], [endTime], [progress], [userName] FROM [PersonTargets] WHERE ([userName] = @userName)" ProviderName="<%$ ConnectionStrings:OKRSystemDbConnectionString12.ProviderName %>">
        <SelectParameters>
            <asp:SessionParameter Name="userName" SessionField="accountMail" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
