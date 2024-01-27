<%@ Page Title="" Language="C#" MasterPageFile="~/OKRMain.Master" AutoEventWireup="true" CodeBehind="GroupManagement.aspx.cs" Inherits="OKR_System_Practice.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script src="js/Jquery172.js"></script>
    <script src="js/GroupMana.js"></script>--%>
    <link href="css/GroupMana.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- 标题--%>
    <h2 class="groupInfo_tittle">Group Information</h2>
    <hr />

    <div class="btnArea">
        <asp:Button ID="addGroupBtn" runat="server" Text="GroupEdit" OnClick="addGroupBtn_Click" style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
       <%--<input id="addGroupBtn" type="button" value="AddGroup"   style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;"/>--%>
        <%--<asp:Button ID="newTargetBtn" ClientIDMode="Static" OnClick="newTargetBtn_Click"  runat="server" Text="AddTarget" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />--%>

    </div>
    

    <%--组选择列表--%>
    <div class="groupList" style="display:inline-block;float: left">
        <%--这里要设置AutoPostBack="true"不然事件触发效果无法显示--%>
        <asp:ListBox ID="groupListBox" runat="server" DataSourceID="SqlDataSource1" DataTextField="groupName" DataValueField="groupId" OnSelectedIndexChanged="groupListBox_SelectedIndexChanged" AutoPostBack="true" Rows="10"></asp:ListBox>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OKRSystemDbConnectionString3 %>" SelectCommand="SELECT [groupId], [groupName] FROM [OKRGroup]" DataSourceMode="DataReader"></asp:SqlDataSource>
      <%--<input type="button" id="newGroupBtn" value="AddGroup" />
        <asp:Button ID="newGroupBtn" runat="server" Text="AddGroup" />
       <div id="newgrouparea">
            <label>group name :</label>
            <input type="text" />
        </div>--%>
    </div>



    <div class="groupDetail" style=" padding-left: 30px">
        <%--组员列表--%>
        <div class="menmberInfo">
            <h4 class="" >Group Member Information</h4>
            <asp:ListView ID="memberListView" runat="server" OnItemCanceling="memberListView_ItemCanceling" OnItemEditing="memberListView_ItemEditing" DataKeyNames="userId" ItemPlaceholderID="memLiPlaceholder">
                <LayoutTemplate>
                    <table style="width:300px">
                        <thead>
                            <tr>
                                <td >Id</td>
                                <td >Name</td>
                                <td >Role</td>
                                <%--<td>Action</td>--%>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder runat="server" ID="memLiPlaceholder" />
                        </tbody>
                    </table>


                </LayoutTemplate>

                <ItemTemplate>

                    <tr>
                        <td>
                            <asp:Label ID="userIdLabel" CssClass="edditLb" runat="server" Text='<%# Eval("userId") %>' />
                            <asp:TextBox ID="TexuserIdTxb" CssClass="edditTxb" style="display:none" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label1" CssClass="edditLb" runat="server" Text='<%# Eval("userName") %>' />
                            
                            <asp:TextBox ID="TextBox2" CssClass="edditTxb" style="display:none" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label2" CssClass="edditLb" runat="server" Text='<%# getGroupRole(Eval("userGroupRole").ToString().Trim()) %>' />
                            
                            <asp:TextBox ID="TextBox3" CssClass="edditTxb" style="display:none" runat="server"></asp:TextBox>
                        </td>
                       <%-- <td>
                            <asp:Button ID="editBtn" ClientIDMode="Static" CssClass="edditLb" runat="server" Text="Edit" OnClick="editBtn_Click1" />
                            <asp:Button ID="deteteBtn" ClientIDMode="Static" CssClass="edditTxb" runat="server" Text="Delete"  />
                        </td>--%>
                    </tr>

                </ItemTemplate>

              <%--  <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="userIdLabel1" runat="server" Text='<%# Eval("userId") %>' Width="100px" />
                        </td>
                        <td>
                            <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>' Width="100px" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("userGroupRole") %>' Width="100px" />
                        </td>
                    </tr>
                </EditItemTemplate>--%>


            </asp:ListView>



        </div>


        <%--组目标列表--%>
        <div class="groupTargetList" >
            <h4  >Group Target</h4>
            <asp:Button ID="newTargetBtn" ClientIDMode="Static" OnClick="newTargetBtn_Click"  runat="server" Text="AddTarget" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
            <asp:ListView ID="groupTargetListListView" runat="server"  DataSourceID="SqlDataSource6" ItemPlaceholderID="groupListHolder">
                <LayoutTemplate>

                    <p>
                        <asp:PlaceHolder runat="server" ID="groupListHolder" />
                    </p>

                </LayoutTemplate>
                <ItemTemplate>
                    <%--<a href="/GroupTargetDetail.aspx">  <%# Eval("targetName") %>  </a>--%>
                    <a href='<%# "/GroupTargetDetail.aspx?id=" + Eval("targetId") %>'><%# Eval("targetName") %>  </a>
                    <br />

                </ItemTemplate>
            </asp:ListView>


            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:OKRSystemDbConnectionString7 %>" SelectCommand="SELECT * FROM [GroupTarget] where [GroupTarget].groupId=0 "></asp:SqlDataSource>
        </div>


        <%--上传文件--%>
        <div class="groupDoc" ">
            <h4>Group Reference Files</h4>

            <%--<input id="addFileBtn" type="button" value="AddFile"   style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;"/>
            <div id="addFileArea" class="addFile" style="display: none">
                <label>Category : </label>
                <asp:DropDownList ID="CategoryDropDownList" runat="server">
                    <asp:ListItem Value="0">目標</asp:ListItem>
                    <asp:ListItem Value="1">議事録</asp:ListItem>
                    <asp:ListItem Value="2">技術資料</asp:ListItem>
                    <asp:ListItem Value="3">管理資料</asp:ListItem>
                    <asp:ListItem Value="4">Q&A</asp:ListItem>
                    <asp:ListItem Value="5">その他</asp:ListItem>
                </asp:DropDownList>
                <div class="fileLoad">
                    <asp:FileUpload ID="FileUpload1" runat="server" />

                    <asp:Button ID="UpLoadButton" runat="server" OnClick="UpLoadButton_Click1" Text="UpLoad" />
                </div>
            </div>--%>


            <%--组文件列表--%>
            <div class="fileList" style="padding-top: 10px">

                <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </div>


        </div>




    </div>


</asp:Content>
