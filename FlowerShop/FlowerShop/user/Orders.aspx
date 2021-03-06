﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="FlowerShop.user.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>支付订单</title>
    <link href="../css/Master.css" rel="stylesheet" />
    <link href="../css/ShoppingCart.css" rel="stylesheet" />
    <link href="../css/Orders.css" rel="stylesheet" />
    <script src="../js/jquery-3.5.1.mi.js"></script>
    <script src="../js/Orders.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div class="S-MainCont">
        <div class="S-Cart">
            <div class="S-title">
                <h3><span class="O-tit">核对购物车清单</span></h3>
            </div>
            <!--显示清单-->
            <asp:DataList ID="DataList1" runat="server" CssClass="auto-style1">
                <ItemTemplate>
                    <div class="dst_table">
                        <div class="dst_img">
                            <img src="../Images/img/<%# Eval("s_pic") %>"  />
                        </div>
                        <div class="dst_txt">
                            <div class="txt_name">
                                <h3>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("s_c_name") %>'></asp:Label>
                                </h3>
                            </div>
                            <div >
                                <asp:Label ID="Label2" CssClass="txt_money" runat="server" Text='<%#" ￥ " + Convert.ToDouble( Eval("s_price")) %>'></asp:Label>
                                &nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label3" runat="server" Text='<%#"x" + Eval("s_num") %>'>></asp:Label>
                            </div>                           
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
         <!-- 收货信息 -->
            <div class="O-contbottom">
                <div class="address_List">
                    <div class="address_1">
                        <br />
                        <p  >
                            <asp:Label ID="Label9" runat="server" Text="收货人："></asp:Label>
                            <asp:DropDownList ID="DropDownList1" CssClass="O-ddl ddl1" runat="server"></asp:DropDownList>
                        </p>
                        <p>
                            <asp:TextBox ID="TextBox1" runat="server"  CssClass="O-textBox textBox1" TextMode="MultiLine"></asp:TextBox>
                        </p>
                        <p >
                            <asp:Label ID="Label10" runat="server" Text="收货电话："></asp:Label>
                            <asp:DropDownList ID="DropDownList2" CssClass="O-ddl ddl2" runat="server" ></asp:DropDownList>
                        </p>
                        <p>
                            <asp:TextBox ID="TextBox2" runat="server"  CssClass="O-textBox textBox2" TextMode="MultiLine"></asp:TextBox>
                        </p>
                        <p >
                            <asp:Label ID="Label11" runat="server" Text="收货地址："></asp:Label>
                            <asp:DropDownList ID="DropDownList3" CssClass="O-ddl ddl3" runat="server" ></asp:DropDownList>
                        </p>
                        <p>
                            <asp:TextBox ID="TextBox3" runat="server"  CssClass="O-textBox textBox3" TextMode="MultiLine"></asp:TextBox>
                        </p>
                        <p >
                            <asp:Label ID="Label1" runat="server" >邮 编：</asp:Label>
                            <asp:DropDownList ID="DropDownList4" CssClass="O-ddl ddl4" runat="server" ></asp:DropDownList>
                        </p>
                        <p>
                            <asp:TextBox ID="TextBox4" runat="server"  CssClass="O-textBox textBox4" TextMode="MultiLine"></asp:TextBox>
                        </p>
                        <p class="O-message" >
                            <asp:Label ID="Label14"  runat="server" Text="留言："></asp:Label>
                            <asp:TextBox ID="TextBox5" runat="server"  CssClass="O-textBox textBox5" TextMode="MultiLine"></asp:TextBox>
                        </p>
                        <p >
                            <asp:Label ID="Label13" runat="server" Text="配送方式："></asp:Label>
                            <asp:DropDownList ID="DropDownList5" CssClass="O-ddl" runat="server" >
                                <asp:ListItem>圆通</asp:ListItem>
                                <asp:ListItem>顺丰</asp:ListItem>
                                <asp:ListItem>邮政</asp:ListItem>
                                <asp:ListItem>韵达</asp:ListItem>
                                <asp:ListItem>天天</asp:ListItem>
                            </asp:DropDownList>
                        </p>
                    </div>
                </div>
                <br />
                <div class="bottom_1">
                    <asp:Label ID="Label4" CssClass="O-num" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="件商品,总金额："></asp:Label>
                    &nbsp;<asp:Label ID="Label6" CssClass="O-price" runat="server" Text="Label"></asp:Label><br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label7" runat="server" Text="支付款:"></asp:Label>
                    &nbsp;
                        <asp:Label ID="Label8" CssClass="O-price" runat="server" Text="Label"></asp:Label>
                </div>
                <!--支付-->
                <div class="O-pay" >   
                            <asp:Button Text="点击支付" runat="server" OnClick="Unnamed1_Click" CssClass="O-paybtn" />
                            <span>&gt;&gt;</span>
                </div>                
                <div class="bottom_but">
                    <asp:Button ID="Button1" runat="server" CssClass="but_1" Text="提交订单" BorderStyle="None" OnClick="Button1_Click"/>
                </div>
        </div>
    </div>
</asp:Content>
<%--<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>--%>
