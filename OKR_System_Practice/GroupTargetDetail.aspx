<%@ Page Title="" Language="C#" MasterPageFile="~/OKRMain.Master" AutoEventWireup="true" CodeBehind="GroupTargetDetail.aspx.cs" Inherits="OKR_System_Practice.GroupTargetDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/Jquery172.js"></script>
    <script src="js/targetDetail.js"></script>
    <link href="css/targetDetail.css" rel="stylesheet" />
    <style>
        .report {
       background-color: #fff;
    padding-left:30px;
    padding-top:10px;
    padding-bottom:10px;
    border-radius:8px;
}

.report {
          border-top:solid 1px #ccc;
        .groupGoal {
            margin-top:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Target Detail</h2>
    <hr />

    <div class="groupGoal">
        <asp:ListView ID="groupGoalListView" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="targetName" ItemPlaceholderID="groupGoalPlaceHolder" OnItemDataBound="groupGoalListView_ItemDataBound">
            <LayoutTemplate>
                <div>
                    <asp:PlaceHolder ID="groupGoalPlaceHolder" runat="server" />
                </div>
            </LayoutTemplate>

            <ItemTemplate>
                <div style="margin-bottom: 10px;">
                    <label>group name :</label>
                    <label><%# getGroupName(Eval("groupId").ToString().Trim()) %>  </label>
                </div>
                <div style="margin-bottom: 10px;">
                    <label>creater :</label>
                    <label><%# Eval("createrName") %>  </label>
                </div>
                <div style="margin-bottom: 10px;">
                    <label>Object Name :</label>
                    <label><%# Eval("targetName") %>  </label>
                </div>
                <div style="margin-bottom: 10px;">
                    <label>start date :</label>
                    <label><%# Eval("startDate") %>  </label>

                    <label style="margin-left: 40px">estimate completion date :</label>
                    <label><%# Eval("estimateCompletionDate") %> </label>
                </div>
                <div style="margin-bottom: 10px;">
                    <label>key project1 :</label>
                    <label><%# Eval("subTargetName1") %></label>


                    <label style="margin-left: 40px">completion1 :</label>
                    <label><%# Eval("subTargetFinished1") %></label>
                    <label>%  </label>
                </div>
                <div style="margin-bottom: 10px;">
                    <label>key project2 :</label>
                    <label><%# Eval("subTargetName2") %></label>


                    <label style="margin-left: 40px">completion2  :</label>
                    <label><%# Eval("subTargetFinished2") %></label>
                    <label>%  </label>
                </div>
                <div style="margin-bottom: 10px;">
                    <label>References :</label>
                    <a href='<%# Eval("referenceUrl") %>'><%# Eval("referenceName") %></a>
                </div>
                <div style="margin-bottom: 10px;">
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                </div>
            </ItemTemplate>

            <EditItemTemplate>
                <div style="margin-bottom: 10px;">
                    <label>group name :</label>
                    <asp:DropDownList ID="DropDownList1" Enabled="false" runat="server" SelectedValue='<%# Bind("groupId") %>' DataSourceID="SqlDataSource1" DataTextField="groupName" DataValueField="groupId"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OKRSystemDbConnectionString11 %>" SelectCommand="SELECT [groupId], [groupName] FROM [OKRGroup]"></asp:SqlDataSource>
                </div>
                <div style="margin-bottom: 10px;">
                    <label>creater :</label>
                    <asp:TextBox ID="createrNameTextBox" Enabled="false" runat="server" Text='<%# Bind("createrName") %>' Width="100px" />

                </div>
                <div style="margin-bottom: 10px;">
                    <label>Object Name :</label>
                    <asp:TextBox ID="targetNameTextBox" runat="server" Text='<%# Bind("targetName") %>' Width="100px" />

                </div>
                <div style="margin-bottom: 10px;">
                    <label>start date :</label>
                    <asp:TextBox ID="startDateTextBox" runat="server" ClientIDMode="Static" OnClick="showCalendar()" Text='<%# Bind("startDate") %>' Width="100px" />
                    <asp:Calendar ID="Calendar1" Style="display: none" ClientIDMode="Static" OnSelectionChanged="Calendar1_SelectionChanged" runat="server"></asp:Calendar>

                    <label style="margin-left: 40px">estimate completion date :</label>
                    <asp:TextBox ID="estimateCompletionDateTextBox" ClientIDMode="Static" OnClick="showCalendar2()" runat="server" Text='<%# Bind("estimateCompletionDate") %>' Width="100px" />
                    <asp:Calendar ID="Calendar2" Style="display: none" ClientIDMode="Static" OnSelectionChanged="Calendar2_SelectionChanged" runat="server"></asp:Calendar>

                </div>
                <div style="margin-bottom: 10px;">
                    <label>key project1 :</label>
                    <asp:TextBox ID="subTargetName1TextBox" runat="server" Text='<%# Bind("subTargetName1") %>' Width="100px" />


                    <label style="margin-left: 40px">completion1 % :</label>
                    <asp:TextBox ID="subTargetFinished1TextBox" runat="server" Text='<%# Bind("subTargetFinished1") %>' Width="100px" />
                    <label>%  </label>
                    <asp:RangeValidator ID="RangeValidator2" Style="color:red" ValidationGroup="perc" runat="server" ErrorMessage="RangeValidator" ControlToValidate="subTargetFinished1TextBox" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator>

                    
                </div>
                <div style="margin-bottom: 10px;">
                    <label>key project2 :</label>
                    <asp:TextBox ID="subTargetName2TextBox" runat="server" Text='<%# Bind("subTargetName2") %>' Width="100px" />


                    <label style="margin-left: 40px">completion2 % :</label>
                    <asp:TextBox ID="subTargetFinished2TextBox" runat="server" Text='<%# Bind("subTargetFinished2") %>' Width="100px" />
                    <label>%  </label>
                    <asp:RangeValidator ID="RangeValidator1" Style="color:red" ValidationGroup="perc" runat="server" ErrorMessage="RangeValidator" ControlToValidate="subTargetFinished2TextBox" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    
                </div>
                <div style="margin-bottom: 10px;">
                    <label>References :</label><asp:Label ID="reflb" runat="server" Text=""></asp:Label>
                    <%--<a href='<%# Bind("referenceUrl") %>'><%# Bind("referenceName") %></a>--%>
                </div>
                <div style="margin-bottom: 10px;">

                    <%--<input id="editFileBtn" type="button" value="EditFile" style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />--%>
                    <div id="addFileArea" class="addFile">
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

                            <%--<asp:Button ID="UpLoadButton" runat="server"  Text="UpLoad" style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;"  />--%>
                        </div>
                    </div>
                </div>
                <div style="margin-bottom: 10px;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" ValidationGroup="perc" Text="更新" OnCommand="UpdateButton_Command" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
                    </td>
                </div>


            </EditItemTemplate>

        </asp:ListView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OKRSystemDbConnectionString4 %>"
        SelectCommand="SELECT [GroupTarget].* ,[GroupReference].* FROM [GroupTarget] left join [GroupReference] on [GroupTarget].targetId=[GroupReference].targetId where[GroupTarget].targetId=0"
        DeleteCommand="DELETE FROM [GroupTarget] WHERE [targetId] = @targetId"
        InsertCommand="INSERT INTO [GroupTarget] ([targetId], [groupId], [targetName], [createDate], [updateDate], [createrName], [startDate], [estimateCompletionDate], [subTargetName1], [subTargetFinished1], [subTargetName2], [subTargetFinished2]) VALUES (@targetId, @groupId, @targetName, @createDate, @updateDate, @createrName, @startDate, @estimateCompletionDate, @subTargetName1, @subTargetFinished1, @subTargetName2, @subTargetFinished2)"
        UpdateCommand="UPDATE [GroupTarget] SET [groupId] = @groupId, [targetName] = @targetName, [createDate] = @createDate, [updateDate] = @updateDate, [createrName] = @createrName, [startDate] = @startDate, [estimateCompletionDate] = @estimateCompletionDate, [subTargetName1] = @subTargetName1, [subTargetFinished1] = @subTargetFinished1, [subTargetName2] = @subTargetName2, [subTargetFinished2] = @subTargetFinished2 WHERE [targetId] = @targetId">
        <DeleteParameters>
            <asp:Parameter Name="targetId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="targetId" Type="Int32" />
            <asp:Parameter Name="groupId" Type="Int32" />
            <asp:Parameter Name="targetName" Type="String" />
            <asp:Parameter Name="createDate" Type="DateTime" />
            <asp:Parameter Name="updateDate" Type="DateTime" />
            <asp:Parameter Name="createrName" Type="String" />
            <asp:Parameter Name="startDate" Type="DateTime" />
            <asp:Parameter Name="estimateCompletionDate" Type="DateTime" />
            <asp:Parameter Name="subTargetName1" Type="String" />
            <asp:Parameter Name="subTargetFinished1" Type="Int32" />
            <asp:Parameter Name="subTargetName2" Type="String" />
            <asp:Parameter Name="subTargetFinished2" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="groupId" Type="Int32" />
            <asp:Parameter Name="targetName" Type="String" />
            <asp:Parameter Name="createDate" Type="DateTime" />
            <asp:Parameter Name="updateDate" Type="DateTime" />
            <asp:Parameter Name="createrName" Type="String" />
            <asp:Parameter Name="startDate" Type="DateTime" />
            <asp:Parameter Name="estimateCompletionDate" Type="DateTime" />
            <asp:Parameter Name="subTargetName1" Type="String" />
            <asp:Parameter Name="subTargetFinished1" Type="Int32" />
            <asp:Parameter Name="subTargetName2" Type="String" />
            <asp:Parameter Name="subTargetFinished2" Type="Int32" />
            <asp:Parameter Name="targetId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <%--报告区--%>
    <div class="report">
        <h3>私の進度：</h3>
        <asp:Label ID="keyLabel" runat="server" Text="key project completion1:"></asp:Label>
        <asp:TextBox ID="keyLabelTxb" width="100px"  runat="server" ></asp:TextBox>
        <asp:RangeValidator ID="keyLabelTxb_RFV" ControlToValidate="keyLabelTxb" MinimumValue="0" ForeColor="Red" MaximumValue="100" Type="Integer" ValidationGroup="finishedReport"  runat="server" ErrorMessage="RangeValidator"></asp:RangeValidator>
        <span></span>

        <asp:Label ID="keyLabel2" runat="server" Text="key project completion1:"></asp:Label>
         <asp:TextBox ID="keyLabe2Txb" width="100px"  runat="server"></asp:TextBox>
        <asp:RangeValidator ID="keyLabe2Txb_RFV" ControlToValidate="keyLabe2Txb" MinimumValue="0" ForeColor="Red" MaximumValue="100" Type="Integer" ValidationGroup="finishedReport" runat="server" ErrorMessage="RangeValidator"></asp:RangeValidator>
        <asp:Button ID="reportBtn" runat="server" Text="Report" ValidationGroup="finishedReport" OnClick="reportBtn_Click" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
    </div>

    <%--评论区--%>
    <div class="commentArea" style="padding-top: 10px">
        <br  />
        <h3>ｺﾐｭﾆｹｰｼｮﾝ評価</h3>
        <asp:TextBox ID="commentSay"  CssClass="commentSay" runat="server" AutoPostBack="True" Width="400px" MaxLength="300" Rows="4" TextMode="MultiLine"></asp:TextBox>
        <asp:Button ID="commentBtn" CssClass="commentBtn" runat="server" OnClick="commentBtn_Click1" Text="Comment" Style="padding: 6px 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;" />
        <!-- 评论列表 -->
        <div class="comment-list">
            <asp:Repeater ID="commentList" runat="server" DataSourceID="SqlDataSource3">
                <ItemTemplate>
                    <!-- 评论内容 -->
                    <div class="comment-item">
                        <div class="item-right">
                            <a href="#"><%# Eval("commentUserName") %></a>
                            <span><%# Eval("commentDate") %></span>
                            <span><%# "&nbsp&nbsp&nbsp&nbsp"+Eval("commentContent") %></span>
                        </div>
                    </div>
                    <!-- 单个评论内容盒子结束 -->
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:OKRSystemDbConnectionString5 %>" SelectCommand="SELECT * FROM [Comment] where targetId=0"></asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
