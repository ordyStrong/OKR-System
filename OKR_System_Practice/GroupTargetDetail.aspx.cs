using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace OKR_System_Practice
{
    public partial class GroupTargetDetail : System.Web.UI.Page
    {
        string _targetId;
        protected void Page_Load(object sender, EventArgs e)
        {
            _targetId = Request.QueryString["id"];
            if (!IsPostBack)
            {
                
                ////人员列表
                //string groupSql = string.Format("select groupId from GroupTarget where targetId = {0} ", _targetId);
                //SqlDataReader dr = DBHelper.getData(groupSql);
                //dr.Read();
                //string groupId = dr.GetInt32(0).ToString();

                //string userSql = string.Format("select userId from UserGroup where groupId = {0} ", groupId);
                //dr = DBHelper.getData(userSql);
                //while(dr.Read())
                //{
                //    ListItem li = new ListItem();
                //    li.Value = dr.GetInt32(0).ToString();//userid

                //    string userName = string.Format("select userName from OKRUser where userId = {0} ", dr.GetInt32(1).ToString());
                //    SqlDataReader dr2 = DBHelper.getData(userName);
                //    dr2.Read();
                //    li.Text = dr.GetString(0);
                //    dr2.Close();

                //    tagetMember.Items.Add();

                //}


                //选择target

                if (_targetId != null && _targetId != "")
                {
                    string targetSql = string.Format("SELECT [GroupTarget].* ,[GroupReference].* FROM [GroupTarget] left join [GroupReference] on [GroupTarget].targetId=[GroupReference].targetId where[GroupTarget].targetId={0}", _targetId);
                    SqlDataSource2.SelectCommand = targetSql;


                    //评论区

                    string commentSql = string.Format("SELECT *  FROM [Comment]  where targetId={0} ORDER BY commentDate DESC", _targetId);
                    SqlDataSource3.SelectCommand = commentSql;
                    groupGoalListView.DataBind();

                }


                //报告
                string _userId="";
                if (Session["userId"] != null)
                {
                     _userId = Session["userId"].ToString();
                }
               
                string reportSql = string.Format("select finished1,finished2 from UserTarget where userId={0} and targetId={1}", _userId, _targetId);

                //int count = 0;
                //SqlCommand command = new SqlCommand(reportSql, DBHelper.conn);
                //DBHelper.Open();
                //object result = command.ExecuteScalar();
                //if (result != null)
                //{
                //    count = Convert.ToInt32(result);
                //}

                // 查询结果不为空

                SqlDataReader drr = DBHelper.getData(reportSql);
                if (drr != null)
                {
                    drr.Read();
                    keyLabelTxb.Text = drr.GetInt32(0).ToString();
                    keyLabe2Txb.Text = drr.GetInt32(1).ToString();
                    drr.Close();

                }
                else
                {
                    // 查询结果为空
                    string insertFinishiedSql = string.Format("insert into UserTarget(userId,targetId,finished1,finished2) values('{0}','{1}','{2}','{3}')", _userId, _targetId, "0", "0");
                    DBHelper.updateData(insertFinishiedSql);

                    keyLabelTxb.Text = "0";
                    keyLabe2Txb.Text = "0";
                }

                DBHelper.conn.Close();

            }




        }
        public string getGroupName(string s)
        {
            string groupSql = "select * from OKRGroup";
            SqlDataReader dr;
            dr = DBHelper.getData(groupSql);
            string name = s.ToString();
            while (dr.Read())
            {
                if (dr.GetInt32(0).ToString() == s)
                {
                    name = dr.GetString(1);
                    break;
                }

            }
            dr.Close();
            DBHelper.conn.Close();

            return name;
        }
        //protected void commentBtn_Click(object sender, EventArgs e)
        //{

           
        //}

        protected void groupGoalListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            //if (e.Item.ItemType == ListViewItemType.DataItem && groupGoalListView.EditIndex == e.Item.DisplayIndex)//防止在edit模板以外的地方被触发
            //{
            //    // 获取当前编辑项的DropDownList控件
            //    //DropDownList ddl = (DropDownList)ListView1.Item.FindControl("groupIdTextBox_edit");
            //    DropDownList ddl = (DropDownList)e.Item.FindControl("GroupNameDropDownList");//这里一定要用e.Item获取当前编辑项

            //    // 填充DropDownList控件
            //    if (ddl != null)
            //    {
            //        string str_connection = "Data Source=LAPTOP-VHD1Q90Q;Initial Catalog=OKRSystemDb;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            //        SqlConnection cnn = new SqlConnection(str_connection);
            //        SqlCommand cmd;
            //        SqlDataReader dr;
            //        int index = 0;
            //        //string[] ss = e.CommandArgument.ToString().Split(',');

            //        if (cnn.State == System.Data.ConnectionState.Closed)
            //        {
            //            cnn.Open();
            //        }

            //        //添加组信息

            //        string groupInfo_sql = "select groupId,groupName from OKRGroup";
            //        cmd = new SqlCommand(groupInfo_sql, cnn);
            //        dr = cmd.ExecuteReader();

            //        int _groupId;
            //        string _groupName;
            //        ListItem li;


            //        while (dr.Read())
            //        {
            //            _groupId = dr.GetInt32(0);
            //            _groupName = dr.GetString(1);
            //            li = new ListItem(_groupName, _groupId.ToString());//text,value
            //            ddl.Items.Add(li);
            //        }
            //        dr.Close();

            //        //设置初始选项
            //        string selectedIndex_sql = string.Format("select groupId from UserGroup where userId={0}", e.Item.DisplayIndex.ToString());
            //        cmd = new SqlCommand(selectedIndex_sql, cnn);
            //        dr = cmd.ExecuteReader();

            //        while (dr.Read())
            //        {
            //            index = dr.GetInt32(0);
            //        }

            //        dr.Close();
            //        cnn.Close();

            //        ddl.SelectedIndex = index;
            //    }

            //}
        }

        protected void UpdateButton_Command(object sender, CommandEventArgs e)
        {
            if (groupGoalListView.EditIndex >= 0) // 判断 ListView 是否处于编辑状态
            {
                // 找到 FileUpload 控件
                FileUpload fileUpload = groupGoalListView.EditItem.FindControl("FileUpload1") as FileUpload;//在EditItemTemplate中的控件不能直接被引用
                DropDownList ddl = groupGoalListView.EditItem.FindControl("CategoryDropDownList") as DropDownList;
                if (fileUpload != null && ddl != null)
                {
                    // 如果上传了文件，则执行相应的操作
                    if (fileUpload.HasFile)
                    {
                        //上传到服务器

                        string fileName = fileUpload.FileName;
                        string _targetPath = MapPath("~/Files/") + DateTime.Now.ToOADate().ToString() + "_" + fileName;
                        fileUpload.SaveAs(_targetPath);

                        //上传到数据库
                        string findGroup = string.Format("select groupId from GroupTarget where targetId={0}", _targetId);
                        SqlDataReader dr = DBHelper.getData(findGroup);
                        string _groupId = "0";
                        while (dr.Read())
                        {
                            _groupId = dr.GetInt32(0).ToString();
                        }

                        dr.Close();

                        string cate = ddl.SelectedIndex.ToString();


                        string fileSql = string.Format("update GroupReference set referenceName={0},category={1},referenceUrl={2},updateDate={3},groupId={4} where targetId={5} ", fileName, cate, _targetPath, DateTime.Now.ToString("yyyy-MM-dd"), _groupId, _targetId);

                        DBHelper.updateData(fileSql);


                        //评论记录
                        string comment = string.Format("insert into Comment(targetId,commentUserName,commentDate,commentContent) ", _targetId, Session["userName"].ToString().Trim(), DateTime.Now.ToString("yyyy - MM - dd HH: mm:ss"), "編集した");
                        DBHelper.updateData(comment);


                        DBHelper.conn.Close();


                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        // 如果没有上传文件，则给出相应的提示信息
                    }
                }
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox startDateTextBox = groupGoalListView.EditItem.FindControl("startDateTextBox") as TextBox;
            Calendar Calendar1 = groupGoalListView.EditItem.FindControl("Calendar1") as Calendar;
            startDateTextBox.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            Calendar1.Style["display"] = "none";
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            TextBox estimateCompletionDateTextBox = groupGoalListView.EditItem.FindControl("estimateCompletionDateTextBox") as TextBox;
            Calendar Calendar2 = groupGoalListView.EditItem.FindControl("Calendar2") as Calendar;
            Calendar2.Style["display"] = "none";
        }

        protected void reportBtn_Click(object sender, EventArgs e)
        {

            string updateFinishiedSql = string.Format("update UserTarget set finished1={0},finished2={1} where userId={2} and targetId={3}", keyLabelTxb.Text, keyLabe2Txb.Text, Session["userId"].ToString(), _targetId);
            DBHelper.updateData(updateFinishiedSql);


            string commentSql = string.Format("insert into Comment (targetId,commentUserName,commentDate,commentContent) values('{0}','{1}','{2}','{3}')", _targetId, Session["userName"].ToString(), DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"), "key 1 更新:"+ keyLabelTxb.Text+ "key 2 更新:" + keyLabe2Txb.Text);
            DBHelper.updateData(commentSql);

            DBHelper.conn.Close();

            Response.Write("<script>document.location=document.location</script>");
        }

        protected void commentBtn_Click1(object sender, EventArgs e)
        {
            if (commentSay.Text != "" && commentSay.Text != null)
            {
                string _targetId = Request.QueryString["id"];
                string _userName = Session["userName"].ToString().Trim();
                if (_targetId != null && _targetId != "" && _userName != null && _userName != "")
                {
                    string commentSql = string.Format("insert into Comment(targetId,commentUserName,commentDate,commentContent) values('{0}','{1}','{2}','{3}')", _targetId, _userName, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), commentSay.Text);
                    DBHelper.updateData(commentSql);
                }

                DBHelper.conn.Close();
            }
            commentSay.Text = "";
            Response.Write("<script>document.location=document.location</script>");
        }
    }
}