using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace OKR_System_Practice
{
    public partial class GroupTargetAdd : System.Web.UI.Page
    {
        string _groupIndex;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userName"] != null)
                    createrNameTextBox.Text = Session["userName"].ToString(); ;

                //组选项
                _groupIndex = Request.QueryString["groupIndex"];

                string allGroup = "select * from OKRGroup";

                SqlDataReader dr = DBHelper.getData(allGroup);

                while (dr.Read())
                {
                    ListItem li = new ListItem();
                    li.Value = dr.GetInt32(0).ToString();
                    li.Text = dr.GetString(1).ToString();
                    groupIdDDL.Items.Add(li);
                }

                DBHelper.conn.Close();

                //creater name
                if (Session["userName"] != null)
                    createrNameTextBox.Text = Session["userName"].ToString();
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            startDateTextBox.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            Calendar1.Style["display"] = "none";
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            estimateCompletionDateTextBox.Text = Calendar2.SelectedDate.ToString("yyyy-MM-dd");
            Calendar2.Style["display"] = "none";
        }

        protected void estimateComletionDateTextBox_TextChanged(object sender, EventArgs e)
        {
            
            Calendar2.Style["display"] = "none";
        }

        protected void startDateTextBox_TextChanged(object sender, EventArgs e)
        {
            Calendar1.Style["display"] = "none";
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            ////target
            string _groupIndex = Request.QueryString["groupIndex"];

            int cate = CategoryDropDownList.SelectedIndex;
            try
            {

                if (FileUpload1.HasFile)
                {
                    //上传到服务器
                    string _targetPath = MapPath("~/Files/") + DateTime.Now.ToOADate().ToString() + "_" + FileUpload1.FileName;
                    FileUpload1.SaveAs(_targetPath);

                    //上传到数据库

                    //插入target表
                    string fileToTargetSql = string.Format("insert into GroupTarget (groupId,targetName,createDate,updateDate,createrName,startDate,estimateCompletionDate,subTargetName1,subTargetFinished1,subTargetName2,subTargetFinished2) OUTPUT INSERTED.targetId values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}')", _groupIndex, targetNameTextBox.Text.Trim(), DateTime.Now.ToString("yyyy-MM-dd"), DateTime.Now.ToString("yyyy-MM-dd"), Session["userName"].ToString(), startDateTextBox.Text.Trim(), estimateCompletionDateTextBox.Text.Trim(), subTargetName1TextBox.Text.Trim(), subTargetFinished1TextBox.Text.Trim(), subTargetName2TextBox.Text.Trim(), subTargetFinished2TextBox.Text.Trim());
                    SqlCommand cmd = new SqlCommand(fileToTargetSql, DBHelper.conn);
                    DBHelper.updateData2(fileToTargetSql);

                    SqlCommand command = new SqlCommand("SELECT TOP 1 FROM GroupTarget ORDER BY id DESC", DBHelper.conn);
                    object result = cmd.ExecuteScalar();
                    string targetId = "";
                    if (result != null)
                    {
                        targetId = result.ToString();            
                    }

                    //插入reference表

                    string fileToReftSql = string.Format("insert into GroupReference (targetId,groupId,referenceName,category,referenceUrl,createDate,updateDate) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}')", targetId.ToString(), _groupIndex, FileUpload1.FileName, cate.ToString(), _targetPath, DateTime.Now.ToString("yyyy-MM-dd"), DateTime.Now.ToString("yyyy-MM-dd"));

                    DBHelper.updateData(fileToReftSql);

                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    //插入target表
                    string fileToTargetSql = string.Format("insert into GroupTarget (groupId,targetName,createDate,updateDate,createrName,startDate,estimateCompletionDate,subTargetName1,subTargetFinished1,subTargetName2,subTargetFinished2) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}')", _groupIndex, targetNameTextBox.Text.Trim(), DateTime.Now.ToString("yyyy-MM-dd"), DateTime.Now.ToString("yyyy-MM-dd"), Session["userName"].ToString(), startDateTextBox.Text.Trim(), estimateCompletionDateTextBox.Text.Trim(), subTargetName1TextBox.Text.Trim(), subTargetFinished1TextBox.Text.Trim(), subTargetName2TextBox.Text.Trim(), subTargetFinished2TextBox.Text.Trim());

                    DBHelper.updateData2(fileToTargetSql);
                }
            }
            catch (Exception ex)
            {
                Response.Write("ERROR：" + ex.Message);
            }
            finally
            {
                DBHelper.conn.Close();

                fileNameLb.Text = FileUpload1.FileName;
            }
        }

        protected void fileCancel_Click(object sender, EventArgs e)
        {          
            FileUpload1.PostedFile.InputStream.Flush();
            FileUpload1.PostedFile.InputStream.Close();
            FileUpload1.FileContent.Dispose();
            FileUpload1.Attributes.Clear();
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("GroupManagement.aspx");
        }
    }
}