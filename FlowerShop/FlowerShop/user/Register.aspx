<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FlowerShop.user.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="../css/Register.css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <div  class="Main" style="height: 630px"  >       
        <div class="Main-Registanst" style="left: 0px; top: 0px">
            <div class="Reistanst-tabs1">         
                <asp:Label ID="Label1" runat="server" Text="用户注册" Font-Names="黑体"></asp:Label>           
            </div>       
               <div class="Login-user">
                <%--账号--%>
                   <div class="Reistanst-yh">
                       <p class="Reistanst-shuru">
                           <asp:Label ID="Label2" runat="server" CssClass="lbtext" Text="用户名&nbsp;&nbsp;|"></asp:Label>
                           <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Font-Size="Medium" ForeColor="Black" Height="30px"  style="left: 51px; margin-top: 5px;" Width="65%"></asp:TextBox>  
                                <asp:RequiredFieldValidator ID="RF1" runat="server" ControlToValidate="TextBox1" Text="⊗"  ErrorMessage="RequiredFieldValidator" CssClass="Login-validator" SetFocusOnError="True" >
                           </asp:RequiredFieldValidator>
                       </p>
                       </div>
                   <%--电话--%>
                     <div class="Reistanst-yh">
                       <p class="Login-shuru">
                           <asp:Label ID="Label5" runat="server" CssClass="lbtext" Text="电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话|"></asp:Label>
                           <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" Font-Size="Medium" ForeColor="Black" Height="30px"  style="left: 51px; margin-top: 5px;" Width="65%"></asp:TextBox> 
                           <asp:RegularExpressionValidator ID="RV1" runat="server" Text="⊗" 
                            CssClass="Login-validator"  ControlToValidate="TextBox2"  ErrorMessage="RegularExpressionValidator" ValidationExpression="^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$"></asp:RegularExpressionValidator>
                       </p>
                       </div>
                <%--   密码--%>
                   <div class="Reistanst-yh">
                       <p class="auto-style1">
                           <asp:Label ID="Label3" runat="server" CssClass="lbtext" Text="密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码|"></asp:Label>
                           <asp:TextBox ID="TextBox3" runat="server" BorderStyle="None" Font-Size="Medium" TextMode="Password" ForeColor="Black" Height="30px"  style="left: 51px; margin-top: 5px;" Width="65%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RF2" runat="server" ControlToValidate="TextBox3" Text="⊗"  ErrorMessage="RequiredFieldValidator" CssClass="auto-style2" SetFocusOnError="True" >
                           </asp:RequiredFieldValidator>
                       </p>                    
                   </div>
                <%-- 确认密码--%>
                     <div class="Reistanst-yh">
                       <p class="Login-shuru">
                           <asp:Label ID="Label4" runat="server" CssClass="lbtext" Text="确认密码|"></asp:Label>
                           <asp:TextBox ID="TextBox4" runat="server" BorderStyle="None" Font-Size="Medium" TextMode="Password" ForeColor="Black" Height="30px"  style="left: 51px; margin-top: 5px;" Width="65%"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RFV3" ControlToValidate="TextBox4" Text="⊗" CssClass="Login-validator"  runat="server" SetFocusOnError="True"/>
               <asp:CompareValidator ID="CV1" ControlToValidate="TextBox4" Text="⊗" CssClass="Login-validator" Type="String" Operator="Equal" ControlToCompare="TextBox3" runat="server" SetFocusOnError="True" />
                       </p>                   
                   </div>
                     <%--    邮箱--%>
                     <div class="Reistanst-yh">
                       <p class="Reistanst-shuru">
                           <asp:Label ID="Label6" runat="server" CssClass="lbtext" Text="邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱|"></asp:Label>
                           <asp:TextBox ID="TextBox5" runat="server" BorderStyle="None" Font-Size="Medium" ForeColor="Black" Height="30px"  style="left: 51px; margin-top: 5px;" Width="65%"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RV2" runat="server" Text="⊗" 
                            CssClass="Login-validator"  ControlToValidate="TextBox5"  ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                       </p>
                       </div>
            <%--提交按钮--%>
             <p>
                 <asp:Button ID="Button1" runat="server" CssClass="loginBut2" Text="注册" OnClick="Button1_Click" BorderStyle="None" />
                       </p>
            <%-- 底下--%>
             <div class="Reistanst-bottom">
                       <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" >已有账号，去登录></asp:HyperLink>
                   </div>
               </div>                
        </div>
    </div>
</asp:Content>
<%--<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>--%>
