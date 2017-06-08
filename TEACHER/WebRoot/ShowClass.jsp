<%@ page language="java" import="java.util.*,com.actionForm.TeacherForm,java.sql.*,com.dao.ShowClassDao" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程查看</title>
    
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
	
  </head>
  <%
  	TeacherForm teacher=(TeacherForm)session.getAttribute("user");
  	ShowClassDao show=new ShowClassDao();
  	ResultSet rs=show.ShowClass(teacher.getTeacher_name());
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
    	<div class="page-header">
    		<h3>查看课程</h3>
    	</div>
    	<table class="table">
    		<thead>
    			<tr>
    				<th>课程号</th>
    				<th>课程名</th>
    				<th>学分</th>
    				<th>星期</th>
    				<th>上课时间</th>
    				<th>上课地点</th>
    				<th>人数上限</th>
    				<th>年级</th>
    				<th>专业</th>
    				<th>评分</th>
    				<th>操作</th>
    			</tr>
    		</thead>
    		<tbody>
    			<%
    				while(rs.next()){
    			 %>
    			 <tr>
    			 	<th><%=rs.getString("class_number") %></th>
    			 	<th><%=rs.getString("class_name") %></th>
    			 	<th><%=rs.getString("class_credit") %></th>
    			 	<th><%=rs.getString("class_date") %></th>
    			 	<th><%=rs.getString("class_start") %>~<%=rs.getString("class_end") %>节</th>
    			 	<th><%=rs.getString("class_address") %></th>
    			 	<th><%=rs.getString("class_stu_limit") %></th>
    			 	<th><%=rs.getString("class_grade") %></th>
    			 	<th><%=rs.getString("class_major") %></th>
    			 	<th><a href="ScoreClass?class_number=<%=rs.getString("class_number") %>&class_teacher=<%=rs.getString("class_teacher") %>">评分</a></th>
    			 	<th><a href="DeleteClass?class_number=<%=rs.getString("class_number") %>&class_teacher=<%=rs.getString("class_teacher") %>">删除</a></th>
    			 </tr>
    			 <%
    			 	}
    			 	rs.close();
    			  %>
    		</tbody>
    	</table>
    </div>
  </body>
</html>
