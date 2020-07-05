using FlowerShop.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlowerShop
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            //顶栏链接
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                HyperLink8.Text = Session["USERName"].ToString();
                HyperLink9.Text = "退出";
                HyperLink9.NavigateUrl = "~/Login.aspx";
                HyperLink8.NavigateUrl = "#";
                HyperLink12.NavigateUrl = "#";
            }
            else if (Session["Adminame"] != null && Session["AdminPWD"] != null)
            {
                HyperLink8.Text = Session["Adminame"].ToString();
                HyperLink9.Text = "退出";
                HyperLink9.NavigateUrl = "~/Login.aspx";
                HyperLink8.NavigateUrl = "~/admin/UserShow.aspx";
            }
            else
            {
                HyperLink8.Text = "你好，请登录";
                HyperLink8.NavigateUrl = "~/Login.aspx";
                HyperLink9.Text = "注册";
                HyperLink9.NavigateUrl = "~/user/Register.aspx";
            }

            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {   //购物车显示数量
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

        //导航到指定页面，传递Session保存信息
        protected void XH_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["XH_Flower"] = 0;
            Response.Redirect("~/user/FlowersPackage.aspx? ");
        }
        protected void AQ_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["XH_Flower"] = 1;
            Response.Redirect("~/user/FlowersPackage.aspx? ");
        }
        protected void SR_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["XH_Flower"] = 2;
            Response.Redirect("~/user/FlowersPackage.aspx? ");
        }
        protected void HQ_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["XH_Flower"] = 3;
            Response.Redirect("~/user/FlowersPackage.aspx? ");
        }
        protected void SH_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["XH_Flower"] = 4;
            Response.Redirect("~/user/FlowersPackage.aspx? ");
        }
        protected void SW_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["XH_Flower"] = 5;
            Response.Redirect("~/user/FlowersPackage.aspx? ");
        }
        protected void BY_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["XH_Flower"] = 6;
            Response.Redirect("~/user/FlowersPackage.aspx? ");
        }
        protected void QT_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["XH_Flower"] = 7;
            Response.Redirect("~/user/FlowersPackage.aspx? ");
        }
        // 永生花
        protected void YS_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["YS_Flower"] = 0;
            Response.Redirect("~/user/PreservedFlower.aspx? ");
        }
        protected void JD_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["YS_Flower"] = 1;
            Response.Redirect("~/user/PreservedFlower.aspx? ");
        }
        protected void JX_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["YS_Flower"] = 2;
            Response.Redirect("~/user/PreservedFlower.aspx? ");
        }
        protected void XY_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["YS_Flower"] = 3;
            Response.Redirect("~/user/PreservedFlower.aspx? ");
        }
        protected void PH_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["YS_Flower"] = 4;
            Response.Redirect("~/user/PreservedFlower.aspx? ");
        }
        protected void TS_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["YS_Flower"] = 5;
            Response.Redirect("~/user/PreservedFlower.aspx? ");
        }
        // 礼品
        protected void LP_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["LP_Flower"] = 0;
            Response.Redirect("~/user/Gift.aspx? ");
        }
        protected void YY_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["LP_Flower"] = 1;
            Response.Redirect("~/user/Gift.aspx? ");
        }
        protected void JB_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["LP_Flower"] = 2;
            Response.Redirect("~/user/Gift.aspx? ");
        }
        protected void SJ_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["LP_Flower"] = 3;
            Response.Redirect("~/user/Gift.aspx? ");
        }
        protected void SM_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["LP_Flower"] = 4;
            Response.Redirect("~/user/Gift.aspx? ");
        }
        protected void QK_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["LP_Flower"] = 5;
            Response.Redirect("~/user/Gift.aspx? ");
        }
        protected void GS_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["LP_Flower"] = 6;
            Response.Redirect("~/user/Gift.aspx? ");
        }
        protected void BQ_LinkButton1_Click(object sender, EventArgs e)
        {
            Session["LP_Flower"] = 7;
            Response.Redirect("~/user/Gift.aspx? ");
        }
    }
}