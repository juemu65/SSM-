<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="top.jsp"></jsp:include>

<!--主体内容第一部分开始-->
<div class="tuangouy">
<ul>
 <c:forEach items="${list }" var="jz">
<li>

<div><a href="showFuWu.do?id=${jz.id }"><img src="./upload/${jz.img }" width="305" height="200" /></a></div>
<div class="tuangouy-m"><a href="showFuWu.do?id=${jz.id }">服务名称：${jz.name }</a><br />
服务开始时间：${jz.stime}<br />
<span>服务结束时间：${jz.etime }</span>
</div>
<div class="fengsu"></div>
</li>
</c:forEach>

</ul>
</div>
						
			 <div class="tgfy"> 
         <c:if test="${sessionScope.p==1 }">
		<c:if test="${page.page>1}">
              <a href="showfuwu.do?page=1" >首页</a>
             <a href="showfuwu.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="showfuwu.do?page=${page.page+1 }">下一页</a>
			<a href="showfuwu.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		
	</c:if>
	<c:if test="${sessionScope.p==2 }">
	 <c:if test="${page.page>1}">
    <a href="selectFuWuList.do?page=1" >首页</a>
    <a href="selectFuWuList.do?page=${page.page-1 }"> 上一页</a> 
    </c:if>
    	<c:if test="${page.page<page.totalPage}">
			<a href="selectFuWuList.do?page=${page.page+1 }">下一页</a>
			<a href="selectFuWuList.do?page=${page.totalPage }">末页</a>
		</c:if> 
		
		</c:if>
      </div>
<!--主体内容第一部分结束-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
