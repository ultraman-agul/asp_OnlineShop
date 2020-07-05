using FlowerShop.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlowerShop.user
{
    public partial class Orders : System.Web.UI.Page
    {
        /// <summary>
        /// 支付按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('支付成功');</script>");
            flag = true;
        }

        /// <summary>
        /// 加载数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERName"] == null)
            {
                Response.Write("<script>alert('您还没登录，请先登录！');window.location='../Login.aspx';</script>");
            }
            else
            {
                if (!IsPostBack)
                {
                    GetData();
                }
            }
        }

        protected void GetData()
        {
            DB db = new DB();
            string sql = "SELECT DISTINCT * FROM Shipping_Table WHERE s_u_id=" + Session["USERID"] + " and s_buy=1 ORDER BY  s_c_id";
            db.LoadExecuteData(sql);
            this.DataList1.DataKeyField = "s_c_id";
            DataList1.DataSource = db.MyDataSet.Tables[0].DefaultView;//设置DataList控件的数据源为创建的数据集ds
            DataList1.DataBind();                           //绑定数据库表中数据

            // 总价格
            int mm = 0;
            int count = 0;
            SqlDataReader sdr2 = db.DataReader("select s_price,s_num from Shipping_Table where s_u_id=" + Session["USERID"] + " and s_buy=1");
            while (sdr2.Read())
            {
                mm += Convert.ToInt32(Convert.ToInt32(sdr2["s_num"].ToString().Trim()) * Convert.ToDouble(sdr2["s_price"].ToString().Trim()));
                count += Convert.ToInt32(Convert.ToInt32(sdr2["s_num"].ToString().Trim()));
            }
            // 商品数
            Label4.Text = Convert.ToString(count);
            // 总价格
            Label6.Text = " ￥ " + Convert.ToString(mm);
            Label8.Text = " ￥ " + Convert.ToString(mm);
            db.OffData();
            DB db1 = new DB();
            string sql1 = "SELECT DISTINCT * FROM Address_Table WHERE a_id=" + Session["USERID"];
            db1.LoadExecuteData(sql1, "Address_Table");
            //给下拉列表添加数据库地址表数据
            for (int i = 0; i < db1.MyDataSet.Tables["Address_Table"].Rows.Count; i++)
            {
                DropDownList1.Items.Add(db1.MyDataSet.Tables["Address_Table"].Rows[i]["a_name"].ToString());
                DropDownList2.Items.Add(db1.MyDataSet.Tables["Address_Table"].Rows[i]["a_iphone"].ToString());
                DropDownList3.Items.Add(db1.MyDataSet.Tables["Address_Table"].Rows[i]["a_address"].ToString());
                DropDownList4.Items.Add(db1.MyDataSet.Tables["Address_Table"].Rows[i]["a_postcode"].ToString());
            }
            db1.OffData();
        }

        //默认未支付，不能购买
        protected static bool flag = false;

        protected void Button1_Click(object sender, EventArgs e)
        {
            AddOrder();
        }

        protected void AddOrder()
        {
            DB db = new DB();

            //用户ID
            string u_id = Session["USERID"].ToString();
            //收货人
            //优先选取文本框内容，为空则选取下拉表选中内容
            string u_name = TextBox1.Text.Trim() != "" ? TextBox1.Text.Trim() : DropDownList1.SelectedValue.ToString().Trim();
            //收货电话
            string u_p = TextBox2.Text.Trim() != "" ? TextBox2.Text.Trim() : DropDownList2.SelectedValue.ToString().Trim();
            //收货地址
            string u_address = TextBox3.Text.Trim() != "" ? TextBox3.Text.Trim() : DropDownList3.SelectedValue.ToString().Trim();
            //邮编
            string a_post = TextBox4.Text.Trim() != "" ? TextBox4.Text.Trim() : DropDownList4.SelectedValue.ToString().Trim();
            // 配送方式
            string o_delivery = DropDownList5.SelectedValue.ToString().Trim();
            // 生成18位的订单编号
            Random rd = new Random();
            int o_id1 = rd.Next(1000, 9999);
            string o_id = DateTime.Now.ToString("yyyyMMddHHffss") + Convert.ToString(o_id1);
            // 下单时间
            DateTime date = DateTime.Now;
            ArrayList s_c_id = new ArrayList();
            string sql = "SELECT DISTINCT s_c_id,s_num FROM Shipping_Table WHERE s_u_id=" + Session["USERID"] + " and s_buy=1 ORDER BY  s_c_id";
            db.LoadExecuteData(sql, "Shipping");//本地加载购物车表
            db.LoadData("Order_Table", "Order");//本地加载订单表
            for (int i = 0; i < db.MyDataSet.Tables["Shipping"].Rows.Count; i++)
            {
                //保存s_c_id到ArraryList
                s_c_id.Add(Convert.ToInt32(db.MyDataSet.Tables["Shipping"].Rows[i]["s_c_id"].ToString().Trim()));
                DataRow dr = db.MyDataSet.Tables["Order"].NewRow();//根据本地数据库中，表的结构，复制一条空行
                dr.BeginEdit();//开始编辑行
                dr["o_c_id"] = Convert.ToInt32(db.MyDataSet.Tables["Shipping"].Rows[i]["s_c_id"].ToString().Trim()); // 商品id
                dr["o_s_num"] = Convert.ToInt32(db.MyDataSet.Tables["Shipping"].Rows[i]["s_num"].ToString().Trim()); // 商品数量
                dr["o_id"] = o_id; //订单编号
                dr["o_u_id"] = Convert.ToInt32(u_id); // 用户id
                dr["o_a_postcode"] = a_post; // 邮编
                dr["o_a_address"] = u_address; // 收货地址
                dr["o_a_name"] = u_name; // 收货人
                dr["o_a_iphone"] = u_p; // 收货手机号
                dr["o_date"] = date; // 时间
                if (TextBox5.Text.Trim() != "")
                {
                    dr["o_message"] = TextBox5.Text.Trim(); // 留言
                }
                dr["o_delivery"] = o_delivery; // 配送方式
                dr["o_flag"] = 1; // 是否付款
                db.MyDataSet.Tables["Order"].Rows.Add(dr); //将编辑的行添加到本地数据库中
                dr.EndEdit();//结束编辑行
                db.UploadData("Order");//上传本地数据库
                // 修改商品表的销量和库存
                string sql2 = "update Commodity_Table set c_sale+="
                    + Convert.ToInt32(db.MyDataSet.Tables["Shipping"].Rows[i]["s_num"].ToString().Trim())
                    + ",c_stock-=" + Convert.ToInt32(db.MyDataSet.Tables["Shipping"].Rows[i]["s_num"].ToString().Trim())
                    + " where c_id=" + Convert.ToInt32(db.MyDataSet.Tables["Shipping"].Rows[i]["s_c_id"].ToString().Trim());
                db.ExecuteNonQuery(sql2);
                db.OffData();
                db.Empty();
                DB db3 = new DB();
                for (int j = 0; j < s_c_id.Count; j++)
                {
                    // 删除购物车记录
                    string sql3 = "DELETE FROM Shipping_Table WHERE  s_u_id=" + Session["USERID"] + " and s_c_id=" + s_c_id[j];
                    db3.ExecuteNonQuery(sql3);
                }
                db3.OffData();                            
            }
            if (flag)
                {
                    flag = false;
                    Response.Write("<script>alert('购买成功！');window.location='MyOrder.aspx';</script>");
                }
            else
                {
                    Response.Write("<script>alert('您没给钱，想白嫖？！');window.location='Orders.aspx';</script>");
                }
         } 
    }
}