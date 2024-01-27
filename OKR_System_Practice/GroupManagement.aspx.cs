using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using OKR_System_Practice;


namespace OKR_System_Practice
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        int selectedGroup;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                groupListBox.SelectedIndex = 0;

                selectedGroup = 0;

                // 创建一个数据集
                DataTable dt;
                //DataTable dt = new DataTable();
                //dt.Columns.Add("Id");
                //dt.Columns.Add("Name");
                //dt.Columns.Add("Role");

                // 添加数据行
                //string _groupMenber_sql = "select UserGroup.userId,OKRUser.userName,UserGroup.userGroupRole from UserGroup left join OKRUser on OKRUser.userId=userGroup.userId where OKRUser.userId=0";
                string _groupMenber_sql = string.Format("select UserGroup.userId,OKRUser.userName,UserGroup.userGroupRole from UserGroup left join OKRUser on OKRUser.userId=userGroup.userId where UserGroup.groupId in (select groupId from userGroup where userId='{0}')", Session["userId"]);


                dt = DBHelper.getDataTable(_groupMenber_sql);

                // 绑定数据到 Listview 控件
                memberListView.DataSource = dt;
                memberListView.DataBind();



                //显示文件信息
                //string file_sql = string.Format("select * from GroupReference where groupId='{0}'", Session["userId"]);
                string file_sql = string.Format("select * from GroupReference where groupId in (select groupId from UserGroup where userId='{0}')", Session["userId"]);
                DBHelper.Open();
                SqlDataReader dr = DBHelper.getData(file_sql);
                try
                {
                    while (dr.Read())
                    {
                        Literal literal = new Literal();
                        literal.Text = "<div><a href='" + dr.GetString(5) + "'>" + dr.GetString(3) + "</a> " + PublicClass.getCtegary(dr.GetInt32(4)) + "</div>";


                        Panel1.Controls.Add(literal);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("执行 SQL 查询语句失败：" + ex.Message);
                }
                finally
                { 
                    dr.Close();
                    DBHelper.conn.Close();
                }
            }



            
          
        }



        //protected void UpLoadButton_Click1(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        //上传到服务器
        //        if (FileUpload1.HasFile)
        //        {
        //            string _targetPath = MapPath("~/Files/") + DateTime.Now.ToOADate().ToString() + "_" + FileUpload1.FileName;
        //            FileUpload1.SaveAs(_targetPath);


        //        }
        //        //上传到数据库
                
        //        int cate = CategoryDropDownList.SelectedIndex;

        //        string fileSql = string.Format("insert into GroupReference (groupId,category,referenceUrl,referenceName) values('{0}','{1}','{2}','{3}') ", selectedGroup, cate.ToString(),"/Files/"+ DateTime.Now.ToOADate().ToString() + "_" + FileUpload1.FileName, FileUpload1.FileName);

        //        DBHelper.updateData(fileSql);

        //        DBHelper.conn.Close();


        //        Response.Redirect(Request.RawUrl);

        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("ERROR：" + ex.Message);
        //    }
        //}

        protected void groupListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            //组员信息更新
            selectedGroup = groupListBox.SelectedIndex;

            string selectNum = groupListBox.SelectedIndex.ToString();
            string _groupMenber_sql = string.Format("select UserGroup.userId,OKRUser.userName,UserGroup.userGroupRole from UserGroup left join OKRUser on OKRUser.userId=userGroup.userId where UserGroup.groupId='{0}'", selectNum);

            // 创建一个数据集
            DataTable dt;

            dt = DBHelper.getDataTable(_groupMenber_sql);

            // 绑定数据到 Listview 控件
            memberListView.DataSource = dt;
            memberListView.DataBind();

            //group target信息
            string _graoupTarget = string.Format("select * from GroupTarget where groupId={0}", selectedGroup);
            SqlDataSource6.SelectCommand = _graoupTarget;
            //groupTargetListListView.DataSource = _graoupTarget; //datasource绑定的是数据的数据源，如dataset或者datatable
            groupTargetListListView.DataBind();

            //绑定到组文件
            string file_sql = string.Format("select * from GroupReference where groupId={0}", selectedGroup);
            DBHelper.Open();
            SqlDataReader dr = DBHelper.getData(file_sql);

            Panel1.Controls.Clear();
            while (dr.Read())
            {
                Literal literal = new Literal();
                literal.Text = "<div><a href='" + dr.GetString(5) + "'>" + dr.GetString(3) + "</a> " + PublicClass.getCtegary(dr.GetInt32(4)) + "</div>";


                Panel1.Controls.Add(literal);
            }

            dr.Close();
            DBHelper.conn.Close();




        }

        protected void memberListView_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            //memberListView.EditIndex = e.NewEditIndex;
            //memberListView.DataBind();
        }

        protected void memberListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            //memberListView.EditIndex = -1;
            //memberListView.DataBind();
        }

    

        protected void editBtn_Click1(object sender, EventArgs e)
        {
            
        }

        protected void newTargetBtn_Click(object sender, EventArgs e)
        {
            int groupIndex = selectedGroup;
            Response.Redirect("GroupTargetAdd.aspx?groupIndex="+ groupIndex.ToString());
        }

        public  string getGroupRole(string i)
        {
            switch (i)
            {
                case "0":
                    return "组长";
                case "1":
                    return "小组长";
                case "2":
                    return "组员";
                default:
                    return "组员";
            }
        }

        protected void addGroupBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("GroupEdit.aspx");
        }
    }


}
