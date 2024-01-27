<%@ Page Title="" Language="C#" MasterPageFile="~/OKRMain.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="OKR_System_Practice.UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/userManagement.css" rel="stylesheet" />

    <script src="Jquery172.js"></script>
    <script>
        $(document).ready(function () {
            $(".userInfoBtn").hover(
              function () {
                  $(this).css("background-color", "#45a049");
              },
               function () {
                   $(this).css("background-color", "#4CAF50");
               }
            );

            //$(".ddlist").val('');
        });


    </script>
    <style>
        .rred {
            color: red:;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="userInfo_tittle">User Management</h2>
    <hr />
    <div class="userInfoContent">
        <div class="contentInner">
            <%--InsertItemPosition="LastItem"--%>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" ItemPlaceholderID="ItemHolder" DataKeyNames="userId" OnItemDataBound="ListView1_ItemDataBound">
                <LayoutTemplate>
                    <table class="userManagement" style="table-layout: fixed; width: 800px; text-align: center">
                        <thead>
                            <tr>
                                <th runat="server" style="width: 50px">Id</th>
                                <th runat="server">Name</th>
                                <th runat="server">Gender</th>
                                <th runat="server">Role</th>
                                <th runat="server">Mail</th>
                                <th runat="server">PSW</th>
                                <th runat="server">Group</th>
                                <th runat="server">GroupRole</th>
                                <th runat="server">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="ItemHolder" runat="server" />
                            <%--<tr id="ItemHolder" runat="server"></tr>--%>
                        </tbody>
                    </table>
                </LayoutTemplate>

                <ItemTemplate>
                    <tr style="">

                        <td>
                            <asp:Label ID="userIdLabel" runat="server" Style="width: 50px" Text='<%# Eval("userId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("userName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="GenderLabel" runat="server" Text='<%# gender(Eval("Gender").ToString()) %>' />
                        </td>
                        <td>
                            <asp:Label ID="userRoleLabel" runat="server" Text='<%# userRole(Eval("userRole").ToString()) %>' />
                        </td>
                        <td>
                            <asp:Label ID="userMailLabel" runat="server" Text='<%# Eval("userMail") %>' />
                        </td>
                        <td>
                            <asp:Label ID="userPSWLabel" runat="server" Text='<%# Eval("userPSW") %>' />
                        </td>
                        <td>
                            <asp:Label ID="groupIdLabel" runat="server" Text='<%# Eval("groupName") %>' /><%--groupId--%>
                        </td>
                        <td>
                            <asp:Label ID="userGroupRoleLabel" runat="server" Text='<%# userGroupRole(Eval("userGroupRole").ToString()) %>' />
                        </td>

                        <td><%--CommandArgument='<%# Eval("userId") %>'--%>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" CommandArgument='<%#Eval("userId") %>' OnCommand="edditDeleteFunc" Text="删除" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                        </td>
                    </tr>
                </ItemTemplate>

                <%--    <InsertItemTemplate>
            <tr style="">

                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="userNameTextBox_insert" runat="server" Text="" Width="100px" />
                </td>
                <td>
                    <asp:TextBox ID="GenderTextBox_insert" runat="server" Text="" Width="100px" />
                </td>
                <td>
                    <asp:TextBox ID="userRoleTextBox_insert" runat="server" Text="" Width="100px" />

                </td>
                <td>
                    <asp:TextBox ID="userMailTextBox_insert" runat="server" Text="" Width="120px" />
                </td>
                <td>
                    <asp:TextBox ID="userPSWTextBox_insert" runat="server" Text="" Width="100px" />
                </td>
                <td>
                    <asp:TextBox ID="groupIdTextBox_insert" runat="server" Text="" Width="100px" />
                </td>
                <td>
                    <asp:TextBox ID="userGroupRoleTextBox_insert" runat="server" Text="" Width="100px" />
                </td>

                <td>
                    <asp:Button ID="InsertButton" runat="server"  OnClick="InsertButton_Click"  Text="插入"  Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel11" Text="清除" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;"/>
                </td>

            </tr>

        </InsertItemTemplate>--%>

                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="userIdLabel1" runat="server" Text='<%# Eval("userId") %>' Style="width: 50px" />
                        </td>
                        <td>
                            <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>' Width="100px" />
                        </td>
                        <td>
                            <%--<asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' Width="100px" />--%>
                            <asp:DropDownList ID="GenderTextBox" runat="server" SelectedValue='<%# Bind("Gender") %>' Width="100px">
                                <asp:ListItem Text="Male" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Other" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <%--<asp:TextBox ID="userRoleTextBox" runat="server" Text='<%# Bind("userRole") %>' Width="100px" />--%>
                            <asp:DropDownList ID="userRoleTextBox" runat="server" SelectedValue='<%# Bind("userRole") %>' Width="100px">
                                <asp:ListItem Text="管理者" Value="0"></asp:ListItem>
                                <asp:ListItem Text="一般" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="userMailTextBox" runat="server" Text='<%# Bind("userMail") %>' Width="100px" />
                        </td>
                        <td>
                            <asp:TextBox ID="userPSWTextBox" runat="server" Text='<%# Bind("userPSW") %>' Width="100px" />
                        </td>
                        <td>
                            <%--SelectedValue='<%# Bind("groupId") %>'--%>
                            <%--<asp:TextBox ID="groupIdTextBox_edit" runat="server" Text='<%# Bind("groupId") %>' Width="100px" />--%>
                            <asp:DropDownList ID="groupIdTextBox_edit" runat="server" Width="100px">
                                <%--<asp:ListItem Text="者" Value="0"></asp:ListItem>--%>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <%--<asp:TextBox ID="userGroupRoleTextBox_edit" runat="server" Text='<%# Bind("userGroupRole") %>' Width="100px" />--%>
                            <asp:DropDownList ID="userGroupRoleTextBox_edit" runat="server" SelectedValue='<%# Bind("userGroupRole") %>' Width="100px">
                                <asp:ListItem Text="リーダー" Value="0"></asp:ListItem>
                                <asp:ListItem Text="サブリーダー" Value="1"></asp:ListItem>
                                <asp:ListItem Text="一般" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </td>

                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" ValidationGroup="editGroup" Text="更新" CommandArgument='<%#Eval("userId") %>' OnCommand="edditDeleteFunc" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 50px">&nbsp</td>
                        <td>
                            <asp:RequiredFieldValidator Style="color: red" ID="userNameTextBox_edit_RFV" runat="server" ValidationGroup="editGroup" ErrorMessage="This field is required" ControlToValidate="userNameTextBox"></asp:RequiredFieldValidator>
                        </td>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:RegularExpressionValidator Style="color: red" ID="userMailTextBox_edit_REV" ValidationGroup="editGroup" runat="server" ErrorMessage="Invalid email address" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ControlToValidate="userMailTextBox"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator Style="color: red" ID="userMailTextBox_edit_RFV" runat="server" ValidationGroup="editGroup" ControlToValidate="userMailTextBox" ErrorMessage="This field is required"></asp:RequiredFieldValidator></td>
                        <td>
                            <asp:RequiredFieldValidator ForeColor="red" ID="userPSWTextBox_edit_RFV" ValidationGroup="editGroup" runat="server" ErrorMessage="This field is required" ControlToValidate="userPSWTextBox"></asp:RequiredFieldValidator>
                        </td>
                        <td></td>
                        <td></td>
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
                            <asp:Label ID="userIdLabel" runat="server" Style="width: 50px" Text='<%# Eval("userId") %>' />
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

                        <td>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        </td>
                    </tr>
                </SelectedItemTemplate>

            </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OKRSystemDbConnectionString2 %>"
                DeleteCommand="DELETE FROM [OKRUser] WHERE [userId] = @userId"
                InsertCommand="INSERT INTO [OKRUser] ([userName], [Gender], [userRole], [userMail], [userPSW]) VALUES (@userName, @Gender, @userRole, @userMail, @userPSW)"
                SelectCommand="SELECT OKRUser.*, UserGroup.groupId, UserGroup.userGroupRole, OKRGroup.groupName FROM OKRUser LEFT JOIN UserGroup ON OKRUser.userId = UserGroup.userId LEFT JOIN OKRGroup ON UserGroup.groupId = OKRGroup.groupId"
                UpdateCommand="UPDATE [OKRUser] SET [userName] = @userName, [Gender] = @Gender, [userRole] = @userRole, [userMail] = @userMail, [userPSW] = @userPSW WHERE [userId] = @userId">
                <DeleteParameters>
                    <asp:Parameter Name="userId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="userName" Type="String" />
                    <asp:Parameter Name="Gender" Type="Int32" />
                    <asp:Parameter Name="userRole" Type="Int32" />
                    <asp:Parameter Name="userMail" Type="String" />
                    <asp:Parameter Name="userPSW" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="userName" Type="String" />
                    <asp:Parameter Name="Gender" Type="Int32" />
                    <asp:Parameter Name="userRole" Type="Int32" />
                    <asp:Parameter Name="userMail" Type="String" />
                    <asp:Parameter Name="userPSW" Type="String" />
                    <asp:Parameter Name="userId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <table style="table-layout: fixed; width: 800px; text-align: center">
                <tr style="">

                    <td style="width: 50px">&nbsp</td>
                    <td>

                        <asp:TextBox ID="userNameTextBox_insert" runat="server" Text="" Width="100px" />
                    </td>

                    <td>

                        <asp:DropDownList ID="GenderDdl" runat="server">
                            <asp:ListItem Value="0">Male</asp:ListItem>
                            <asp:ListItem Value="1">Female</asp:ListItem>
                            <asp:ListItem Value="2">Other</asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:TextBox ID="GenderTextBox_insert" runat="server" Text="" Width="100px" />--%>
                    </td>

                    <td>
                        <asp:DropDownList ID="userRoleDdl" runat="server">
                            <asp:ListItem Value="0">管理者</asp:ListItem>
                            <asp:ListItem Value="1">一般</asp:ListItem>

                        </asp:DropDownList>
                        <%--<asp:TextBox ID="userRoleTextBox_insert" runat="server" Text="" Width="100px" />--%>

                    </td>

                    <td>
                        <asp:TextBox ID="userMailTextBox_insert" runat="server" Text="" Width="120px" />

                    </td>

                    <td>
                        <asp:TextBox ID="userPSWTextBox_insert" runat="server" Text="" Width="100px" />

                    </td>

                    <td>
                        <%--<asp:TextBox ID="groupIdTextBox_insert" runat="server" Text="" Width="100px" />--%>
                        <asp:DropDownList ID="groupIdDdl" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <%--<asp:TextBox ID="userGroupRoleTextBox_insert" runat="server" Text="" Width="100px" />--%>
                        <asp:DropDownList ID="userGroupRoleDdl" runat="server">
                            <asp:ListItem Value="0">リーダー</asp:ListItem>
                            <asp:ListItem Value="1">サブリーダー</asp:ListItem>
                            <asp:ListItem Value="2">メンバー</asp:ListItem>
                        </asp:DropDownList>
                    </td>


                    <td>
                        <asp:Button ID="InsertButton" runat="server" ValidationGroup="insertGroup" OnClick="InsertButton_Click" Text="插入" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel11" Text="清除" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" OnClick="CancelButton_Click" />
                    </td>

                </tr>
                <tr>
                    <td style="width: 50px">&nbsp</td>
                    <td>
                        <asp:RequiredFieldValidator Style="color: red" ID="userNameTextBox_insert_RFV" runat="server" ValidationGroup="insertGroup" ErrorMessage="This field is required" ControlToValidate="userNameTextBox_insert"></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:RegularExpressionValidator Style="color: red" ID="userMailTextBox_insert_REV" ValidationGroup="insertGroup" runat="server" ErrorMessage="Invalid email address" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ControlToValidate="userMailTextBox_insert"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator Style="color: red" ID="userMailTextBox_insert_RFV" runat="server" ValidationGroup="insertGroup" ControlToValidate="userMailTextBox_insert" ErrorMessage="This field is required"></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:RequiredFieldValidator ForeColor="red" ID="userPSWTextBox_insert_RFV" ValidationGroup="insertGroup" runat="server" ErrorMessage="This field is required" ControlToValidate="userPSWTextBox_insert"></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                    <td></td>
                </tr>

            </table>
        </div>
    </div>
</asp:Content>
