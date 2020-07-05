<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FlowerShop.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>鲜花网</title>
    <link href="./css/Master.css" rel="stylesheet" />
    <link href="./css/Index.css" rel="stylesheet" />
    <script src="./js/jquery-3.5.1.min.js"></script>
    <script src="./js/indexCarousel.js"></script>        
    <script src="./js/Master.js"></script>
</asp:Content>

<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    该标签注被释掉后母版定义的导航栏将会显示出来
</asp:Content>--%>
<asp:Content ID="Content3" ContentPlaceHolderId="ContentPlaceHolder2" runat="server">
    <!--动态轮播图区 start-->
    <div class="slideshow">
        <div class="center-left-img">
            <!--图片盒子 start-->
            <div class="imgBox">
                <div class="img-slide " >
                    <asp:HyperLink ID="HyperLink1" runat="server">
                        <div class="fill" style="background-image:url('../Images/1.jpg')"></div>
                    </asp:HyperLink>
                </div>
                <div class="img-slide " >
                    <asp:HyperLink ID="HyperLink2" runat="server">
                        <div class="fill" style="background-image:url('../Images/2.jpg')"></div>
                    </asp:HyperLink>
                </div>
                <div class="img-slide " >
                    <asp:HyperLink ID="HyperLink3" runat="server">
                        <div class="fill" style="background-image:url('../Images/3.jpg')"></div>
                    </asp:HyperLink>
                </div>
                <div class="img-slide " >
                    <asp:HyperLink ID="HyperLink4" runat="server">
                        <div class="fill" style="background-image:url('../Images/4.jpg')"></div>
                    </asp:HyperLink>
                </div>
                <div class="img-slide " >
                    <asp:HyperLink ID="HyperLink5" runat="server">
                        <div class="fill" style="background-image:url('../Images/5.jpg')"></div>
                    </asp:HyperLink>
                </div>
            </div>
            <!--图片盒子 end-->
            <!--浮动圆点 start-->
            <div class="dot">
                <div><i class="iconfont font-dot dot1" onclick="DotClick(0)" onmouseover="DotHover(0)">&#xe63c;</i></div>
                <div><i class="iconfont font-dot dot2" onclick="DotClick(1)" onmouseover="DotHover(1)">&#xe63c;</i></div>
                <div><i class="iconfont font-dot dot3" onclick="DotClick(2)" onmouseover="DotHover(2)">&#xe63c;</i></div>
                <div><i class="iconfont font-dot dot4" onclick="DotClick(3)" onmouseover="DotHover(3)">&#xe63c;</i></div>
                <div><i class="iconfont font-dot dot5" onclick="DotClick(4)" onmouseover="DotHover(4)">&#xe63c;</i></div>
            </div>
            <!--浮动圆点 end-->
            <!--切换箭头 start-->
            <div class="switcher-div">
                <span class="switcher s-left">
                    <i class="iconfont " onclick="SwitcherClick(0)">&#xe628;</i>
                </span>
                <span class="switcher s-right">
                    <i class="iconfont " onclick="SwitcherClick(1)">&#xe628;</i>
                </span>
            </div>
            <!--切换箭头 end-->
            <!--右侧推荐 start-->
            <div class="I-right-recommend">
                <asp:DataList ID="DataList6" CssClass="I-recommend-bd" runat="server" OnItemCommand="DataList6_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton17" CssClass="I-recommend-a" runat="server" CommandArgument='<%# Eval("c_id") %>' CommandName="discribe">
                            <img src="../Images/<%# Eval("c_pic") %>" height="140" width="210">
                            <div class="I-rightbox">
                                <p class="I-rightbox-name">
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("c_name") %>'></asp:Label>
                                </p>
                                <p class="I-rightbox-price">
                                    <asp:Label ID="Label8" runat="server" Text='<%# Convert.ToDouble( Eval("c_price")) %>'></asp:Label>
                                    元
                                </p>
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <!--右侧推荐 end-->
        </div>
    </div>
    <!--动态轮播图区 end-->
    
    <!--主内容区 start-->
    <div class="I-con">
        <!--服务 start-->
        <div class="I-toper-server">
            <ul>
                <li>
                    <asp:HyperLink ID="HyperLink23" runat="server">
                        <i class="iconfont">&#xe610;</i>
                        <h4>鲜花电商龙头</h4>
                        <p>销量领先，权威认证龙头企业</p>
                    </asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="HyperLink24" runat="server">
                        <i class="iconfont">&#xe615;</i>
                        <h4>14年品牌 真实口碑</h4>
                        <p>
                            最近评价
                            <asp:Label ID="Label4" runat="server" Text="348314"></asp:Label>
                            条
                        </p>
                    </asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="HyperLink25" runat="server">
                        <i class="iconfont">&#xe710;</i>
                        <h4>鲜花实拍秀展示</h4>
                        <p>敢展现送前实拍的鲜花网</p>
                    </asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="HyperLink26" runat="server">
                        <i class="iconfont">&#xe787;</i>
                        <h4>3小时送花</h4>
                        <p>全国连锁，3小时送2000城市</p>
                    </asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="HyperLink27" runat="server">
                        <i class="iconfont">&#xe631;</i>
                        <h4>200%退赔承诺</h4>
                        <p>可靠的售后保障</p>
                    </asp:HyperLink>
                </li>
            </ul>
        </div>
        <!--服务 end-->
        <!--限时推荐 start-->
        <div class="I-time-limit">
            <div class="I-title">
                <i class="iconfont">&#xe787;</i>
                限时推荐
            </div>
            <asp:DataList ID="DataList5" CssClass="I-product-list" RepeatColumns="3" runat="server" OnItemCommand="DataList5_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton17" runat="server" CommandArgument='<%# Eval("c_id") %>' CommandName="discribe">
                        <img alt="" src="../Images/img/<%# Eval("c_pic") %>" />
                        <div class="I-recommend">
                            <p class="I-recommend-name">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("c_name") %>'></asp:Label>
                            </p>
                            <p class="I-recommend-price">
                                ￥<asp:Label ID="Label6" runat="server" Text='<%# Convert.ToDouble( Eval("c_price")) %>'></asp:Label>
                            </p>
                            <p class="I-recommend-discount">
                                <i class="iconfont">&#xe63c;</i>
                                直降
                                <asp:Label ID="Label5" runat="server" Text='<%# Convert.ToDouble( Eval("c_price_alt"))* -1 %>'></asp:Label>
                                元
                            </p>
                        </div>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:DataList>
            <div class="I-comic-choose">
                <asp:HyperLink ID="HyperLink28" runat="server">
                    <img src="../Images/10.jpg" />
                </asp:HyperLink>
            </div>
        </div>
        <!--限时推荐 end-->
        <!--爱情专区模板 start-->
        <div class="I-floor ">
            <!--爱情专区标题 start-->
            <div class="I-hd">
                <asp:LinkButton ID="LinkButton1" CssClass="I-more" OnClick="AQ_LinkButton1_Click" runat="server">更多爱情鲜花 >></asp:LinkButton>
                <%--<asp:HyperLink ID="HyperLink18"   runat="server">更多爱情鲜花 >></asp:HyperLink>--%>
                <h3>
                    <asp:LinkButton ID="LinkButton2" OnClick="AQ_LinkButton1_Click" runat="server">爱情鲜花</asp:LinkButton>
                    <span>送·让你怦然心动的人</span>
                </h3>
            </div>
            <!--爱情专区标题 end-->
            <!--爱情专区内容 start-->
            <div class="I-bd">
                <!--爱情专区内容左侧 start-->
                <!--链接跳转到专区-->
                <div class="I-bd-1 I-f1">
                    <div>
                        <asp:LinkButton ID="LinkButton3" OnClick="AQ_LinkButton1_Click" runat="server">
                            <img src="../Images/6.jpg"/>
                        </asp:LinkButton>
                    </div>
                    <asp:LinkButton ID="LinkButton4" CssClass="I-banner-link" OnClick="AQ_LinkButton1_Click" runat="server">爱情鲜花专区 >></asp:LinkButton>
                </div>
                <!--爱情专区内容左侧 end-->
                <!--爱情专区内容右侧 start-->
                <asp:DataList ID="DataList1" CssClass="I-floor-products" RepeatColumns="4" runat="server" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <!-- 超链接用于跳转鲜花详情 -->
                        <asp:LinkButton ID="LinkButton17" CssClass="I-floor-products-link" runat="server" CommandArgument='<%# Eval("c_id") %>' CommandName="discribe"> <!-- 使用Eval单向绑定 -->
                            <span class="I-img-box">
                                <img alt="" src="../Images/img/<%# Eval("c_pic") %>" />
                            </span>
                            <asp:Label ID="Label9" CssClass="I-product-title" runat="server" Text='<%#"爱情 · " + Eval("c_name") %>'></asp:Label>
                            <p class="I-price">
                                <span class="I-price-sign">￥</span>
                                <asp:Label ID="Label10" CssClass="I-price-num" runat="server" Text='<%# Convert.ToDouble( Eval("c_price")) %>'></asp:Label>
                            </p>
                            <p style="font-size:12px">已售 <asp:Label ID="Label11" runat="server" Text='<%# Eval("c_sale") %>' ></asp:Label> 件</p>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
                <!--爱情专区内容右侧 end-->
            </div>
            <!--爱情专区内容 end-->
        </div>
        <!--爱情专区模板 end-->
        <!--送长辈专区模板 start-->
        <div class="I-floor ">
            <!--送长辈专区标题 start-->
            <div class="I-hd">
                <asp:LinkButton ID="LinkButton5" CssClass="I-more" OnClick="QT_LinkButton1_Click" runat="server">更多送长辈鲜花 >></asp:LinkButton>
                <h3>
                    <asp:LinkButton ID="LinkButton6" OnClick="QT_LinkButton1_Click" runat="server">送长辈鲜花</asp:LinkButton>
                    <span>赠·父母/恩师/长辈</span>
                </h3>
            </div>
            <!--送长辈专区标题 end-->
            <!--送长辈专区内容 start-->
            <div class="I-bd">
                <!--送长辈专区内容左侧 start-->
                <div class="I-bd-1 I-f2">
                    <div>
                        <asp:LinkButton ID="LinkButton7" OnClick="QT_LinkButton1_Click" runat="server">
                            <img src="../Images/7.jpg"/>
                        </asp:LinkButton>
                    </div>
                    <asp:LinkButton ID="LinkButton8" CssClass="I-banner-link" OnClick="QT_LinkButton1_Click" runat="server">送长辈鲜花专区 >></asp:LinkButton>
                </div>
                <!--送长辈专区内容左侧 end-->
                <!--送长辈专区内容右侧 start-->
                <asp:DataList ID="DataList2" CssClass="I-floor-products" RepeatColumns="4" runat="server" OnItemCommand="DataList2_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton17" CssClass="I-floor-products-link" runat="server" CommandArgument='<%# Eval("c_id") %>' CommandName="discribe">
                            <span class="I-img-box">
                                <img alt="" src="../Images/img/<%# Eval("c_pic") %>" />
                            </span>
                            <asp:Label ID="Label9" CssClass="I-product-title" runat="server" Text='<%#"送长辈 · " + Eval("c_name") %>'></asp:Label>
                            <p class="I-price">
                                <span class="I-price-sign">￥</span>
                                <asp:Label ID="Label10" CssClass="I-price-num" runat="server" Text='<%# Convert.ToDouble( Eval("c_price")) %>'></asp:Label>
                            </p>
                            <p style="font-size:12px">已售 <asp:Label ID="Label11" runat="server" Text='<%# Eval("c_sale") %>' ></asp:Label> 件</p>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
                <!--送长辈专区内容右侧 end-->
            </div>
            <!--送长辈专区内容 end-->
        </div>
        <!--送长辈专区模板 end-->

        <!--永生花专区模板 start-->
        <div class="I-floor ">
            <!--永生花专区标题 start-->
            <div class="I-hd">
                <asp:LinkButton ID="LinkButton9" CssClass="I-more" OnClick="YS_LinkButton1_Click" runat="server">更多永生花 >></asp:LinkButton>
                <h3>
                    <asp:LinkButton ID="LinkButton10" OnClick="YS_LinkButton1_Click" runat="server">永生花</asp:LinkButton>
                    <span>许·她一生承诺</span>
                </h3>
            </div>
            <!--永生花专区标题 end-->
            <!--永生花专区内容 start-->
            <div class="I-bd">
                <!--永生花专区内容左侧 start-->
                <div class="I-bd-1 I-f3">
                    <div>
                        <asp:LinkButton ID="LinkButton12" OnClick="YS_LinkButton1_Click" runat="server">
                            <img src="../Images/8.jpg"/>
                        </asp:LinkButton>
                    </div>
                    <asp:LinkButton ID="LinkButton11" CssClass="I-banner-link" OnClick="YS_LinkButton1_Click" runat="server">永生花专区 >></asp:LinkButton>
                </div>
                <!--永生花专区内容左侧 end-->
                <!--永生花专区内容右侧 start-->
                <asp:DataList ID="DataList3" CssClass="I-floor-products" RepeatColumns="4" runat="server" OnItemCommand="DataList3_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton17" CssClass="I-floor-products-link" runat="server" CommandArgument='<%# Eval("c_id") %>' CommandName="discribe">
                            <span class="I-img-box">
                                <img alt="" src="../Images/img/<%# Eval("c_pic") %>" />
                            </span>
                            <asp:Label ID="Label9" CssClass="I-product-title" runat="server" Text='<%#"永生花 · " + Eval("c_name") %>'></asp:Label>
                            <p class="I-price">
                                <span class="I-price-sign">￥</span>
                                <asp:Label ID="Label10" CssClass="I-price-num" runat="server" Text='<%# Convert.ToDouble( Eval("c_price")) %>'></asp:Label>
                            </p>
                            <p style="font-size:12px">已售 <asp:Label ID="Label11" runat="server" Text='<%# Eval("c_sale") %>' ></asp:Label> 件</p>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
                <!--永生花专区内容右侧 end-->
            </div>
            <!--永生花专区内容 end-->
        </div>
        <!--永生花专区模板 end-->

        <!--礼品专区模板 start-->
        <div class="I-floor ">
            <!--礼品专区标题 start-->
            <div class="I-hd">
                <asp:LinkButton ID="LinkButton13" CssClass="I-more" OnClick="LP_LinkButton1_Click" runat="server">更多礼品 >></asp:LinkButton>
                <h3>
                    <asp:LinkButton ID="LinkButton14"  OnClick="LP_LinkButton1_Click" runat="server">礼品</asp:LinkButton>
                    <span>给她·最美好的礼物</span>
                </h3>
            </div>
            <!--礼品专区标题 end-->
            <!--礼品专区内容 start-->
            <div class="I-bd">
                <!--礼品专区内容左侧 start-->
                <div class="I-bd-1 I-f4">
                    <div>
                        <asp:LinkButton ID="LinkButton16" OnClick="LP_LinkButton1_Click" runat="server">
                            <img src="../Images/9.jpg"/>
                        </asp:LinkButton>
                    </div>
                    <asp:LinkButton ID="LinkButton15" CssClass="I-banner-link" OnClick="LP_LinkButton1_Click" runat="server">礼品专区 >></asp:LinkButton>
                </div>
                <!--礼品专区内容左侧 end-->
                <!--礼品专区内容右侧 start-->
                <asp:DataList ID="DataList4" CssClass="I-floor-products" RepeatColumns="4" runat="server" OnItemCommand="DataList4_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton17" CssClass="I-floor-products-link" runat="server" CommandArgument='<%# Eval("c_id") %>' CommandName="discribe">
                            <span class="I-img-box">
                                <img alt="" src="../Images/img/<%# Eval("c_pic") %>" />
                            </span>
                            <asp:Label ID="Label9" CssClass="I-product-title" runat="server" Text='<%#"礼品 · " + Eval("c_name") %>'></asp:Label>
                            <p class="I-price">
                                <span class="I-price-sign">￥</span>
                                <asp:Label ID="Label10" CssClass="I-price-num" runat="server" Text='<%# Convert.ToDouble( Eval("c_price")) %>'></asp:Label>
                            </p>
                            <p style="font-size:12px">已售 <asp:Label ID="Label11" runat="server" Text='<%# Eval("c_sale") %>' ></asp:Label> 件</p>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
                <!--礼品专区内容右侧 end-->
            </div>
            <!--礼品专区内容 end-->
        </div>
        <!--礼品专区模板 end-->
        <!--用户评价 start-->
        <!--静态。。-->
        <div class="I-comments">
            <div class="I-comments-hd">
                <a href="Index.aspx">更多></a>
                <h4>用户评价</h4>
            </div>
            <div class="I-comments-bd">
                <ul class="I-comments-list">
                    <li class="I-comments-item">
                        <div class="I-comments-item-hd">刘备</div>
                        <div class="I-comments-item-bd">娘子可喜欢啦！</div>
                    </li>
                    <li class="I-comments-item">
                        <div class="I-comments-item-hd">吕布</div>
                        <div class="I-comments-item-bd">与我貂蝉很搭，以后常买</div>
                    </li>
                    <li class="I-comments-item">
                        <div class="I-comments-item-hd">项羽</div>
                        <div class="I-comments-item-bd">她好我也好~~</div>
                    </li>
                    <li class="I-comments-item">
                        <div class="I-comments-item-hd">俄洛依</div>
                        <div class="I-comments-item-bd">生活需要仪式感！</div>
                    </li>
                    <li class="I-comments-item">
                        <div class="I-comments-item-hd">拉克丝</div>
                        <div class="I-comments-item-bd">好看</div>
                    </li>
                    <li class="I-comments-item">
                        <div class="I-comments-item-hd">伊泽瑞尔</div>
                        <div class="I-comments-item-bd">在？抽个鲜花？</div>
                    </li>
                </ul>
            </div>
        </div>
        <!--用户评价 end-->
    </div>
</asp:Content>
<%--<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>--%>
