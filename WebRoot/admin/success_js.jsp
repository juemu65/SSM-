<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
   <div align="center">
  <h1> 恭喜您购买成功！订单号为：<s:property value="order.oid" /></h1>  
   <div class="reindex"><a href="index" target="_parent">返回首页</a></div>
  </div><!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
  </body>
  
</html>
