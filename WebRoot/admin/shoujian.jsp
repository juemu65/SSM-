<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>收件箱</title>
<link rel="stylesheet" href="css/pintuer.css"/>
<link rel="stylesheet" href="css/admin.css"/>
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
#reg-mleft1{
    float: left;
    margin-top: 30px;
    width: 515px;
    /* border-right: 1px #CCC solid; */
    padding-left: 50px;
}
/*邮箱输入正确，设置打勾的背景图片*/
.spanBlurOk{
	
	background-image:url(images/right.jpg);
}
</style>
<!-- <link href="css/layout.css" rel="stylesheet" type="text/css" /> -->
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- <script type="text/javascript" src="js/regist.js"></script> -->

</head>

<jsp:include page="top.jsp"></jsp:include>
<!--评价版块-->
<div id="reg">
<s:if test="#session.user!=null">
<form method="post" action="addBbsFore">
  <div id="reg-top">&nbsp;&nbsp;&nbsp;&nbsp;收件箱</div>
 
    <table class="table table-hover text-center">
     <!--  <tr>
       
        <th>id</th>
        <th>标题</th>
        <th style="width:400px;overflow:hidden;">内容</th>
        <th style="width:200px">操作</th>
      </tr> -->
      <s:iterator value="page.pageList" >
        <tr>
          <td><s:property value="name" /></td>
          <td><s:date name="stime" format="yyyy-MM-dd" /></td>
         
          <td><div class="button-group"> <a class="button border-main" href="lookBbs?id=<s:property value="id" />"><span class="icon-edit"></span>查看回复</a> 
         <%--  <a class="button border-red" href="deleteftype?id=<s:property value="fid" />" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a>  --%></div></td>
        </tr>
        </s:iterator>
   		
      <tr>
        
			 <td colspan="3">当前显示第
			<s:property value="page.pageIndex" />
			页
			<!-- </td><td colspan="1"> -->  共
			<s:property value="page.totalpages" />
			页<!-- </td><td colspan="1"> -->
				<a href="bbsList.action?page.pageIndex=1"> 首页</a>
				<s:property value="totalpages" />
				<a <s:if test="page.pageIndex<=1"> href="javascript:false;"</s:if>
					<s:else>href="bbsList.action?page.pageIndex=<s:property value='page.pageIndex-1' />"</s:else>>上一页</a>
				<a
					<s:if test="page.pageIndex>=page.totalpages" > href="javascript:false;"</s:if>
					<s:else>href="bbsList.action?page.pageIndex=<s:property value='page.pageIndex+1' />"</s:else>>下一页</a>
				<a href="bbsList.action?page.pageIndex=<s:property value="page.totalpages" />">末页</a>


			</td>
      </tr>
    </table>
   </form>
   </s:if><s:else>
   对不起！你还没有登录，请登录再操作！
   </s:else>
  </div>

<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
