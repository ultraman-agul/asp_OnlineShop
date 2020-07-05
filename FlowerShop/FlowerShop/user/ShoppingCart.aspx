<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="FlowerShop.user.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>我的购物车</title>
    <link href="../css/Master.css" rel="stylesheet" />
    <link href="../css/ShoppingCart.css" rel="stylesheet" />
    <script src="../js/jquery-3.5.1.min.js"></script>
    <script src="../js/Master1.js"></script>
</asp:Content>
<%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content> --%>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <div class="S-MainCont">
                <div class="S-Cart">
                    <div class="S-title">
                        <span class="S-title-1">商品名称</span>
                        <span class="S-title-2">订购价</span>
                        <span class="S-title-3">数量</span>
                        <span class="S-title-4">操作</span>
                    </div>
                    <div class="MO-hint">
                        <div>
                            <i class="iconfont">&#xe610;</i>
                        </div>
                    </div>
                    <asp:DataList ID="DataList1" CssClass="MO-DataList2" runat="server" OnCancelCommand="DataList1_CancelCommand" OnEditCommand="DataList1_EditCommand" OnUpdateCommand="DataList1_UpdateCommand" OnDeleteCommand="DataList1_DeleteCommand">
                        <ItemTemplate>
                            <div class="S-order-list">
                                <div class="S-selecter">
                                    <asp:CheckBox ID="s_buy" runat="server"  Checked='<%#Eval("s_buy")%> ' AutoPostBack="True" OnCheckedChanged="S_buy_CheckedChanged" />
                                </div>
                                <div class="S-img-box">
                                    <img src="../Images/img/<%# Eval("s_pic") %>" />
                                </div>
                                <div class="S-product">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("s_c_name") %>'></asp:Label>
                                </div>
                                <div class="S-order-price">
                                    <span class="S-price-sign ">￥</span>
                                    <asp:Label ID="Label3" CssClass="S-price-num " runat="server" Text='<%# Convert.ToDouble( Eval("s_price")) %>'></asp:Label>
                                </div>
                                <div class="S-num">
                                    <asp:Label runat="server" CssClass="S-form-control"  Text='<%# Eval("s_num") %>'></asp:Label>
                                </div>
                                <div class="S-operate">
                                    <asp:LinkButton ID="lk1" runat="server" style="margin-right: 10px;margin-left:10px; " CommandArgument='<%# Eval("s_c_id") %>'  CommandName="edit">编辑</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server"  CommandArgument='<%# Eval("s_c_id") %>'  CommandName="delete" OnClientClick="javascript:return confirm('是否删除？')">删除</asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <div class="S-order-list">
                                <div class="S-selecter">
                                    <asp:CheckBox ID="s_buy" runat="server"  Checked='<%#Eval("s_buy")%> ' AutoPostBack="True" OnCheckedChanged="S_buy_CheckedChanged" />
                                </div>
                                <div class="S-img-box">
                                    <img src="../Images/img/<%# Eval("s_pic") %>" />
                                </div>
                                <div class="S-product">
                                    <asp:Label ID="Label4" runat="server" Text='<%# "[" + Eval("c_kind") + "] · " %>'></asp:Label>
                                    <asp:Label ID="Label5" runat="server" Text='<%# "[" + Eval("c_series") + "] · " %>'></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("s_c_name") %>'></asp:Label>
                                </div>
                                <div class="S-order-price">
                                    <span class="S-price-sign ">￥</span>
                                    <asp:Label ID="Label3" CssClass="S-price-num " runat="server" Text='<%# Convert.ToDouble( Eval("s_price")) %>'></asp:Label>
                                </div>
                                <div class="S-num">
                                    <asp:TextBox  ID="txt_num" CssClass="S-form-control"  runat="server" Text='<%# Eval("s_num") %>'></asp:TextBox>
                                </div>
                                <div class="S-operate">
                                    <asp:LinkButton ID="LinkButton3" runat="server" style="margin-right: 10px; margin-left:10px;"   CommandArgument='<%# Eval("s_c_id") %>' CommandName="update">更新</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton4" runat="server"  CommandArgument='<%# Eval("s_c_id") %>' CommandName="cancel">取消</asp:LinkButton>
                                </div>
                            </div>
                        </EditItemTemplate>
                    </asp:DataList>
                </div>

                <div class="S-contbottom">
                    <div class="S-set-info">
                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Index.aspx" CssClass="S-back" runat="server">
                <i></i>
                继续挑选
                        </asp:HyperLink>
                        <div class="S-set-stat">
                            应付金额:
                <div class="S-price">
                    <span class="S-price-sign">￥</span>
                    <asp:Label ID="Label1" CssClass="S-price-num" runat="server" Text="Label"></asp:Label>
                </div>
                        </div>
                    </div>
                    <asp:HyperLink ID="HyperLink2" CssClass="S-btn" NavigateUrl="~/user/Orders.aspx" runat="server">去结算</asp:HyperLink>
                    <%--<asp:Button ID="Button1" CssClass="S-btn"  runat="server" Text="去结算" BorderStyle="None" />--%>
                </div>
    </div>
</asp:Content>
<%--<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>--%> 
