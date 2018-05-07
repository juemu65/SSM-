<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/nf.lightbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/NFLightBox.js"></script>
<script type="text/javascript" src="js/shop.js"></script>
<style type="text/css">
.mask { /*遮罩层*/
    background-color:gray;
    left:0;
    position:absolute;
    top:0;
    z-index:100;
    filter:alpha(opacity=30);
   opacity:0.3;
}

div.dialog {
	width: 296px;
	height:173px;
	position: absolute;
	z-index: 101;
	display: none;
    background-image:url(images/dialog.png)
}

div.title {
	padding-top: 5px;
	padding-left:270px;
}
div.dialog div.content {

	height: 90px;
	text-align:center;

	font:bold 15px/90px Verdana, Geneva, sans-serif;
}

div.dialog div.bottom {
	text-align: right;
	padding: 10px 10px 10px 0px;
	border-top:1px dashed #999999;

}
div.bottom .btn1 {
	border:none;
	width: 63px;
	height: 29px;
	cursor:pointer;
	
}
div.bottom #btnSure{
	background-image:url(images/delSure.jpg);
}
div.bottom #btnCancel{
	background-image:url(images/delCancel.jpg);
}
</style>
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>


<div id="shop">
  <div id="shop-t">
    <div id="shop-l"><img src="images/sh.jpg" width="74" height="67" /></div>
    <div id="shop-r">我的购物车</div>
  </div>
  <div id="shop-inf">
    <ul>
      <li class="lx">名称</li>
      <li class="xh">数量</li>
      <li class="rs">单价</li>
     <!--  <li class="dj"><a href="#">下单</a></li> -->
      <li class="cz">操作</li>
    </ul>
  </div>
  <form action="addorder?id=<s:property value="f.id" />" method="post">
  <div id="shop-xx">
   <%-- <s:iterator value="page.pageList"> --%>
   
    <ul id="shop1">
      <li class="xh"></li>
      <li class="lx">
        <div id="luxian">
        
          <ul>
            <li><a href="images/pic1.jpg" title="<s:property value="f.name" />"><img src="upload/<s:property value="f.img" />" width="87" height="58"  /></a></li>
            <li><a href="#"><s:property value="f.name" /></a></li>
          </ul>
        </div>
      </li>
      <li class="rs"><input type="text" name="order.amount"  value="1" maxlength="2"/></li>
      <li class="rs">￥<s:property value="f.pricle" />
      <input name="order.goods.id" type="text" value="<s:property value="f.id" />"  /></li>
     
      <li class="cz"><a href="delete?id=<s:property value="f.id" />" class="btnDel" ><span style="color:#F60; text-decoration:underline;">删除</span></a></li>
    </ul>
    
   
</div>
<!-- <div id="fanye"><a href="#">首页</a> <a href="#">上一页</a> <a href="#">下一页</a> <a href="#">尾页</a></div> -->
<div id="jine">应付金额：<s:property value="f.pricle" /><span style="color:#F00;"></span>元</div>
<div id="js">

  <input name="order.userinfo.uid" type="text"  value="<s:property value="#session.user.uid" />"  />
  <input name="button" type="image" id="button" value="提交" src="images/js.jpg" />
</div>
</form>
</div>

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
<div class="mask"></div>


<div class="dialog">
  <div class="title">
    <img src="images/del.png" id="closePic" title="关闭"/> </div>
  <div class="content"> <p>您真的要删除这条记录吗？</p></div>
  <div class="bottom">
    <input type="button" value="" class="btn1"  id="btnSure"/>
    <input type="button" value="" class="btn1" id="btnCancel" />
  </div>
</div>
</body>
</html>
