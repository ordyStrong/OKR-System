<%@ Page Title="" Language="C#" MasterPageFile="~/OKRMain.Master" AutoEventWireup="true" CodeBehind="PersonTarget.aspx.cs" Inherits="OKR_System_Practice.PersonTarget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Repeater ID="PersonTargetRepeater" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="newTargetCon">
                <div class="conInner">
                    <label>group name :</label>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("groupId") %>'></asp:Label>
                    <%-- groupId--%>
                </div>

                <div class="conInner">

                    <label>creater :</label>
                    <asp:Label ID="createrNameLabel" runat="server" Text='<%# Eval("createrName") %>'>></asp:Label>
                    
                    <%-- createrName--%>
                </div>

                <div class="conInner">
                    <label>Object Name :</label>
                    <asp:Label ID="targetNameTextBoxLabel" runat="server" Text='<%# Eval("targetName") %>'>></asp:Label>
                    
                    <%--targetName--%>
                </div>
                <div class="conInner">
                    <label>start date :</label>
                    <asp:Label ID="startDateTextBoxLabel" runat="server" Text='<%# Eval("startDate") %>'>></asp:Label>
                    

                    <%-- startDate--%>
                </div>
                <div class="conInner">
                    <label>estimate completion date :</label>
                    
                    <asp:Label ID="estimateCompletionDateTextBoxLabel" runat="server" Text='<%# Eval("estimateCompletionDate") %>'>></asp:Label>
                </div>

                <div class="conInner">
                    <label>key project1 :</label>
                    <asp:Label ID="subTargetName1TextBoxLabel" runat="server" Text='<%# Eval("subTargetName1") %>'>></asp:Label>
                    
                    <%--subTargetName1--%>
                    <label>completion1 % :</label>
                    <asp:TextBox ID="subTargetFinished1TextBox" Text='<%# Eval("subTargetFinished1") %>' runat="server"  Width="100px" />
                    <%--subTargetFinished1--%>

                    <label>%  </label>

                </div>
                <div class="conInner">
                </div>

                <div class="conInner">
                    <label>key project2 :</label>
                    
                     <asp:Label ID="subTargetName2TextBoxLabel" runat="server" Text='<%# Eval("subTargetName2") %>'>></asp:Label>
                    <%-- subTargetName2--%>

                    <label>completion2 % :</label>
                    <asp:TextBox ID="subTargetFinished2TextBox" Text='<%# Eval("subTargetFinished2") %>' runat="server"  Width="100px" />
                    <%--subTargetFinished2--%>

                    <label>%  </label>

                </div>

                <div class="conInner">
                    <label>reference :</label>
                    <asp:Label ID="fileNameLb" runat="server" Text='<%# Eval("referenceName") %>'></asp:Label>
                    
                </div>


                </div>
                <div class="conInner">
                    <br />
                    <asp:Button ID="UpdateButton" runat="server"  Text="更新" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                    <asp:Button ID="CancelButton" runat="server"  Text="取消" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />

                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OKRSystemDbConnectionString12 %>" SelectCommand="SELECT [GroupTarget].* ,[GroupReference].* FROM [GroupTarget] left join [GroupReference] on [GroupTarget].targetId=[GroupReference].targetId where[GroupTarget].targetId=0"></asp:SqlDataSource>

</asp:Content>
