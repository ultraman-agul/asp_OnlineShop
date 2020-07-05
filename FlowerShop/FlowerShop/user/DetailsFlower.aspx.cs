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
    public partial class DetailsFlower : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // 第一次加载页面 
            {
                string c_id = Request.QueryString["c_id"].ToString().Trim();
                DB dB = new DB();
                if (!dB.Fault)//判断是否成功连接数据库
                {   //读取内容显示到页面
                    dB.LoadData(" Commodity_Table", "c_id", Convert.ToInt32(c_id));
                    LinkButton41.Text = dB.GetValue("c_kind");
                    Label5.Text = dB.GetValue("c_kind");
                    Label1.Text = dB.GetValue("c_name");
                    Label4.Text = dB.GetValue("c_name");
                    Image1.ImageUrl = "../Images/img/" + dB.GetValue("c_pic");
                    Label2.Text = dB.GetValue("c_sale");
                    Label6.Text = dB.GetValue("c_flower_material");
                    Label7.Text = dB.GetValue("c_packing");
                    Label8.Text = dB.GetValue("c_flower_language");
                    Label9.Text = dB.GetPriceValue("c_price");
                    Label3.Text = dB.GetValue("c_introduce");
                    Image2.ImageUrl = "../Images/img/" + dB.GetValue("c_detailed_pic");
                }
                else
                {
                    dB.OffData();
                    Response.Write("<script> alert('连接数据库失败！')</script>");
                }

            }
            //显示当前用户购物车的商品数量
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                DB db = new DB();
                int mm = 0;
                SqlDataReader sdr2 = db.DataReader("select s_c_id from Shipping_Table where s_u_id=" + Session["USERID"]);
                while (sdr2.Read())
                {
                    mm++;
                }
                Label1.Text = Convert.ToString(mm);
                sdr2.Close();
                db.OffData();
            }
        }

        /// <summary>
        /// 加入购物车
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButton42_Click(object sender, EventArgs e)
        {
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                string c_id = Request.QueryString["c_id"].ToString().Trim();
                AddData(c_id);
                Response.Redirect("ShoppingCart.aspx?");
            }
            else
            {
                Response.Write("<script>alert('您还没登录，请先登录！')</script>");             
            }

        }

        /// <summary>
        /// 立即购买
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButton43_Click(object sender, EventArgs e)
        {
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                string c_id = Request.QueryString["c_id"].ToString().Trim();
                UpData(c_id);
                AddData2(c_id);
                Response.Redirect("Orders.aspx?");
            }
            else
            {
                Response.Write("<script>alert('您还没登录，请先登录！')</script>");
            }
        }

        /// <summary>
        /// 加入购物车
        /// </summary>
        /// <param name="c_id"></param>
        protected void AddData(string c_id)
        {
            DB db = new DB();
            if (db.Query("select * from Shipping_Table where s_c_id=" + c_id + " and s_u_id=" + Session["USERID"]))//判断该商品在购物车中是否存在
            {
                db.ExecuteNonQuery("update Shipping_Table set s_num=s_num+1,s_buy=1 where s_c_id=" + c_id + " and s_u_id=" + Session["USERID"]);//数量+1
            }
            else
            {
                SqlDataReader sdr = db.DataReader("select c_name,c_price,c_pic from Commodity_Table where c_id=" + c_id);
                string c_name = null;
                double c_price = 0.0;
                string c_pic = null;
                //数据库存在该商品
                while (sdr.Read())
                {
                    c_name = sdr["c_name"].ToString().Trim();
                    c_price = Convert.ToDouble(sdr["c_price"].ToString().Trim());
                    c_pic = sdr["c_pic"].ToString().Trim();
                }
                sdr.Close();
                //添加商品到购物车
                db.ExecuteNonQuery("insert into Shipping_Table values(" + Session["USERID"] + "," + c_id + ",'" + c_name + "'," + c_price + ",'" + c_pic + "',1,1)");
            }
            db.OffData();
        }

        /// <summary>
        /// 购买
        /// </summary>
        /// <param name="c_id"></param>
        protected void UpData(string c_id)
        {
            DB db = new DB();
            db.ExecuteNonQuery("update Shipping_Table set s_buy=0 where s_u_id=" + Session["USERID"]);//设置购物车全部商品为已购买
            db.OffData();
        }

        protected void AddData2(string c_id)
        {
            DB db = new DB();
            if (db.Query("select * from Shipping_Table where s_c_id=" + c_id + " and s_u_id=" + Session["USERID"]))//判断该商品在购物车中是否存在
            {
                db.ExecuteNonQuery("update Shipping_Table set s_num=1,s_buy=1 where s_c_id=" + c_id + " and s_u_id=" + Session["USERID"]);//数量=1
            }
            else
            {
                SqlDataReader sdr = db.DataReader("select c_name,c_price,c_pic from Commodity_Table where c_id=" + c_id);
                string c_name = null;
                double c_price = 0.0;
                string c_pic = null;
                while (sdr.Read())
                {
                    c_name = sdr["c_name"].ToString().Trim();
                    c_price = Convert.ToDouble(sdr["c_price"].ToString().Trim());
                    c_pic = sdr["c_pic"].ToString().Trim();
                }
                sdr.Close();
                //添加商品到购物车
                db.ExecuteNonQuery("insert into Shipping_Table values(" + Session["USERID"] + "," + c_id + ",'" + c_name + "'," + c_price + ",'" + c_pic + "',1,1)");
            }
            db.OffData();
        }
    }
}