<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<!--主体内容第一部分开始-->
<div class="jindck">
<div class="jindck-meun">服务名称：${jz.name }</div>
<div class="jin2">
<div class="jin2-left">
<ul>
<li>
<a href="" title="">
<img src="upload/${jz.img }" width="400" height="250" />
</a>
</li>
<li class="pics"><a href="upload/${jz.img }" class="zoom" title="${jz.img }" ><img src="upload/${jz.img }" width="100" height="63" /></a></li>
</ul>
</div>
<form action="addForder.do" method="post">
<div class="jin2-right">
<ul>
<li>服务开始时间：<span class="colorc">${jz.stime }</span></li>
<li>服务结束时间：<span class="colorc">${jz.etime }</span></li>

<c:forEach items="${ulist }" var="a">
<c:if test="${a.uid==jz.uid }">
<li>服务员：${a.uname }</li>
</c:if>
</c:forEach>
<c:forEach items="${adlist }" var="a">
<c:if test="${a.fid==jz.fid }">
<li>服务类别：${a.ftype }</li>
</c:if>
</c:forEach>
<li>发布时间：${jz.pubtime }</li>
<c:if test="${sessionScope.user!=null }">
<li><input type="hidden" name="fid" value="${jz.id}">
<input type="hidden" name="fwid" value="${jz.uid}"></li>
<li>服务日期：<input type="text" name="stime" ></li>
<li><input type="submit" value="提交" ></li>
</c:if>
<c:if test="${sessionScope.user==null }">
<li><h3>请登录后预约！！</h3></li>
</c:if>
</ul>
</div>
</form>
</div>

<div class="tuijian">
<div class="tuijian-m">服务内容</div>
<div class="tuijian-inf">
<ul>
<li>${jz.miaoshu }</li>
</ul>
</div>
</div>
<div class="tuijian">
<div class="tuijian-m">服务评价</div>
<div class="tuijian-inf">
<ul>

<c:forEach items="${olist }" var="yp">

<li>评价人：<c:forEach items="${u2list }" var="u">
<c:if test="${yp.uid==u.uid }"> <font color="#ff0000;">${u.tname }</font></c:if>
</c:forEach>  评价：<font color="#ff0000;">${yp.pj }</font></li>
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
