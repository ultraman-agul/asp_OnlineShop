<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserShow.aspx.cs" Inherits="FlowerShop.admin.UserShow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/Master.css" rel="stylesheet" />
    <link href="../css/UserShow.css" rel="stylesheet" />
    <title>用户详情</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- 导航栏 start -->
    <div class="A-navigation ">
        <div class="A-nav">
            <div>
                <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#FF6A00">信息中心</asp:HyperLink>
            </div>
            <div>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="AddProducts.aspx">新品上架</asp:HyperLink>
            </div>
            <div>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="ProductsManage.aspx" >商品管理</asp:HyperLink>
            </div>
            <div>
                <asp:HyperLink runat="server"  NavigateUrl="reply.aspx"> 
                留言管理
                </asp:HyperLink>   
            </div>
        </div>
    </div>
 <!-- 导航栏 end -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="A-content">
    <!-- 左侧内容区 start -->
        <div class="A-con-left">
            <div class="A-con-left-tite"><i class="iconfont">&#xe61f;</i>&nbsp;信息中心</div>
            <div class="A-con-left-item">
                <span>
                    <asp:HyperLink ID="HyperLink5" NavigateUrl="AdminShow.aspx" runat="server">
                        <i class="iconfont">&#xe60e;</i> 管理员信息
                    </asp:HyperLink>
                </span>
                <br/>
                <p>
                    <asp:HyperLink ID="HyperLink12" runat="server"  NavigateUrl="AdminShow.aspx">&nbsp;&nbsp;&nbsp;&nbsp;管理员管理</asp:HyperLink>
                </p>
            </div>
            <div class="A-con-left-item">
                <span>
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="./UserShow.aspx">
                        <i class="iconfont">&#xe63c;</i> 会员信息
                    </asp:HyperLink>
                </span>
                <br/>
                <p>
                    <asp:HyperLink ID="HyperLink8" runat="server" ForeColor="#FF6A00" NavigateUrl="UserShow.aspx">&nbsp;&nbsp;&nbsp;&nbsp;会员管理</asp:HyperLink>
                </p>
            </div>
            <div class="A-con-left-item">
                <span>
                    <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="reply.aspx">
                        <i class="iconfont">&#xe61a;</i> 留言管理
                    </asp:HyperLink>
                </span>
                <p>
                    <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="reply.aspx">&nbsp;&nbsp;&nbsp;&nbsp;游客留言</asp:HyperLink>
                </p>
                <p>
                    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="Leave.aspx" >&nbsp;&nbsp;管理员回复</asp:HyperLink>
                </p>
            </div>
        </div>
        <!-- 左侧内容区 end -->
        <!--  内容--主体 strart-->
     <div id="content_mid">       
               <h3>会员信息:</h3>
        <br/>
        <div id="mid_content_GV" class="auto-style1">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Flower_ShopConnectionString %>" SelectCommand="SELECT * FROM [User_Table]">
                </asp:SqlDataSource>

            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="u_id" ForeColor="#333333"  Height="173px" Width="535px" CssClass="mgrid">
                <Columns>
                    <asp:BoundField DataField="u_id" HeaderText="用户ID" InsertVisible="False" ReadOnly="True" SortExpression="u_id" />
                    <asp:BoundField DataField="u_name" HeaderText="用户名" SortExpression="u_name" />
                    <asp:BoundField DataField="u_password" HeaderText="密码" SortExpression="u_password" />
                    <asp:BoundField DataField="u_iphone" HeaderText="手机号码" SortExpression="u_iphone" />
                    <asp:BoundField DataField="u_mail" HeaderText="邮箱地址" SortExpression="u_mail" />
                    <asp:BoundField DataField="u_card" HeaderText="身份证" SortExpression="u_card" />
                </Columns>                   
                </asp:GridView>
         </div>
    </div>
    <!--  内容--主体 end-->
</div>
</asp:Content>
<%--<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>--%>
