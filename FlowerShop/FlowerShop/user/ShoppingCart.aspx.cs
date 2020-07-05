using FlowerShop.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlowerShop.user
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                if (!IsPostBack)
                {
                    GetData();
                }
            }
            else
            {
                Response.Write("<script>alert('您还没登录，请先登录！')</script>");
            }
        }

        protected void GetData()
        {
            DB db = new DB();
            string sql = "SELECT DISTINCT  Commodity_Table.c_kind, Commodity_Table.c_series, Shipping_Table.*  FROM Shipping_Table INNER JOIN Commodity_Table ON Shipping_Table.s_c_id = Commodity_Table.c_id WHERE s_u_id=" + Session["USERID"] + "  ORDER BY  s_c_id";
            db.LoadExecuteData(sql);
            this.DataList1.DataKeyField = "s_c_id";
            DataList1.DataSource = db.MyDataSet.Tables[0].DefaultView;//设置DataList控件的数据源为创建的数据集ds
            DataList1.DataBind();                           //绑定数据库表中数据
            db.OffData();
            GetPrice();
        }

        protected void GetPrice()
        {
            DB db = new DB();
            int mm = 0;
            SqlDataReader sdr2 = db.DataReader("select s_price,s_num from Shipping_Table where s_u_id=" + Session["USERID"] + " and s_buy=1");
            while (sdr2.Read())
            {
                mm += Convert.ToInt32(Convert.ToInt32(sdr2["s_num"].ToString().Trim()) * Convert.ToDouble(sdr2["s_price"].ToString().Trim()));
            }
            Label1.Text = Convert.ToString(mm);
            sdr2.Close();
            db.OffData();
        }

        /// <summary>
        /// 修改单个复选框的值
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void S_buy_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox myT = (CheckBox)sender;
            int index = ((DataListItem)(myT.NamingContainer)).ItemIndex;
            string s_c_id = DataList1.DataKeys[index].ToString();
            // 获取当前行的CheckBox控件，并取值
            CheckBox cbox = (CheckBox)this.DataList1.Items[index].FindControl("s_buy");
            bool flag = cbox.Checked;
            // 修改数据库的值
            DB db = new DB();
            string sql = "update Shipping_Table set s_buy=" + Convert.ToInt32(flag) + " where s_c_id=" + Convert.ToInt32(s_c_id) + " and s_u_id=" + Session["USERID"];
            db.ExecuteNonQuery(sql);
            db.OffData();
            GetPrice();
        }

        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            this.DataList1.EditItemIndex = e.Item.ItemIndex;
            GetData();
        }

        /// <summary>
        /// 取消
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
        {
            this.DataList1.EditItemIndex = -1;
            GetData();
        }

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            DB db = new DB();
            try
            {   //只能更改商品数量
                int s_c_id = int.Parse(e.CommandArgument.ToString());
                int num = Convert.ToInt32((e.Item.FindControl("txt_num") as TextBox).Text.Trim());
                if (db.Update("s_num", num, s_c_id, Convert.ToInt32(Session["USERID"])))
                {
                    Response.Write("<script>alert('修改成功！');</script>");
                    this.DataList1.EditItemIndex = -1;
                    GetData();
                }
            }
            catch (System.Exception ex)
            {
                Response.Write("<script>alert('修改失败！');window.location='../Login.aspx';</script>");
            }
            finally
            {
                db.OffData();
            }
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            //取出修改行的主键值
            int s_c_id = int.Parse(e.CommandArgument.ToString());
            DB db = new DB();
            db.ExecuteNonQuery("delete from Shipping_Table where s_c_id=" + s_c_id + " and s_u_id=" + Session["USERID"]);
            db.OffData();
            GetData();
        }
    }
}