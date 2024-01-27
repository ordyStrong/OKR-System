using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OKR_System_Practice
{
    public partial class addPersonTarget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
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

        private bool AddPersonTargetBussinessLogic(string targetName, string starttime, string endTime)
        {
            if (targetName != "" && starttime != "" && endTime != "")
            {
                string updateSql = string.Format("insert into PersonTargets(userId,targetName,startTime,endTime,lastUpdateTime,lastUpdater,progress,userName) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}') ", Session["userId"], targetName, starttime, endTime, DateTime.Now.ToString("yyyy-MM-dd"), Session["accountMail"], "0", Session["accountMail"]);

                bool result = DBHelper.updateData(updateSql);

                return result;
            }
            else
            {
                return false;
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string targetName = targetNameTextBox.Text;

            string targetContent = targetContentTxb.Text;

            string startTime = startDateTextBox.Text;

            string endTime = estimateCompletionDateTextBox.Text;

            bool result = AddPersonTargetBussinessLogic(targetName,startTime, endTime);
            if (result)
            {
                //注意：使用ScriptManager.RegisterStartupScript来插入脚本会导致页面的即时跳转，因为Response.Redirect会立即发送一个新的请求，这通常会中断脚本的执行。
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "InsertSuccess", "alert('添加成功');", true);
                //Response.Redirect("PersonTarget.aspx");
                string script = "window.onload = function() { " +
                    "alert('添加成功'); " +
                    "window.location='PersonTarget.aspx'; " +
                    "}";
                ScriptManager.RegisterStartupScript(this, GetType(), "InsertSuccess", script, true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "InsertSuccess", "alert('添加失败');", true);
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PersonTarget.aspx");
        }
    }
}