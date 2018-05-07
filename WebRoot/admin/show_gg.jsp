<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
<!--主体内容第一部分开始-->
<div class="jindck">
<div class="jindck-meun">公告标题：<s:property value="gg.name" /></div>
<div class="jin2">
<div class="jin2-left">
<ul>
<li>
<a href="" title="">
<img src="upload/<s:property value="gg.ggpic" />" width="400" height="250" />
</a>
</li>
<li class="pics"><a href="upload/<s:property value="goods.img" />" class="zoom" title="<s:property value="goods.img" />" ></a></li>

</div>

</div>
<div class="tuijian">
<div class="tuijian-m">公告内容：</div>
<div class="tuijian-inf">
<s:property value="gg.note" />
</div>


</div>
</div>
<!--主体内容第一部分结束-->
<!--底部-->
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
