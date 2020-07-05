<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminShow.aspx.cs" Inherits="FlowerShop.admin.AdminShow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/master.css" rel="stylesheet" />
    <link href="../css/UserShow.css" rel="stylesheet"/>
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
     <div id="A-con-right">
         <p>管理员信息:</p>
        <div id="mid_content_GV">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:Flower_ShopConnectionString %>"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Admin_Table]" DeleteCommand="DELETE FROM [Admin_Table] WHERE [A_id] = @original_A_id" InsertCommand="INSERT INTO [Admin_Table] ([A_id], [A_password]) VALUES (@A_id, @A_password)" UpdateCommand="UPDATE [Admin_Table] SET [A_password] = @A_password WHERE [A_id] = @original_A_id">
                <DeleteParameters>
                    <asp:Parameter Name="original_A_id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="A_id" Type="String" />
                    <asp:Parameter Name="A_password" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="A_password" Type="String" />
                    <asp:Parameter Name="original_A_id" Type="String" />
                </UpdateParameters>
                </asp:SqlDataSource>

                 <asp:GridView ID="GridView1" runat="server"  AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="A_id" ForeColor="#333333" GridLines="None" Height="173px" Width="321px" CssClass="mgrid" DataSourceID="SqlDataSource1" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:BoundField DataField="A_id" HeaderText="账号" ReadOnly="True" SortExpression="A_id" />
                         <asp:BoundField DataField="A_password" HeaderText="密码" SortExpression="A_password" />
                         <asp:CommandField ShowEditButton="True" />
                     </Columns>
                </asp:GridView>
         </div>
    </div>
    <!--  内容--主体 end-->
</div>
</asp:Content>
<%--<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>--%>
