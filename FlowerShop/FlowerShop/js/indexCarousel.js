//轮播图

var imgIndex = 0;
var iDot = document.getElementsByClassName("font-dot");//获取所有圆点的节点
var img = document.getElementsByClassName("img-slide");//获取所有轮播图片的节点
var swi = document.getElementsByClassName("switcher");//获取所有切换箭头的节点
//改变图片
function ChangeImg(index) {
	if (index >= img.length)
		index = imgIndex = 0;
	imgIndex = index;
	$(img[imgIndex]).addClass("slide-img-active").siblings().addClass("slide-img-out").removeClass("slide-img-active");
	//圆点样式
	for (let i = 0; i < iDot.length; i++) {
		iDot[i].style.color = 'rgba(0, 0, 0, 0.175)';
	}
	iDot[index].style.color = '#FF6600';
}
//计数器
function Count() {
	imgIndex++;
	ChangeImg(imgIndex);
}
//设置定时器，每隔5秒切换一张图片
setInterval(Count, 5000);

//浮动圆点单击事件
function DotClick(dotIndex) {
	ChangeImg(dotIndex);
}

//浮动圆点鼠标悬停/离开事件,防止css的:hover失效
function DotHover(index) {
	iDot[index].onmouseover = function () {
		//悬停
		iDot[index].style.color = '#FF6600';
	};
	iDot[index].onmouseout = function () {
		//离开
		if (index != imgIndex)
			iDot[index].style.color = 'rgba(0, 0, 0, 0.175)';
	};
}
//切换箭头点击事件
function SwitcherClick(num) {
	if (num == 0) { //向左滑动
		imgIndex--;
		if (imgIndex < 0) imgIndex = 4;
	} else { //向右滑动
		imgIndex++;
		if (imgIndex > 4) imgIndex = 0;
	}
	ChangeImg(imgIndex);
}
// 三张图
 function FFSwitcherClick(num) {
	if (num == 0) { //向左滑动
		imgIndex--;
		if (imgIndex < 0) imgIndex = 2;
	} else { //向右滑动
		imgIndex++;
		if (imgIndex > 2) imgIndex = 0;
	}
	ChangeImg(imgIndex);
 }