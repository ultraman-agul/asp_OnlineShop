using FlowerShop.App_Code;
using System;
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
    public partial class MyOrder : System.Web.UI.Page
    {
        protected static string userId = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                userId = Session["USERID"].ToString();
                if (!IsPostBack)
                {
                    GetData();
                }
            }
            else
            {
                Response.Write("<script>alert('您还没登录，请先登录！');window.location='../Login.aspx';</script>");
            }
        }

        /// <summary>
        /// 绑定数据源(全部)
        /// </summary>
        protected void GetData()
        {
            DB db = new DB();
            string sql = "SELECT DISTINCT  o_id,o_a_name,o_a_iphone,o_a_address,o_a_postcode,o_date,o_delivery,o_flag,o_message  FROM Order_Table WHERE o_u_id=" + Session["USERID"] + " ORDER BY  o_date desc";
            db.LoadExecuteData(sql);
            this.DataList2.DataKeyField = "o_id";
            DataList2.DataSource = db.MyDataSet.Tables[0].DefaultView;//设置DataList控件的数据源为创建的数据集ds
            DataList2.DataBind();                           //绑定数据库表中数据
            db.OffData();
        }

        /// <summary>
        /// 绑定数据源(订单编号查询)
        /// </summary>
        /// <param name="o_flag"></param>
        protected void GetData(string o_id)
        {
            DB db = new DB();
            string sql = "SELECT DISTINCT  o_id,o_a_name,o_a_iphone,o_a_address,o_a_postcode,o_date,o_delivery,o_flag,o_message  FROM Order_Table WHERE o_u_id=" + Session["USERID"] + " and o_id='" + o_id + "' ORDER BY  o_date desc";
            db.LoadExecuteData(sql);
            this.DataList2.DataKeyField = "o_id";
            DataList2.DataSource = db.MyDataSet.Tables[0].DefaultView;//设置gridview控件的数据源为创建的数据集ds
            DataList2.DataBind();                           //绑定数据库表中数据
            db.OffData();
        }

        /// <summary>
        /// 绑定商品信息
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        protected DataTable GetDetails(string orderID)
        {
            string sql = "SELECT DISTINCT  Commodity_Table.c_pic, Commodity_Table.c_name, Commodity_Table.c_price, Order_Table.*  FROM Order_Table INNER JOIN Commodity_Table ON Order_Table.o_c_id = Commodity_Table.c_id WHERE o_u_id=" + Session["USERID"] + " and o_id='" + orderID + "'  ORDER BY  o_c_id";
            DB db = new DB();
            db.LoadExecuteData(sql);
            db.OffData();
            return db.MyDataSet.Tables[0];
        }

        /// <summary>
        /// 计算总金额
        /// </summary>
        /// <param name="o_id"></param>
        /// <returns></returns>
        protected string BuyPrice(string o_id)
        {
            DB db = new DB();
            int mm = 0;
            SqlDataReader sdr2 = db.DataReader("select Order_Table.o_s_num,Commodity_Table.c_price from Order_Table INNER JOIN Commodity_Table ON Order_Table.o_c_id = Commodity_Table.c_id where Order_Table.o_u_id=" + Session["USERID"] + " and o_id='" + o_id + "'");
            while (sdr2.Read())
            {
                mm += Convert.ToInt32(Convert.ToInt32(sdr2["o_s_num"].ToString().Trim()) * Convert.ToDouble(sdr2["c_price"].ToString().Trim()));
            }
            sdr2.Close();
            db.OffData();
            return Convert.ToString(mm);
        }


        /// <summary>
        /// 订单编号查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GetData(TextBox1.Text.Trim());
        }

        protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}