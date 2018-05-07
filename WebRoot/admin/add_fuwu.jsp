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
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<%-- <script src="js/pintuer.js"></script> --%>
</head>
<script charset="utf-8" src="/jiazheng/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/jiazheng/kindeditor/lang/zh-CN.js"></script>
<script>
	        KindEditor.ready(function(K) {
	                window.editor = K.create('#editor_id');
	        });
	</script>
	<script>

KindEditor.ready(function(K) {

K.create('textarea[name="note"]', {

uploadJson : '/jiazheng/kindeditor/jsp/upload_json.jsp',

                fileManagerJson : '/jiazheng/kindeditor/jsp/file_manager_json.jsp',

                allowFileManager : true,

                allowImageUpload : true, 

autoHeightMode : true,

afterCreate : function() {this.loadPlugin('autoheight');},

afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

});

});

</script>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="addFuWu.do" enctype="multipart/form-data">  
      <div class="form-group">
        <div class="label">
          <label>名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" size="18" name="name" data-validate="required:请输入岗位名称" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图片：</label>
        </div>
        <div class="field">
          <input type="file" id="url1" name="file" class="input tips" style="width:25%; float:left;"  value="图片上传"  data-toggle="hover" data-place="right" data-image="" />
          
          <div class="tipss">图片尺寸：500*500</div>
        </div>
      </div>     
        <div class="form-group">
          <div class="label">
            <label>服务员：</label>
          </div>
          <div class="field" style="padding-top:8px;"> 
             <select name="uid" class="input w50" >
        <c:forEach items="${ulist }" var="ad">
        <option value="${ad.uid}">${ad.uname }</option>
          </c:forEach>
        </select>
          </div>
        </div>
      <div class="form-group">
        <div class="label">
          <label>服务开始时间：</label>
        </div>
        <div class="field" >
          <input type="text" class="input w50"  name="stime" size="15" style="height:45px;"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>服务结束时间：</label>
        </div>
        <div class="field" >
          <input type="text" class="input w50"  name="etime" size="15" style="height:45px;"/>
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>所属类型：</label>
        </div>
        <div class="field" >
        <select name="fid" class="input w50" >
        <c:forEach items="${adlist }" var="ad">
        <option value="${ad.fid}">${ad.ftype }</option>
          </c:forEach>
        </select>
      
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>服务描述：</label>
        </div>
        <div class="field">
        <textarea id="editor_id"  name="miaoshu" style="width:800px;height:200px;" ></textarea>
        
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>