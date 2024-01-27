using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OKR_System_Practice
{
    public class PublicClass
    {
       // public static dbConnStr
        public static string getCtegary(int i)
        {
            switch (i)
            {
                case 0:
                    return "目标";
                case 1:
                    return "议事录";
                case 2:
                    return "技术资料";
                case 3:
                    return "管理资料";
                case 4:
                    return "Q&A";
                case 5:
                    return "其他";
                default:
                    return "其他";
            }
        }

        public static string getGroupRole(int i)
        {
            switch (i)
            {
                case 0:
                    return "组长";
                case 1:
                    return "小组长";
                case 2:
                    return "组员";
                default:
                    return "组员";
            }
        }
    }
}