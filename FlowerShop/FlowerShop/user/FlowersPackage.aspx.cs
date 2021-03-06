﻿using FlowerShop.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlowerShop.user
{
    public partial class FlowersPackage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["XH_Flower"] != null)
                {
                    int index = Convert.ToInt32(Session["XH_Flower"].ToString());
                    Session["XH_Flower"] = null;
                    switch (index)
                    {
                        case 0:  // 全部
                            GetData(" order by c_flower_language asc");
                            break;
                        case 1:  // 爱情系列
                            DropDownList2.SelectedIndex = 1;
                            GetDataX(DropDownList2.SelectedValue.ToString().Trim(), " order by c_flower_language asc"); //默认花语升序
                            break;
                        case 2:  // 生日系列
                            DropDownList2.SelectedIndex = 2;
                            GetDataX(DropDownList2.SelectedValue.ToString().Trim(), " order by c_flower_language asc"); //默认花语升序
                            break;
                        case 3:  // 婚庆系列
                            DropDownList2.SelectedIndex = 3;
                            GetDataX(DropDownList2.SelectedValue.ToString().Trim(), " order by c_flower_language asc"); //默认花语升序
                            break;
                        case 4:  // 生活系列
                            DropDownList2.SelectedIndex = 4;
                            GetDataX(DropDownList2.SelectedValue.ToString().Trim(), " order by c_flower_language asc"); //默认花语升序
                            break;
                        case 5:  // 商务系列
                            DropDownList2.SelectedIndex = 5;
                            GetDataX(DropDownList2.SelectedValue.ToString().Trim(), " order by c_flower_language asc"); //默认花语升序
                            break;
                        case 6:  // 殡仪系列
                            DropDownList2.SelectedIndex = 6;
                            GetDataX(DropDownList2.SelectedValue.ToString().Trim(), " order by c_flower_language asc"); //默认花语升序
                            break;
                        case 7:  // 其它系列
                            DropDownList2.SelectedIndex = 7;
                            GetDataX(DropDownList2.SelectedValue.ToString().Trim(), " order by c_flower_language asc"); //默认花语升序
                            break;
                    }
                }
                else
                {
                    GetData(" order by c_flower_language asc");
                }
            }
        }

        /// <summary>
        /// 全部
        /// </summary>
        protected void GetData(string sql_sort)
        {
            DB db = new DB();
            string sql = "SELECT DISTINCT  * FROM [Commodity_Table] WHERE c_kind='鲜花' " + sql_sort;
            db.LoadExecuteData(sql);
            DataList1.DataSource = db.MyDataSet.Tables[0].DefaultView;//设置DataList控件的数据源为创建的数据集ds 
            DataList1.DataBind(); //绑定数据库表中数据
            db.OffData();
        }

        /// <summary>
        /// 系列
        /// </summary>
        protected void GetDataX(string c_series, string sql_sort)
        {
            DB db = new DB();
            string sql = "select DISTINCT * from Commodity_Table where c_kind='鲜花' and c_series='" + c_series + "' " + sql_sort;
            db.LoadExecuteData(sql);
            DataList1.DataSource = db.MyDataSet.Tables[0].DefaultView;//设置DataList控件的数据源为创建的数据集ds 
            DataList1.DataBind(); //绑定数据库表中数据
            db.OffData();
        }

        protected static bool flagNum = true; // false == 上
        protected static bool flagPrice = true; // false == 上

        /// <summary>
        /// 在更改选定索引后激发
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            // 获取选定索引值
            string c_series = DropDownList2.SelectedValue.ToString().Trim();
            if (DropDownList2.SelectedIndex == 0)
            {
                GetData(" order by c_flower_language asc");//默认花语升序
            }
            else
            {
                GetDataX(c_series, " order by c_flower_language asc"); //默认花语升序
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // 获取选定索引值
            string c_series = DropDownList2.SelectedValue.ToString().Trim();
            if (flagNum)
            {
                flagNum = false; // 上 升序
                if (c_series == "全部")
                {
                    GetData(" order by c_sale asc");
                }
                else
                {
                    GetDataX(c_series, " order by c_sale asc");
                }
            }
            else
            {
                flagNum = true; // 下 降序
                if (c_series == "全部")
                {
                    GetData(" order by c_sale desc");
                }
                else
                {
                    GetDataX(c_series, " order by c_sale desc");
                }
            }
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>filterNum();</script>");

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            // 获取选定索引值
            string c_series = DropDownList2.SelectedValue.ToString().Trim();
            if (flagPrice)
            {
                flagPrice = false; // 上 升序
                if (c_series == "全部")
                {
                    GetData(" order by c_price asc");
                }
                else
                {
                    GetDataX(c_series, " order by c_price asc");
                }
            }
            else
            {
                flagPrice = true; // 下 降序
                if (c_series == "全部")
                {
                    GetData(" order by c_price desc");
                }
                else
                {
                    GetDataX(c_series, " order by c_price desc");
                }
            }

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "discribe")//详情
            {
                string c_id = e.CommandArgument.ToString();
                Response.Redirect("DetailsFlower.aspx?c_id=" + c_id);
            }
            else if (e.CommandName == "buy")//加入购物车按钮
            {
                if (Session["USERName"] != null && Session["USERPWD"] != null)
                {
                    string c_id = e.CommandArgument.ToString();
                    AddData(c_id);
                    Response.Redirect("ShoppingCart.aspx?");
                }
                else
                {
                    Response.Write("<script> alert('您还没登录，请先登录！');window.location='../Login.aspx'</script>");
                }
            }
        }

        protected void AddData(string c_id)
        {
            DB db = new DB();
            if (db.Query("select * from Shipping_Table where s_c_id=" + c_id + " and s_u_id=" + Session["USERID"]))//判断该商品是否存在
            {
                db.ExecuteNonQuery("update Shipping_Table set s_num=s_num+1 where s_c_id=" + c_id + " and s_u_id=" + Session["USERID"]);//数量+1
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