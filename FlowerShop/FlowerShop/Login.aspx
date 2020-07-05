<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FlowerShop.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户登录</title>
    <link href="./css/Master.css" rel="stylesheet" />
    <link href="./css/Login.css" rel="stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <div class="Main">
        <div class="Main-Login">
            <div class="Login-tabs">
                <asp:Label ID="Label1" runat="server" Text="账号密码登录" Font-Names="黑体"></asp:Label>
            </div>
            <div class="Login-user">
                <%--  账号--%>
                <div class="Login-yh">
                    <p class="Login-shuru">
                        <asp:Label ID="Label2" runat="server" ForeColor="Black" Style="margin-left: 5px;" Text="账号:"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Font-Size="Medium" ForeColor="Black" Height="30px" Style="left: 51px; margin-top: 5px;" Width="65%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="cencle1" runat="server" ControlToValidate="TextBox1" Text="⊗" ErrorMessage="RequiredFieldValidator" CssClass="Login-validator" SetFocusOnError="True">
                           </asp:RequiredFieldValidator>
                    </p>
                </div>
                <br />
                <%--   密码--%>
                <div class="Login-yh1">
                    <p class="Login-shuru">
                        <asp:Label ID="Label3" runat="server" ForeColor="Black" Style="margin-left: 5px;" Text="密码:"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" Font-Size="Medium" TextMode="Password" ForeColor="Black" Height="30px" Style="left: 51px; margin-top: 5px;" Width="65%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="cencle2" ControlToValidate="TextBox2" Text="⊗" CssClass="Login-validator" runat="server" SetFocusOnError="True" />
                    </p>
                </div>
                <%--   忘记密码--%>
                <div class="lost_pw">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               
                    <asp:RadioButton ID="RadioButton1" GroupName="login" runat="server" Text="用户" Checked="True" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               
                    <asp:RadioButton ID="RadioButton2" GroupName="login" runat="server" Text="管理员" />
                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="style1" NavigateUrl="#">忘记密码</asp:HyperLink>
                </div>
                <%--  提交按钮--%>
                <p class="loginBut">
                    <asp:Button ID="Button1" runat="server" CssClass="loginBut1" Text="登录" BorderStyle="None" OnClick="Button1_Click" />
                </p>
                <div class="bottom">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/user/Registanst.aspx">一键快捷注册>></asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
