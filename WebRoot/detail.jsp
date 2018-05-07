<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<!--主体内容第一部分开始-->
<div class="jindck">
<div class="jindck-meun">名称：<s:property value="goods.name" /><img src="images/fk.jpg" width="40" height="40" /></div>
<div class="jin2">
<div class="jin2-left">
<ul>
<li>
<a href="" title="">
<img src="upload/<s:property value="goods.img" />" width="400" height="250" />
</a>
</li>
<li class="pics"><a href="upload/<s:property value="goods.img" />" class="zoom" title="<s:property value="goods.img" />" ><img src="upload/<s:property value="goods.img" />" width="100" height="63" /></a></li>

</div>
<div class="jin2-right">
<ul>
<li>价格：<span class="colorc"><s:property value="goods.pricle" /></span></li>

<li>促销：<s:property value="goods.object" /></li>
<li>推荐：<s:property value="goods.day" /></li>
<li>所属类型：<s:property value="goods.ftype.ftype" /></li>
<li><a href="addkeep.action?keep.uid=<s:property value="#session.user.uid" />&keep.goods.id=<s:property value="goods.id" />" >收藏</a></li>
<li>说明：<s:property value="goods.miaoshu" /></li>

<li><a href="liuyan?id=<s:property value="goods.id" />" style="font-size:20px;">留言</a></li>
<li><a href="addshop?shop.goods.id=<s:property value="goods.id" />"><img src="images/jgwc.jpg" width="122" height="42" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="shopjs?shop.goods.id=<s:property value="goods.id" />"><img src="images/js.jpg" width="123" height="43" /></a></li>
</ul>
</div>
</div>
<div class="tuijian">
<div class="tuijian-m">商品详情</div>
<div class="tuijian-inf">
<ul>
<li><s:property value="goods.miaoshu" /></li>
</ul>
</div>
<div class="tuijian">
<div class="tuijian-m">用户评论</div>
<div class="tuijian-inf">
<ul>

<s:iterator value="olist">
<s:if test="pj!=null">
<li><s:property value="userinfo.uname" /></li>
<li><s:property value="pj" /></li>
</s:if>
</s:iterator>

</ul>
</div>


</div>
</div>
<!--主体内容第一部分结束-->
<!--底部-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
