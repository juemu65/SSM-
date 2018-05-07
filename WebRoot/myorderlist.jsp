<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<!--主体内容第一部分开始-->
<div class="tuangouy">

 
<table class="table table-hover text-center">
<tr>
<td>服务名称</td><td>服务员id</td><td>服务时间</td><td>服务员电话</td><td>订单状态</td><td>订单评价</td><td>操作</td>
</tr>
<c:forEach items="${list }" var="yp">

<tr>
<c:forEach items="${fwlist }" var="jz">
<c:if test="${jz.id==yp.fid }">
<td>${jz.name }</td>
</c:if>
</c:forEach>
<td>${yp.fwid }</td>
<td>${yp.stime }</td>
<c:forEach items="${ulist }" var="jz">
<c:if test="${jz.uid==yp.fwid }">
<td>${jz.tel }</td>
</c:if>
</c:forEach>
<td>${yp.status }</td>
<td>${yp.pj }</td>
<c:if test="${yp.status=='未完成' }">
<td><a href="wancheng.do?id=${yp.kid }">完成</a></td>
</c:if>
<c:if test="${yp.status=='完成' }">
<td><a href="doAddpj.do?id=${yp.kid }">评价</a></td>
</c:if>
<c:if test="${yp.status=='已评价' }">
<td>已评价</td>
</c:if>
</tr>
 <tr>
		<td colspan="7"> <c:if test="${page.page>1}">
              <a href="showQiuZ.do?page=1" >首页</a>
             <a href="showQiuZ.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="showQiuZ.do?page=${page.page+1 }">下一页</a>
			<a href="showQiuZ.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
</tr>


</c:forEach>

</table>


</div>
						
			
<!--主体内容第一部分结束-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
