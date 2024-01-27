using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;


namespace OKR_System_Practice
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button_Click(object sender, EventArgs e)
        {
            int isvalid = 0;
            string userName = this.username.Value;
            string password = this.password.Value;

            string _accountMail = "";
            string _accountRole = "";
            string _userName = "";
            string _userId = "";

            string str_connection = "Data Source=LAPTOP-VHD1Q90Q;Initial Catalog=OKRSystemDb;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection cnn;
            SqlCommand cmd;
            SqlDataReader dr;
            string str_sql = "select userMail, userPSW,userRole,userName,userId from [OKRUser]";

            cnn = new SqlConnection(str_connection);


            if (cnn.State == System.Data.ConnectionState.Closed)
            {
                cnn.Open();
            }


            cmd = new SqlCommand(str_sql, cnn);
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                isvalid = 0;
                if (dr.GetString(0).ToString().Trim() == userName)
                {
                    isvalid++;
                    _accountMail = dr.GetString(0).ToString().Trim();
                    _accountRole = dr.GetInt32(2).ToString().Trim();
                    _userName = dr.GetString(3).Trim();
                    _userId = dr.GetInt32(4).ToString().Trim();
                }
                else
                    continue;
                  
                if (dr.GetString(1).ToString().Trim() == password)
                    isvalid++;
                if (isvalid == 2)
                    break;
            }

            dr.Close();
            cnn.Close();

            if (isvalid == 2)
            {
                Session["accountMail"] = _accountMail;
                Session["userName"] = _userName;
                Session["userId"] = _userId;
                Response.Redirect("OKRIntroduce.aspx");
            }
               
            else
            {
                Response.Redirect("ErrorPage.aspx?ErrorRank=Error&reason=用户名或密码不正确");
                //登录失败，显示错误消息
                //string message = "用户名或密码不正确，请重试。";
                //string script = "alert('" + message + "');";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "loginError", script, true);

                //// 重定向到登录页面
                //Response.Redirect("Login.aspx");
            }
               
        }

    
    }
}