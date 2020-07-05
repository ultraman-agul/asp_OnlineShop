using FlowerShop.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlowerShop.admin
{
    public partial class AdminShow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
            }
        }

        protected void GetData()
        {
            DB db = new DB();
            string sql = "SELECT * FROM [Admin_Table]";
            db.LoadExecuteData(sql);
            GridView1.DataBind(); //绑定数据库表中数据
            db.OffData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DB db = new DB();
            //取得编辑行的关键字段的值
            string zhanghao = GridView1.DataKeys[e.RowIndex].Value.ToString();
            //取得文本框输入的内容           
            string mima = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString();
            //更新字符串
            string sqlStr = "update Admin_Table set A_id='" + zhanghao + "',A_password='" + mima + "' where A_id='" + zhanghao + "'";          //创建数据连接
            db.LoadExecuteData(sqlStr);
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }
    }
}