<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MyOrder.aspx.cs" Inherits="FlowerShop.user.MyOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>我的订单</title>
    <link href="../css/Master.css" rel="stylesheet" />
    <link href="../css/ShoppingCart.css" rel="stylesheet" />
    <link href="../css/MyOrder.css" rel="stylesheet" />
    <script src="../js/jquery-3.5.1.min.js"></script>
    <script src="../js/Master1.js"></script>
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content> --%>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <div class="S-MainCont">
        <!-- 筛选 start-->
        <div class="MO-filterbar">
            <div class="Mo-sou">
                <asp:TextBox ID="TextBox1" CssClass="MO-sousuo" runat="server"  Placeholder="订单编号" BorderStyle="None"></asp:TextBox>
                <div class="MO-soubut">
                    <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return SousuoOder()" OnClick="LinkButton1_Click" runat="server">
                    <i class="iconfont">&#xe60f;</i>
                    查询
                    </asp:LinkButton>
                </div>
            </div>
        </div>
        <!-- 筛选 end-->
        <asp:DataList ID="DataList2" CssClass="MO-DataList2" runat="server" OnSelectedIndexChanged="DataList2_SelectedIndexChanged" >
            <ItemTemplate>
                <div class="S-Cart">
                    <div class="S-title">
                        <h3 class="MO-tit">订单编号：<asp:Label ID="Label1" CssClass="MO-o_id" runat="server" Text='<%# Eval("o_id") %>'></asp:Label></h3>
                        <asp:Label ID="Label10" CssClass="MO-time" runat="server" Text='<%# Eval("o_date") %>'></asp:Label>
                    </div>
                    <asp:DataList ID="DataList1" runat="server" DataSource='<%# GetDetails(Eval("o_id").ToString()) %>'>
                        <ItemTemplate>
                            <div class="MO-order-list">
                                <div class="dst_img">
                                    <img src="../Images/img/<%# Eval("c_pic") %>" />
                                </div>
                                <div class="dst_txt">
                                    <div>
                                        <h3>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("c_name") %>'></asp:Label>
                                        </h3>
                                    </div>
                                    <div>
                                        <p class="MO-piroe">
                                            ￥ <asp:Label ID="Label7" runat="server" Text='<%# Convert.ToDouble(Eval("c_price")) %>'></asp:Label>
                                        </p>
                                        <p class="MO-num">
                                            数量： <asp:Label ID="Label2" runat="server" Text='<%# Eval("o_s_num") %>'></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="MO-bottom">
                        <p>
                            收货人：<asp:Label ID="Label3" runat="server" Text='<%# Eval("o_a_name") %>'></asp:Label>
                        </p>
                        <p>
                            收货手机号：<asp:Label ID="Label4" runat="server" Text='<%# Eval("o_a_iphone") %>'></asp:Label>
                        </p>
                        <p>
                            收货地址：<asp:Label ID="Label5" runat="server" Text='<%# Eval("o_a_address") %>'></asp:Label>
                        </p>
                        <p>
                            邮编：<asp:Label ID="Label6" runat="server" Text='<%# Eval("o_a_postcode") %>'></asp:Label>
                        </p>
                        <p>
                            配送方式：<asp:Label ID="Label9" runat="server" Text='<%# Eval("o_delivery") %>'></asp:Label>
                        </p>
                        <p>
                            留言：<asp:Label ID="Label13" runat="server" Text='<%# Eval("o_message") %>'></asp:Label>
                        </p>
                        <p class="MO-buy MO-buy-price">
                            总金额：<asp:Label ID="Label11" runat="server" Text='<%# " ￥ " + BuyPrice(Eval("o_id").ToString()) %>'></asp:Label>
                        </p>
                        <br />
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
<%-- <asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>--%>
