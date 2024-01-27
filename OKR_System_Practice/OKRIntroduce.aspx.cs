using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OKR_System_Practice
{
    public partial class OKRIntrduce : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               int result = checkTaskDeadLineBussinessLogic();
                if (result == 1)
                {
                    deadLineIdLabel.Text = "注意： 您有目标即将截止！";
                }
            }
               

        }

        public int checkTaskDeadLineBussinessLogic()
        {
            string sqlDeadline = string.Format("select endTime from PersonTargets where user userId='{0}'", Session["userId"]);
            SqlDataReader dr = DBHelper.getData(sqlDeadline);
            try {
                while (dr.Read())
                {
                    if (dr["endTime"] != DBNull.Value)
                    {
                        DateTime endTime = Convert.ToDateTime(dr["endTime"]);
                        TimeSpan timeDifference = endTime.Subtract(DateTime.Now);

                        if (timeDifference.TotalDays <= 3 && timeDifference.TotalDays >= 0)
                        {
                            return 1;
                        }
                    }
                }
            }
            catch (Exception ex) {
                return 0;
            }
            return 0;
        }
    } 
}