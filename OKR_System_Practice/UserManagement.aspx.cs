using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace OKR_System_Practice
{
    public partial class UserManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string groupList = "select groupId,groupName from OKRGroup";
                SqlDataReader dr = DBHelper.getData(groupList);
                while (dr.Read())
                {
                    ListItem li = new ListItem();
                    li.Value = dr.GetInt32(0).ToString();
                    li.Text = dr.GetString(1);
                    groupIdDdl.Items.Add(li);
                }

                dr.Close();
                DBHelper.conn.Close();

            }
        }

        protected string gender(string s)
        {
            if (s.Equals("0"))
                return "Male";
            else if (s.Equals("1"))
                return "Female";
            else
                return "Other";
        }
        protected string userRole(string s)
        {
            if (s.Equals("0"))
                return "管理者";
            else
                return "一般";
        }

        protected string userGroupRole(string s)
        {
            if (s.Equals("0"))
                return "リーダー";
            else if (s.Equals("1"))
                return "サブリーダー";
            else
                return "一般";
        }



        protected void edditDeleteFunc(object sender, CommandEventArgs e)
        {
            string str_connection = "Data Source=LAPTOP-VHD1Q90Q;Initial Catalog=OKRSystemDb;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection cnn = new SqlConnection(str_connection);
            SqlCommand cmd;
            //SqlDataReader dr;
            //string[] ss = e.CommandArgument.ToString().Split(',');

            if (cnn.State == System.Data.ConnectionState.Closed)
            {
                cnn.Open();
            }

            //修改记录
            if (e.CommandName == "Update")
            {
                //ListView1.EditItem只能在edittemplate中使用，这段必须放在 if (e.CommandName == "Update")下面
                DropDownList groupIdTextBox_edit = (DropDownList)ListView1.EditItem.FindControl("groupIdTextBox_edit");
                string NewGroupId = groupIdTextBox_edit.SelectedValue.ToString();
                DropDownList userGroupRoleTextBox_edit = (DropDownList)ListView1.EditItem.FindControl("userGroupRoleTextBox_edit");
                string NewUserGroupRole = userGroupRoleTextBox_edit.SelectedValue.ToString();
                //

                string edit_sql = string.Format("update UserGroup set groupId={1},userGroupRole={2} where userId={0}", e.CommandArgument.ToString(), NewGroupId, NewUserGroupRole);


                if (cnn.State == System.Data.ConnectionState.Closed)
                {
                    cnn.Open();
                }


                cmd = new SqlCommand(edit_sql, cnn);
                cmd.ExecuteNonQuery();

                //dr.Close();
                cnn.Close();
            }

            //删除记录
            else if (e.CommandName == "Delete")
            {
                string delete_sql = string.Format("delete from UserGroup where userId={0}", e.CommandArgument.ToString());

                if (cnn.State == System.Data.ConnectionState.Closed)
                {
                    cnn.Open();
                }


                cmd = new SqlCommand(delete_sql, cnn);
                cmd.ExecuteNonQuery();

                //dr.Close();
                cnn.Close();
            }
            else
                cnn.Close();

            Response.Write("<script>document.location=document.location</script>");//防止刷新页面重复触发
            //ListView1.DataBind();
        }


        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem && ListView1.EditIndex == e.Item.DisplayIndex)//防止在edit模板以外的地方被触发
            {
                // 获取当前编辑项的DropDownList控件
                //DropDownList ddl = (DropDownList)ListView1.Item.FindControl("groupIdTextBox_edit");
                DropDownList ddl = (DropDownList)e.Item.FindControl("groupIdTextBox_edit");//这里一定要用e.Item获取当前编辑项

                // 填充DropDownList控件
                if (ddl != null)
                {
                    string str_connection = "Data Source=LAPTOP-VHD1Q90Q;Initial Catalog=OKRSystemDb;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                    SqlConnection cnn = new SqlConnection(str_connection);
                    SqlCommand cmd;
                    SqlDataReader dr;
                    int index = 0;
                    //string[] ss = e.CommandArgument.ToString().Split(',');

                    if (cnn.State == System.Data.ConnectionState.Closed)
                    {
                        cnn.Open();
                    }

                    //添加组信息

                    string groupInfo_sql = "select groupId,groupName from OKRGroup";
                    cmd = new SqlCommand(groupInfo_sql, cnn);
                    dr = cmd.ExecuteReader();

                    int _groupId;
                    string _groupName;
                    ListItem li;


                    while (dr.Read())
                    {
                        _groupId = dr.GetInt32(0);
                        _groupName = dr.GetString(1);
                        li = new ListItem(_groupName, _groupId.ToString());//text,value
                        ddl.Items.Add(li);
                    }
                    dr.Close();

                    //设置初始选项
                    string selectedIndex_sql = string.Format("select groupId from UserGroup where userId={0}", e.Item.DisplayIndex.ToString());
                    cmd = new SqlCommand(selectedIndex_sql, cnn);
                    dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        index = dr.GetInt32(0);
                    }

                    dr.Close();
                    cnn.Close();

                    ddl.SelectedIndex = index;
                }

            }
        }



        protected void InsertButton_Click(object sender, EventArgs e)        
        {
            if (Page.IsValid)
            {
                //TextBox userNameTextBox_insert = (TextBox)ListView1.InsertItem.FindControl("userNameTextBox_insert");
                string NewName = userNameTextBox_insert.Text;

                //TextBox GenderTextBox_insert = (TextBox)ListView1.InsertItem.FindControl("GenderTextBox_insert");
                string NewGender = GenderDdl.SelectedIndex.ToString();

                //TextBox userRoleTextBox_insert = (TextBox)ListView1.InsertItem.FindControl("userRoleTextBox_insert");
                string NewUserRole = userRoleDdl.SelectedIndex.ToString();

                //TextBox userMailTextBox_insert = (TextBox)ListView1.InsertItem.FindControl("userMailTextBox_insert");
                string NewMail = userMailTextBox_insert.Text;

                //TextBox userPSWTextBox_insert = (TextBox)ListView1.InsertItem.FindControl("userPSWTextBox_insert");
                string NewPSW = userPSWTextBox_insert.Text;

                //TextBox groupIdTextBox_insert = (TextBox)ListView1.InsertItem.FindControl("groupIdTextBox_insert");
                string NewGroupId = groupIdDdl.SelectedIndex.ToString();

                //TextBox userGroupRoleTextBox_insert = (TextBox)ListView1.InsertItem.FindControl("userGroupRoleTextBox_insert");
                string NewUserGroupRole = userGroupRoleDdl.SelectedIndex.ToString();


                string str_connection = "Data Source=LAPTOP-VHD1Q90Q;Initial Catalog=OKRSystemDb;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                SqlConnection cnn;
                SqlCommand cmd;
                //SqlDataReader dr;
                //string[] ss = e.CommandArgument.ToString().Split(',');


                cnn = new SqlConnection(str_connection);

                if (cnn.State == System.Data.ConnectionState.Closed)
                {
                    cnn.Open();
                }


                //插入user信息
                string user_sql = string.Format("insert into OKRUser (userName,Gender,UserRole,userMail,userPSW) values('{0}','{1}','{2}','{3}','{4}' )", NewName, NewGender, NewUserRole, NewMail, NewPSW);

                cmd = new SqlCommand(user_sql, cnn);
                cmd.ExecuteNonQuery();

                //查询刚刚插入user的userid
                string sql_count = "SELECT COUNT(userId) FROM OKRUser ";
                cmd = new SqlCommand(sql_count, cnn);
                //cmd.ExecuteNonQuery();
                int count = (int)cmd.ExecuteScalar();

                //插入usergroup信息
                string userGroup_sql = string.Format("insert into UserGroup (groupId,userGroupRole) values('{0}','{1}') ", NewGroupId, NewUserGroupRole);
                cmd = new SqlCommand(userGroup_sql, cnn);
                cmd.ExecuteNonQuery();

                //dr.Close();
                cnn.Close();

                ListView1.DataBind();
                Response.Write("<script>document.location=document.location</script>");//防止刷新页面触发onclick事件
                                                                                       //Response.Redirect(Request.Url.ToString(), false);
            }
            Response.Write("<script>document.location=document.location</script>");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            userNameTextBox_insert.Text = "";
            GenderDdl.SelectedIndex = 0;
            userRoleDdl.SelectedIndex = 0;
            userMailTextBox_insert.Text = "";
            userPSWTextBox_insert.Text = "";
            groupIdDdl.SelectedIndex = 0;
            userGroupRoleDdl.SelectedIndex = 0;
        }
    }
}


