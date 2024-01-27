using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OKR_System_Practice
{
    public partial class PersonTarget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        private bool UpdatePersonTargetBussinessLogic(string id,string progress)
        {
            string updateSql = string.Format("update PersonTargets set progress={0},lastUpdateTime={1} where id={2} ",progress, DateTime.Now.ToString("yyyy-MM-dd"),id);

            bool result=DBHelper.updateData(updateSql);

            return result;
        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            TextBox progressTextBox = (TextBox)item.FindControl("subTargetFinished1TextBox");
            string progress = progressTextBox.Text;

            bool result = UpdatePersonTargetBussinessLogic(id,progress);
            if (result)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "updateSuccess", "alert('更新成功');", true);
            }

        }

        protected void addNewTarget_Click(object sender, EventArgs e)
        {
            Response.Redirect("addPersonTarget.aspx");
        }
    }
}