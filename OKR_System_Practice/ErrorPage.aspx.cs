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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorLabelTittle.Text = Request.QueryString["ErrorRank"];
            ErrorLabelContent.Text = Request.QueryString["reason"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }
    }
}