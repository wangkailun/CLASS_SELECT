<%@ page language="java" import="java.util.*,com.actionForm.TeacherForm,java.sql.*,com.dao.ScoreClassDAO" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>评分页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="css/score.css" rel="stylesheet" type="text/css">

  </head>
  
  <body>
    <%
  	TeacherForm teacher=(TeacherForm)session.getAttribute("user");
  	String class_number=(String)session.getAttribute("class_number");
  	String class_teacher=(String)session.getAttribute("class_teacher");
   %>
  <body>
    <nav class="navbar navbar-default" role="navigation">
    	<div class="container-fluid">
    		<div class="navbar-header">
    			<a class="navbar-brand">山东大学课程发布系统</a>
    		</div>
    		<div class="collapse navbar-collapse pull-right" id="gly">
    			<ul class="nav navbar-nav">
    				<li><a href="#"><span class="glyphicon glyphicon-user"></span><%=teacher.getTeacher_name() %></a></li>
    				<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>
    			</ul>
    		</div>
    		<div class="nav_header pull-right">
    			<ul class="nav navbar-nav">
    				<li><a href="SetClass.jsp">发布课程</a></li>
    				<li class="active"><a href="ShowClass.jsp">查看课程</a></li>
    			</ul>
    		</div>
    	</div>
    </nav>
    <div>
    	<form action="" method="post">
    	<table class="table">
    		<thead>
    			<tr>
    				<th class="fix_show">课程号</th>
    				<th class="fix_show">学生号</th>
    				<th class="fix_show">评分</th>
    			</tr>
    		</thead>
    		<tbody>
    				<tr>
    					<th class="fix_show">001</th>
    					<th class="fix_show">141330107</th>
    					<th><input type="text" class="form-control fix_input" ></th>
    				</tr>
    		</tbody>
    	</table>
    	<input type="submit" class="btn btn-default pull-right fix_button" value="提交">
    	</form>
    </div>
  </body>
</html>
