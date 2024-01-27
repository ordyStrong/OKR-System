using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OKR_System_Practice
{
    public partial class GroupReferenceManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpLoadButton_Click1(object sender, EventArgs e)
        {
        
            try
            {
                //上传到服务器
                if (FileUpload1.HasFile)
                {
                    string _targetPath = MapPath("~/Files/") + DateTime.Now.ToOADate().ToString() + "_" + FileUpload1.FileName;
                    FileUpload1.SaveAs(_targetPath);


                }
                //上传到数据库

            }
            catch (Exception ex)
            {
                Response.Write("ERROR：" + ex.Message);
            }
        
    }
    }
}