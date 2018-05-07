<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!--导航-->
<jsp:include page="top.jsp"></jsp:include>
<!--主体内容第一部分开始-->
<div id="content1">
  <!--左侧-->
  <div id="con1-left">
    <div class="con1-1">产品查询</div>
<%--     <div class="cs">
    <ul>
      <s:iterator value="gglist">
    <li>
    <a href="showgg.action?gg.ggid=<s:property value="ggid"/>"><s:property value="name" /></a>
    </li>
    </s:iterator>
    </ul>
    </div> --%>
    
     <form action="search" method="post" >
    <div class="cs">
   
      <ul>
      <li style="display:inline;" >类 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
       <select name="f1.ftype.fid">
        <option value="">请选择分类</option>
       <s:iterator value="ftlist">
        <option value="<s:property value="fid" />"><s:property value="ftype" /></option>
        </s:iterator>
         </select>
       </li><br/>
      <li  style="display:inline;">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 格：
      <select name="f1.pricle" class="input w50">
              <option value="">请选择分类</option>
              <option value="1">100元以内</option>
              <option value="2">100-200元</option>
              <option value="3">200-300元</option>
              <option value="4">300-500元</option>
              <option value="5">500-800元</option>
              <option value="6">800元以上</option>
             
             </select> </li><br />
      <li  style="display:inline;">是否&nbsp;&nbsp;推荐：
      <select name="f1.day">
              <option value="">请选择分类</option>
              <option value="shi">推荐</option>
              <option value="fou">非推荐</option>
             </select> </li><br />
      <li  style="display:inline;">是否促销：<select name="f1.object" class="input w50">
              <option value="">请选择分类</option>
              <option value="shi">促销</option>
              <option value="fou">非促销</option>
             </select></li><br />
      <li align="center" ><input type="submit" name="" value="搜索"/></li>
      
      </ul>
      
    </div>
    </form>
    <div class="con1-2">配送范围</div>
    <div class="cs1">
      <ul>
         <s:iterator value="plist" >
        <li><a ><s:property value="psArea" /></a></li>
        </s:iterator>
        
      </ul>
    </div>
    
   
    
    
  </div>
  <!--右侧-->
  <div id="con1-right">
    <div id="right-top">
      <div class="banner">
     
        <ul id="imgs">
         <s:iterator value="gpiclist" >
          <li><a href="showgg.action?gg.ggid=<s:property value="ggid"/>"><img src="./upload/<s:property value="ggpic" />" width="500" height="240"/></a></li>
            </s:iterator>
        </ul>
        <ul id="numbers">
        <s:iterator value="nlist" >
          <li></li>
          </s:iterator>
        </ul>
    
      </div>
       <s:if test="#session.user==null">
      <div class="zcdl">
        <ul>
          <li style="margin-right:3px;"><a href="fore_login.jsp"><img src="images/dl.jpg" width="85" height="36" /></a></li>
          <li><a href="regist.jsp"><img src="images/zc.jpg" width="85" height="36" /></a></li>
        </ul>
      </div>
      <div class="my">
      <form action="getorder" method="post" onsubmit="return checkOid()">
        <ul>
          <li><span class="myd">订单查询</span></li>
          <li class="xt">
         <input type="text" id="mpass" name="order.oid" size="15" placeholder="请输入要查询的单号" data-validate="required:请输入要查询的单号" onblur="return check()"/> 
        <span class="rs"><input type="submit" value="搜索"  /></span></li>
        <!--   <li class="cls"><a href="orderpj">确认收货及评价</a></li>
          <li class="cls1"><a href="showuseraddress">常用收货人及地址</a></li> -->
        </ul>
        </form>
      </div>
       </s:if> <s:else>
        <div class="zcdl">
        <ul>
        <li style="line-height: 24px;font-size: 25px;text-align: center;">  &nbsp;&nbsp;<s:property value="#session.user.uname"/>  &nbsp;你好!</li>
      <!--  <li style="margin-right:3px;"><a href="exit"><img src="images/zhux.jpg" width="85" height="40" /></a></li> -->
       <li class="cls1"><a href="shouJian">收件箱</a><a href="exit"><img src="images/zhux.jpg" width="85" height="28" style="    margin-left: 47px;
    margin-top: -26px;display: block;"/></a></li>
     <%--     <li class="cls1">我的积分：<s:property value="#session.user.level"/></li>
          <li class="cls1">我的余额：<s:property value="#session.user.money"/></li> --%>
       </ul>
      </div>
      <div class="my">
      <form action="getorder" method="post" onsubmit="return checkOid()">
        <ul>
         <%--  <li><span class="myd">订单查询</span></li> --%>
          <li class="xt">
         <input type="text" id="mpass" name="order.oid" size="15" placeholder="请输入要查询的单号" data-validate="required:请输入要查询的单号" onblur="return check()"/> 
        <span class="rs"><input type="submit" value="搜索"  /></span></li>
          <li class="cls1"><a href="orderpj">确认收货及评价</a></li>
          <li class="cls1"><a href="showuseraddress">常用收货人及地址</a></li>
          <li class="cls1"><a href="getAllKeep?keep.uid=<s:property value="#session.user.uid"/>">我的收藏</a></li>
        </ul>
        </form>
      </div>
      </s:else>
      
    </div>
     
    <div id="right-btm">
      <div class="tgj"><span><a href="shownew">更多新品商品>></a></span></div>
      <div class="tgjlx">
        <ul style="width:1446px">
         <s:iterator value="page.pageList">
       <li><a href="show?id=<s:property value="id"/>"><img src="./upload/<s:property value="img"/>" width="160" height="88" /><s:property value="name"/></a><br />
            <span>￥<s:property value="pricle"/>元</span></li>
       </s:iterator>
       
        </ul>
      </div>
    </div>
  </div>
</div>
<!--主体内容第一部分结束--> 
<!--主体内容第二部分开始-->
<div id="con-2"> 
  <!--左侧开始-->
  <div id="con-2left">
    <div id="con-2left1">
      <div class="con-21"></div>
      <div class="jingdian">
      <ul>
          <li><a href="showpirce?f4.pricle=1">100元以内</a></li>
          <li><a href="showpirce?f4.pricle=2">100-200元</a></li>
          <li><a href="showpirce?f4.pricle=3">200-300元</a></li>
          <li><a href="showpirce?f4.pricle=4">300-500元</a></li>
          <li><a href="showpirce?f4.pricle=5">500-800元</a></li>
          <li><a href="showpirce?f4.pricle=6">800以上</a></li>
        </ul>
      </div>
      <div class="con-23"></div>
      <div class="jingdian">
         <ul>
        <s:iterator value="ftlist">
        <li><a href="showtype?f3.ftype.fid=<s:property value="fid" /> "><s:property value="ftype" /></a></li>
        </s:iterator>
       </ul>
      </div>
    </div>
  </div>
  <!--左侧结束--> 
  <!--右侧开始-->
  <div id="con-2right">
    <div id="con-2meun">
    
    </div>
    
       <div class="con-2inf">
      <ul>
      <s:iterator value="olist">
      <%-- <s:property value="goods.fid"/> --%>
        <li class="w130"><a href="show?id=<s:property value="goods.id"/>&o.goods.id=<s:property value="goods.id"/>"><img src="./upload/<s:property value="goods.img"/>" width="220" height="150" />
        <br /><s:property value="goods.name"/><br /><s:property value="goods.pricle"/></a></li>
       </s:iterator>
        
      </ul>
    
    
    
  </div>
</div>
<!--主体内容第二部分结束--> 
<!--底部-->
<jsp:include page="foot.jsp"></jsp:include>
