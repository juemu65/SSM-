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
      <li class="xh">名称</li>
      <li class="rs">数量</li>
      <li class="rs">单价</li>
     <li class="dj"><a href="#">下单</a></li>
      <li class="cz">操作</li>
    </ul>
  </div>
   <s:iterator value="page.pageList"> 
  <form action="addorder?id=<s:property value="sid" />" method="post">
  
  <div id="shop-xx">
    <ul id="shop1">
      <li class="xh">
        <div id="luxian">
        
          <ul>
            <li><a href="./upload/<s:property value="goods.img" />" title="<s:property value="goods.name" />"><img src="./upload/<s:property value="goods.img" />" width="87" height="58"  /></a></li>
            <li><a href="#"><s:property value="goods.name" /></a></li>
          </ul>
        </div>
      </li>
      <li class="rs"><input type="text" name="shop.num"  value="<s:property value="num"/>" size="2"/></li>
      <li class="rs">￥<s:property value="goods.pricle" /><input name="order.userinfo.uid" type="hidden"  value="<s:property value="#session.user.uid" />"  />
      <%-- <input name="shop.sid" type="text" value="<s:property value="sid"/>"  /> --%>
      </li>
      <li class="rs" style="width:110px;"><%-- <if test="<s:property value="" />"></if> --%><input  type="submit"  value="下单"  /></li>
      <li class="cz"><a href="deleteshop?shop.sid=<s:property value="sid" />" class="btnDel" ><span style="color:#F60; text-decoration:underline;">删除</span></a></li>
    </ul>
    
   
</div>
</form>
</s:iterator>
                            <div id="fanye" >  <div id="fanye" >当前显示第
			<s:property value="page.pageIndex" />
			页 
			共
			<s:property value="page.totalpages" />
			页
			</div> 
			<div id="fanye" align="center">
				<a href="shoplist.action?page.pageIndex=1"> 首页</a>
				<s:property value="totalpages" />
				<a <s:if test="page.pageIndex<=1"> href="javascript:false;"</s:if>
					<s:else>href="shoplist.action?page.pageIndex=<s:property value='page.pageIndex-1' />"</s:else>>上一页</a>
				<a
					<s:if test="page.pageIndex>=page.totalpages" > href="javascript:false;"</s:if>
					<s:else>href="shoplist.action?page.pageIndex=<s:property value='page.pageIndex+1' />"</s:else>>下一页</a>
				<a
					href="shoplist.action?page.pageIndex=<s:property value="page.totalpages" />">末页</a>


			</div></div>

<%-- <div id="jine">应付金额：<s:property value="total" /><span style="color:#F00;"></span>元</div> --%>
<div id="js">

  
  <!-- <input name="button" type="image" id="button" value="提交" src="images/js.jpg" /> -->
</div>

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
