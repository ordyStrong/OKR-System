using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace OKR_System_Practice
{
    public class DBHelper
    {

        //数据库连接配置字符串
        public static string connStr = "Data Source=LAPTOP-VHD1Q90Q;Initial Catalog=OKRSystemDb;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        //连接数据库对象
        public static SqlConnection conn = null;

        //连接数据库方法
        public static void Open()
        {
            //先判断当前是否已经创建连接对象
            if (conn == null)
            {
                conn = new SqlConnection(connStr);
            }
            //判断当前连接状态是否是断开的，如果断开需要连接
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
        }
        //对数据库执行增删改方法
        public static bool updateData(string sql)
        {
            try
            {
                //1、先开启数据库
                Open();
                //2、数据库的方法操作
                SqlCommand cmd = new SqlCommand(sql, conn);
                //3、执行sql方法
                int result = cmd.ExecuteNonQuery();
                //4、返回执行的结果
                return result > 0;
            }
            catch (Exception e)
            {
                //防止弹出异常，停止运行程序
                Console.WriteLine("执行 SQL 查询语句失败：" + e.Message);

                return false;
            }
            finally {
                conn.Close();
            }
        }

        //返回行数
        public static int updateData2(string sql)
        {
            try
            {
                //1、先开启数据库
                Open();
                //2、数据库的方法操作
                SqlCommand cmd = new SqlCommand(sql, conn);
                //3、执行sql方法
                int result = cmd.ExecuteNonQuery();
                //4、返回执行的结果
                return result;
            }
            catch (Exception e)
            {
                //防止弹出异常，停止运行程序
                return -1;
            }
            finally
            {
                conn.Close();
            }

        }

        //对数据库执行查询方法
        public static SqlDataReader getData(string sql)
        {
            try
            {
                //1、先开启数据库
                Open();
                //2、数据库操作sql方法
                SqlCommand cmd = new SqlCommand(sql, conn);
                //3、执行查询
                SqlDataReader dr = cmd.ExecuteReader();
                //4、返回结果
                return dr;
            }
            catch (Exception e)
            {
                //防止弹出异常，停止运行程序
                return null;
            }
        }

        //获取表格形式的数据返回
        public static DataTable getDataTable(string sql)
        {
            DataTable dt = new DataTable();
            try
            {
                //1、先开启数据库
                Open();
                //2、数据库操作sql方法
                SqlDataAdapter sa = new SqlDataAdapter(sql, conn);
                //3、执行查询
                sa.Fill(dt);

                conn.Close();
                //4、返回结果
                return dt;
            }
            catch (Exception e)
            {

                //防止弹出异常，停止运行程序
                conn.Close();

                return dt;
            }
        }
    }
}
