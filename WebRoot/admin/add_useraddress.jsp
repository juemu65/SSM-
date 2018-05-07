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
<title>添加常用人和地址</title>
<style type="text/css">
.txtInit {
	border: 1px #cecece solid;
}
.txtFocus {
	border: 1px solid #009;
}
.spanInit {
	width: 300px;
	height: 22px;
	display: block;
	float: right;
	background-repeat: no-repeat;
	background-position: left;
}
/*邮箱输入正确，设置打勾的背景图片*/
.spanBlurOk{
	
	background-image:url(images/right.jpg);
}
</style>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- <script type="text/javascript" src="js/regist.js"></script> -->
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

</head>


<!--导航-->
<jsp:include page="top.jsp"></jsp:include>

<!--注册版块-->
<div id="reg">

  <div id="reg-top">&nbsp;&nbsp;&nbsp;&nbsp;添加常用人和地址</div>
  <div id="reg-mleft">
  <form onsubmit="return check()" method="post" action="adduseraddress">
    <ul>
      <li class="m">姓名 </li>
      <li class="r" >
        <input name="ps.uname" type="text" class="box txtInit"  />
        <span  class="spanInit" ></span></li>
      <li class="m">地址 </li>
      <li class="r">
         <select name="ps.uaddress" class="input w50">
              <option value="">请选择地址</option>
              <s:iterator value="plist">
              <option value="<s:property value="psArea" />"><s:property value="psArea" /></option>
              </s:iterator>
             </select>
        
        <input name="uaddress" type="text" class="box txtInit" id="txtPwd" />
        <span id='prompt_pwd'  class="spanInit" > <input name="ps.userinfo.uid" type="hidden" value="<s:property value="#session.user.uid" />" />
       
        </span></li>
      
      <li class="r">
        <input name="button" type="image" id="button" value="提交" src="images/delSure.jpg"  />
      </li>
      
    </ul>
      </form>
  </div>

  <div id="reg-right">
    <div><img src="images/kf.jpg" width="230" height="150" /></div>
    <div id="kf2"><a href="fore_login.jsp">已有账户，请点击登录</a></div>

  </div>
</div>

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</html>
