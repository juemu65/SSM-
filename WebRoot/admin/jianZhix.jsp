<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<!--主体内容第一部分开始-->
<div class="jindck">
<div class="jindck-meun">岗位名称：${jz.name }<img src="images/fk.jpg" width="40" height="40" /></div>
<div class="jin2">
<div class="jin2-left">
<ul>
<li>
<a href="" title="">
<img src="upload/${jz.img }" width="400" height="250" />
</a>
</li>
<li class="pics"><a href="upload/${jz.img }" class="zoom" title="${jz.img }" ><img src="upload/${jz.img }" width="100" height="63" /></a></li>

</div>
<div class="jin2-right">
<ul>
<li>工资待遇：<span class="colorc">${jz.area }</span></li>

<li>学历要求：${jz.xueli }及以上</li>
<li>招聘类型：${jz.ztype }</li>
<li>经验要求：${jz.experience }</li>
<c:forEach items="${alist }" var="a">
<c:if test="${a.fid==jz.addr }">
<li>招聘地点：${a.ftype }</li>
</c:if>
</c:forEach>
<li>发布时间：${jz.pubtime }</li>
<li><a href="showBbs.do?id=${jz.uid}">兼职发布人：${jz.uid}</a></li>
<c:if test="${sessionScope.user!=null }">
<li><a href="addYingPin.do?fid=${jz.id}"><img src="images/jgwc.jpg" width="122" height="42" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="shopjs?shop.goods.id=<s:property value="goods.id" />"><img src="images/js.jpg" width="123" height="43" /></a></li>
</c:if>
<c:if test="${sessionScope.user!=null }">
<li><h3>请登录后应聘此职位！！</h3></li>
</c:if>
</ul>
</div>
</div>
<div class="tuijian">
<div class="tuijian-m">详情</div>
<div class="tuijian-inf">
<ul>
<li>${jz.miaoshu }</li>
</ul>
</div>
<div class="tuijian">
<div class="tuijian-m">应聘者栏</div>
<div class="tuijian-inf">
<ul>

<c:forEach items="${yplist }" var="yp">
<li><a href="showBbs.do?id=${yp.uid }">应聘者：${yp.uid }</a></li>
</c:forEach>

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
