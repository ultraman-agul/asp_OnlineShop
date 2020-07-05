<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetailsFlower.aspx.cs" Inherits="FlowerShop.user.DetailsFlower" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>鲜花详情</title>
    <link href="../css/DetailsFlower.css" rel="stylesheet"/>
    <link href="../css/Master.css" rel="stylesheet" />
    <script src="../js/jquery-3.5.1.min.js"></script>
    <script src="../js/Master1.js"></script>
</asp:Content>
<%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content> --%>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div class="D-container">
        <!-- 小导航 start -->
        <div class="D-breadcrumbs">
            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/user/Index.aspx" runat="server"><b>首页</b></asp:HyperLink>
            >
            <asp:LinkButton ID="LinkButton41" runat="server" Text="鲜花"></asp:LinkButton>
            >
            <asp:Label ID="Label1" runat="server" style="color: #ff6a00;" Text="用心爱你"></asp:Label>
        </div>
        <!-- 小导航 end -->
        <!-- 商品 start-->
        <div class="D-product-wrapper">
            <!-- 商品图片 start-->
            <div class="D-product-l">
                <div class="D-pro-preview">
                    <asp:Image ID="Image1" ImageUrl="~/Images/img/20191230090400.jpg" runat="server" />
                </div>
            </div>
            <!-- 商品图片 end-->
            <!-- 商品详情 start-->
            <div class="D-product-r">
                <div class="D-title">
                    <h3 class="D-product-title">
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                    </h3>
                    <p style="margin:6px 0 0;font-size:12px;">
                        已售 
                        <asp:Label ID="Label2" style="color: #FF734C;font-weight:bold;" runat="server" Text="3.3万"></asp:Label>
                        件 
                    </p>
                </div>
                <div class="D-attribute">
                    <dl>
                        <dt>类 别：</dt>
                        <dd>
                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                        </dd>
                    </dl>
                    <dl>
                        <dt>材 料：</dt>
                        <dd>
                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                        </dd>
                    </dl>
                    <dl>
                        <dt>包 装：</dt>
                        <dd>
                            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                        </dd>
                    </dl>
                    <dl>
                        <dt>花 语：</dt>
                        <dd>
                            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                        </dd>
                    </dl>
                </div>
                <div class="D-price-sell">
                    花礼价：
                    <strong>
                        <em class="D-price-sign">￥</em>
                        <em>
                            <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                        </em>
                    </strong>
                </div>
                <div class="D-btn-buy">
                    <asp:LinkButton ID="LinkButton42" CssClass="D-btn-addcart" runat="server" OnClick="LinkButton42_Click">
                        加入购物车
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButton43" CssClass="D-btn-lg" runat="server"  OnClick="LinkButton43_Click" >
                        立即购买
                    </asp:LinkButton>
                </div>
            </div>
            <!-- 商品详情 end-->
        </div>
        <!-- 商品 end-->

        <div class="D-Details">
            <div class="D-panel-heading">
                <h3 class="D-panel-title">商品详情</h3>
            </div>
            <div class="D-contImg">
                <p class="D-contP">
                    <asp:Label ID="Label3" runat="server" Text="1111111111111"></asp:Label></p>
                <p><asp:Image ID="Image2" ImageUrl="~/Images/img/20191230090500.jpg" runat="server" /></p>
            </div>
        </div>

    </div>
</asp:Content>
