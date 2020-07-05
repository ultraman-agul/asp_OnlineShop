<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FlowersPackage.aspx.cs" Inherits="FlowerShop.user.FlowersPackage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>鲜花系列</title>
    <link href="../css/FlowersPackage.css" rel="stylesheet"/>
    <link href="../css/Master.css" rel="stylesheet" />
    <script src="../js/jquery-3.5.1.min.js"></script>
    <script src="../js/indexCarousel.js"></script>
    <script src="../js/Master.js"></script>
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <div class="F-top">
        <div class="F-RightTop">
            <!--动态轮播图区 start-->
            <div class="FF-slideshow">
                <div class="center-left-img">
                    <!--图片盒子 start-->
                    <div class="imgBox">
                        <div class="img-slide ">
                            <asp:HyperLink ID="HyperLink1" runat="server">
                        <div class="fill" style="background-image:url('../Images/14.jpg')"></div>
                            </asp:HyperLink>
                        </div>
                        <div class="img-slide ">
                            <asp:HyperLink ID="HyperLink2" runat="server">
                        <div class="fill" style="background-image:url('../Images/15.jpg')"></div>
                            </asp:HyperLink>
                        </div>
                        <div class="img-slide ">
                            <asp:HyperLink ID="HyperLink3" runat="server">
                        <div class="fill" style="background-image:url('../Images/16.jpg')"></div>
                            </asp:HyperLink>
                        </div>
                    </div>
                    <!--图片盒子 end-->
                    <!--浮动圆点 start-->
                    <div class="dot">
                        <div><i class="iconfont font-dot dot1" onclick="DotClick(0)" onmouseover="DotHover(0)">&#xe63c;</i></div>
                        <div><i class="iconfont font-dot dot2" onclick="DotClick(1)" onmouseover="DotHover(1)">&#xe63c;</i></div>
                        <div><i class="iconfont font-dot dot3" onclick="DotClick(2)" onmouseover="DotHover(2)">&#xe63c;</i></div>
                    </div>
                    <!--浮动圆点 end-->
                    <!--切换箭头 start-->
                    <div class="switcher-div">
                        <span class="switcher FF-s-left">
                            <i class="iconfont " onclick="FFSwitcherClick(0)">&#xe628;</i>
                        </span>
                        <span class="switcher FF-s-right">
                            <i class="iconfont " onclick="FFSwitcherClick(1)">&#xe628;</i>
                        </span>
                    </div>
                    <!--切换箭头 end-->
                </div>
            </div>
            <!--动态轮播图区 end-->
        </div>
    </div>
    <!-- 主内容区 start-->
    <div class="F-MinCon">
                <!-- 筛选 start-->
                <div class="F-filterbar">
                    <ul class="F-filter-items">
                        <li>
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="F-classify-box F-classify2" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>全部</asp:ListItem>
                                <asp:ListItem>爱情系列</asp:ListItem>
                                <asp:ListItem>生日系列</asp:ListItem>
                                <asp:ListItem>婚庆系列</asp:ListItem>
                                <asp:ListItem>生活系列</asp:ListItem>
                                <asp:ListItem>商务系列</asp:ListItem>
                                <asp:ListItem>殡仪系列</asp:ListItem>
                                <asp:ListItem>其它系列</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>
                            <asp:LinkButton ID="LinkButton1" CssClass="F-filter-num" OnClick="LinkButton1_Click" runat="server">
                                销量
                                <i class="iconfont F-icon1">&#xe63b;</i>
                            </asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="LinkButton2" CssClass="F-filter-price" OnClick="LinkButton2_Click" runat="server">
                                价格
                                <i class="iconfont F-icon2">&#xe63b;</i>
                            </asp:LinkButton>
                        </li>
                    </ul>
                </div>
                <!-- 筛选 end-->
                <!-- 显示商品 start-->
                <div class="F-ShowCommodity">
                    <asp:DataList ID="DataList1" CssClass="F-ShowCommodity-list" RepeatColumns="5" runat="server" OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
                            <div class="F-Show-grid">
                                <div class="F-Show-img-box">
                                    <asp:LinkButton ID="LinkButton3" CommandArgument='<%# Eval("c_id") %>' CommandName="discribe" runat="server">
                                        <img src="../Images/img/<%# Eval("c_pic") %>" />
                                    </asp:LinkButton>
                                </div>
                                <div>
                                    <div class="F-Show-price">
                                        <span class="F-Show-price-sign">￥</span>
                                        <asp:Label ID="Label4" CssClass="F-Show-price-num" runat="server" Text='<%# Convert.ToDouble( Eval("c_price")) %>'></asp:Label>
                                    </div>
                                    <div class="F-Show-title">
                                        <asp:LinkButton ID="LinkButton4" CommandArgument='<%# Eval("c_id") %>' CommandName="discribe" runat="server">
                                            <asp:Label ID="Label5" CssClass="F-Show-name-title" runat="server" Text='<%# Eval("c_name") %>'></asp:Label>
                                            <asp:Label ID="Label6" CssClass="F-Show-language" runat="server" Text='<%# Eval("c_flower_language") %>'></asp:Label>
                                        </asp:LinkButton>
                                    </div>
                                    <div>
                                        <asp:LinkButton ID="LinkButton8" CssClass="F-Show-operate" CommandArgument='<%# Eval("c_id") %>' CommandName="buy" runat="server" >
                                            <i class="iconfont">&#xf0179;</i>加入购物车
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <!-- 显示商品 start-->
    </div>
    <!-- 主内容区 end-->
</asp:Content>
<%--<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>--%>
