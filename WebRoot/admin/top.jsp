<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" >
function check(){
var name=$("#mpass").val();

if(name=null||name==""){
   alert("查询单号不能为空！");
   return false;
}
}
function checkOid(){
var name=$("#mpass").val();
if(name=null||name==""){
   
   return false;
}else{

return true;
}

}


</script>
</head>

<body>
<!--头部-->
<div id="top-cont">
  <div id="top-min">
    <div id="min-left"><h1>ERP(赛盒)管理系统</h1></div>
    <div id="min-right"></div>
  </div>
</div>
<!--导航-->
<div id="menu">
  <div id="menu-m">
    <ul>
      <li><a href="index">首页</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="10" height="42" /></li>
      <li><a href="shownew">百货</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="10" height="42" /></li>
      <li><a href="showlist?goods.object=shi">促销</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="10" height="42" /></li>
      <li><a href="showjieri?f5.day=shi">推荐</a></li>
       <li style="width:8px;"><img src="images/t1.jpg" width="10" height="42" /></li>
      <li ><a href="updateMoney.jsp">充值</a></li>
       <li style="width:8px;"><img src="images/t1.jpg" width="10" height="42" /></li>
      <li><a href="shoplist"><img src="images/che.jpg" width="176" height="42" /></a></li>
    </ul>
  </div>
</div>

