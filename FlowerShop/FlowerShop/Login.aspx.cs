using FlowerShop.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FlowerShop
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //清空session
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                Session["USERName"] = null;
                Session["USERPWD"] = null;
                Session["USERID"] = null;
            }
            else if (Session["Adminame"] != null && Session["AdminPWD"] != null)
            {
                Session["Adminame"] = null;
                Session["AdminPWD"] = null;
            }
            //判断是否输入内容
            if (this.TextBox1.Text == "")
            {
                this.TextBox1.Focus();
            }
            //启用验证控件
            cencle1.Enabled = true;
            cencle2.Enabled = true;
            cencle1.Validate();
            cencle2.Validate();
            //设置了user id 和userpwd 的变量
            if (Session["USERID"] != null && Session["USERPWD"] != null)
            {
                string id = Session["USERID"].ToString();
                string pwd = Session["USERPWD"].ToString();
                TextBox1.Text = id;
                TextBox2.Text = pwd;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DB db = new DB();
            //是否连接到数据库
            if (!db.Fault)
            {
                if (RadioButton1.Checked == true)//用户登录
                {
                    if (db.Query("SELECT * FROM  User_Table  WHERE u_name='" + TextBox1.Text.Trim() + "'"))
                    {
                        ArrayList arr = db.DataReader("SELECT * FROM User_Table WHERE u_name='" + TextBox1.Text.Trim() + "'", "u_password");
                        //对比密码是否正确  如果没错将文本信息赋值将SESSION里面
                        if (arr[0].ToString() == TextBox2.Text)
                        {
                            string sqlID = "SELECT u_id FROM User_Table WHERE u_name='" + TextBox1.Text.Trim() + "'";
                            ArrayList arr1 = db.DataReader(sqlID, "u_id");
                            //Session存储信息
                            Session["USERID"] = Convert.ToInt32(arr1[0]);
                            Session["USERName"] = TextBox1.Text.Trim();
                            Session["USERPWD"] = TextBox2.Text.Trim();
                            // 执行完 关闭连接和 释放资源
                            db.OffData();
                            //跳转到主页
                            Response.Redirect("./Index.aspx? ");
                        }
                        else
                        {
                            db.OffData();
                            Response.Write("<script> alert('密码错误！')</script>");
                        }
                    }
                    else
                    {
                        db.OffData();
                        Response.Write("<script> alert('用户名错误！')</script>");
                    }
                }
                else
                {   //管理员登录
                    if (db.Query("SELECT * FROM  Admin_Table  WHERE A_id='" + TextBox1.Text.Trim() + "'"))
                    {
                        ArrayList arr = db.DataReader("SELECT * FROM Admin_Table WHERE A_id='" + TextBox1.Text.Trim() + "'", "A_password");
                        if (arr[0].ToString() == TextBox2.Text)
                        //对比密码是否正确  如果没错将文本信息赋值将Session里面
                        {
                            Session["Adminame"] = TextBox1.Text.Trim();
                            Session["AdminPWD"] = TextBox2.Text.Trim();
                            // 执行完 关闭连接和 释放资源
                            db.OffData();
                            //跳转到主页
                            Response.Redirect("./admin/UserShow.aspx");
                        }
                        else
                        {
                            db.OffData();
                            Response.Write("<script>alert('密码错误！')</script>");
                        }
                    }
                    else
                    {
                        db.OffData();
                        Response.Write("<script>alert('用户名错误！')</script>");
                    }
                }
            }
        }
    } 
}
       