using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OKR_System_Practice
{
    public partial class OKRMain : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["accountMail"] != null)
            {
                accountInfoLabel.Text = Session["accountMail"].ToString().Trim();
            }
        }
    }
}