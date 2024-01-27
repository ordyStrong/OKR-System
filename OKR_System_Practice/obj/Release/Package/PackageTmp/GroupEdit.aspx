<%@ Page Title="" Language="C#" MasterPageFile="~/OKRMain.Master" AutoEventWireup="true" CodeBehind="GroupEdit.aspx.cs" Inherits="OKR_System_Practice.GroupEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .edit1 {
             background-color: #fff;
    padding-left:30px;
    padding-top:10px;
    padding-bottom:10px;
    border-radius:8px;
    margin-top:20px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>Group Information Edit</h2>
        <hr  />
    </div>
    <div class="edit1">
        <asp:ListView ID="ListView1" InsertItemPosition="LastItem" runat="server" DataKeyNames="groupId" ItemPlaceholderID="groupEditHolder" DataSourceID="SqlDataSource1">
            <LayoutTemplate>
                <table class="groupEdit" style="table-layout: fixed; width: 800px; text-align: center">
                    <thead>
                        <tr>
                            <th runat="server">groupId</th>
                            <th runat="server">groupName</th>
                            <th runat="server">groupFunction</th>
                            <th runat="server">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder ID="groupEditHolder" runat="server" />
                        <%--<tr id="ItemHolder" runat="server"></tr>--%>
                    </tbody>
                </table>
            </LayoutTemplate>

            <ItemTemplate>
                <tr style="">

                    <td>
                        <asp:Label ID="userIdLabel" runat="server" Text='<%# Eval("groupId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("groupName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("groupFunction") %>' />
                    </td>

                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete"   Text="删除" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                    </td>
                </tr>
            </ItemTemplate>

            <InsertItemTemplate>
                <tr style="">

                    <td>&nbsp;</td>
                   
                    <td>
                        <asp:TextBox ID="groupNameTextBox_insert" runat="server" Text='<%# Bind("groupName") %>' Width="100px" />
                    </td>
                    <td>
                        <asp:TextBox ID="groupFunctionTextBox_insert" runat="server" Text='<%# Bind("groupFunction") %>' Width="100px" />

                    </td>


                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                    </td>

                </tr>

            </InsertItemTemplate>

            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="userIdLabel1" runat="server" Text='<%# Eval("groupId") %>' Width="100px" />
                    </td>
                    <td>
                        <asp:TextBox ID="userMailTextBox" runat="server" Text='<%# Bind("groupName") %>' Width="100px" />
                    </td>
                    <td>
                        <asp:TextBox ID="userPSWTextBox" runat="server" Text='<%# Bind("groupFunction") %>' Width="100px" />
                    </td>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新"  Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                    </td>
                </tr>
            </EditItemTemplate>

            <%-- <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                </td>
                <td>
                    <asp:Label ID="userIdLabel" runat="server" Text='<%# Eval("userId") %>' />
                </td>
                <td>
                    <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("userName") %>' />
                </td>
                <td>
                    <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                </td>
                <td>
                    <asp:Label ID="userRoleLabel" runat="server" Text='<%# Eval("userRole") %>' />
                </td>
                <td>
                    <asp:Label ID="userMailLabel" runat="server" Text='<%# Eval("userMail") %>' />
                </td>
                <td>
                    <asp:Label ID="userPSWLabel" runat="server" Text='<%# Eval("userPSW") %>' />
                </td>
                <td>
                    <asp:Label ID="groupIdLabel" runat="server" Text='<%# Eval("groupId") %>' />
                </td>
                <td>
                    <asp:Label ID="userGroupRoleLabel" runat="server" Text='<%# Eval("userGroupRole") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>--%>


            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>no data。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>

            <SelectedItemTemplate>
                <tr style="">

                    <td>
                        <asp:Label ID="userIdLabel" runat="server" Text='<%# Eval("groupId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("groupName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("groupFunction") %>' />
                    </td>
                    <td>


                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OKRSystemDbConnectionString10 %>" 
            DeleteCommand="DELETE FROM [OKRGroup] WHERE [groupId] = @groupId" 
            InsertCommand="INSERT INTO [OKRGroup] ([groupName], [groupFunction]) VALUES (@groupName, @groupFunction)" 
            SelectCommand="SELECT * FROM [OKRGroup]" 
            UpdateCommand="UPDATE [OKRGroup] SET [groupName] = @groupName, [groupFunction] = @groupFunction WHERE [groupId] = @groupId">
            <DeleteParameters>
                <asp:Parameter Name="groupId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="groupName" Type="String" />
                <asp:Parameter Name="groupFunction" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="groupName" Type="String" />
                <asp:Parameter Name="groupFunction" Type="String" />
                <asp:Parameter Name="groupId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
