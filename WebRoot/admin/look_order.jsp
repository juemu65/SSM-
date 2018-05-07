<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="top.jsp"></jsp:include>
    <h1 align="center">恭喜您查询成功！</h1>
         <h2 align="center">订单：<s:property value="order.ostate" /></h2>
     <div class="reindex" align="center"><a href="index" target="_parent">返回首页</a></div>
  
  <!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
