<%@ page language="java" import="java.util.*,com.dao.ShowClassDAO,java.sql.*,com.actionForm.StudentForm" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>已选课程</title>
    
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
	<link rel="stylesheet" type="text/css" href="css/selectclass.css">

  </head>
  <%
  	StudentForm student=(StudentForm)session.getAttribute("user");
  	ShowClassDAO show=new ShowClassDAO();
  	ResultSet rs=show.ChoicedClass(student);
   %>
  <body>
    <nav class="navbar navbar-default" role="navigation">
    	<div class="container-fluid">
    		<div class="navbar-header">
    			<a class="navbar-brand">山东大学选课系统</a>
    		</div>
    		<div class="collapse navbar-collapse pull-right" id="gly">
    			<ul class="nav navbar-nav">
    				<li><a href="#"><span class="glyphicon glyphicon-user"></span><%=student.getStu_name() %></a></li>
    				<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>
    			</ul>
    		</div>
    		<div class="nav_header pull-right">
    			<ul class="nav navbar-nav">
    				<li><a href="SelectClass.jsp">选课</a></li>
    				<li class="active"><a href="ShowClass">已选课程</a></li>
    				<li><a href="ShowScore.jsp">查看成绩</a></li>
    			</ul>
    		</div>
    	</div>
    </nav>
    <div>
    	<div class="table-responsive">
    		<table class="table table_fix" >
    			<caption class="table_fix">学生已选课表</caption>
    			<thead>
    				<tr class="table_fix">
    					<th class="table_fix">课程代号</th>
    					<th class="table_fix">课程名称</th>
    					<th class="table_fix">教师</th>
    					<th class="table_fix">学分</th>
    					<th class="table_fix">星期</th>
    					<th class="table_fix">排课时间</th>
    					<th class="table_fix">计划人数</th>
    					<th class="table_fix">状态</th>
    				</tr>
    			</thead>
    			<tbody>
    				<%
    					while(rs.next()){
    				 %>
    				<tr>
    					<th class="table_fix"><%=rs.getString("class_number") %></th>
    					<th class="table_fix"><%=rs.getString("class_name") %></th>
    					<th class="table_fix"><%=rs.getString("class_teacher") %></th>
    					<th class="table_fix"><%=rs.getString("class_credit") %></th>
    					<th class="table_fix"><%=rs.getString("class_date") %></th>
    					<th class="table_fix"><%=rs.getString("class_start") %>~<%=rs.getString("class_end") %>节</th>
    					<th class="table_fix"><%=rs.getString("class_stu_limit") %></th>
    					<th class="table_fix">已选</th>
    				</tr>
    				<%
    				} 
    				rs.close();
    				%>
    			</tbody>
    		</table>
    	</div>
    </div>
  </body>
</html>
