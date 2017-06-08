<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/login.css">

  </head>
  
  <body>
    <form action="Manage" method="post">
	<div class="input-group">
	<span class="input-group-addon">@</span>
	<input type="text" id="username" class="form-control" placeholder="管理员工号" name="manager_number" aria-describedby="basic-addon1">
</div>
<br>
<div class="input-group"> 
	<span class="input-group-addon">@</span>
	<input type="password" id="password" class="form-control" placeholder="密码" name="manager_password" aria-describedby="basic-addon1">
</div>
<br>
<div class="btn-group" style="width: 20em;">
	<button type="submit" class="btn btn-default" style="width:20em;">登录</button>
</div>
</form>
<script src="http://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </body>
</html>
