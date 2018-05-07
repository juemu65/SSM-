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
 <s:iterator value="klist">
<li>

<div><a href="show?id=<s:property value="goods.id"/>"><img src="./upload/<s:property value="goods.img"/>" width="305" height="200" /></a></div>
<div class="tuangouy-m"><a href="show?id=<s:property value="goods.id"/>"><s:property value="goods.name"/></a><br />
<s:property value="goods.miaoshu"/><br />
<span><s:property value="goods.pricle"/></span>
</div>
<div class="fengsu"></div>
</li>
</s:iterator>

</ul>
</div>
						
			<%--  <div class="tgfy">当前显示第
			<s:property value="page.pageIndex" />
			页 	共	<s:property value="page.totalpages" />
			页	</div>  <div class="tgfy">
 					<a href="showjieri.action?page.pageIndex=1">首页</a> 
					<a <s:if test="page.pageIndex<=1"> href="javascript:false;"</s:if>
					<s:else>href="showjieri.action?page.pageIndex=<s:property value='page.pageIndex-1' />"</s:else>>上一页</a> 
					<a <s:if test="page.pageIndex>=page.totalpages" > href="javascript:false;"</s:if>
					<s:else>href="showjieri.action?page.pageIndex=<s:property value='page.pageIndex+1' />"</s:else>>下一页</a> 
					<a href="showjieri.action?page.pageIndex=<s:property value="page.totalpages" />">尾页</a></div> --%>
<!--主体内容第一部分结束-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
