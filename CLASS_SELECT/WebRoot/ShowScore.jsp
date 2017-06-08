<%@ page language="java" import="java.util.*,com.dao.ShowClassDAO,java.sql.*,com.actionForm.StudentForm,com.dao.ShowScoreDAO" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看成绩</title>
    
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
	<link rel="stylesheet" type="text/css" href="css/score.css">
	

  </head>
  
  <body>
    <%
  		request.setCharacterEncoding("UTF-8");
    	StudentForm student=(StudentForm)session.getAttribute("user");
    	ShowScoreDAO score=new ShowScoreDAO();
    	ResultSet rs=score.GetScore(student.getStu_number());
  %>
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
    				<li><a href="ShowClass.jsp">已选课程</a></li>
    				<li class="active"><a href="ShowScore.jsp">查看成绩</a></li>
    			</ul>
    		</div>
    	</div>
    </nav>
    <div>
    	<table class="table">
    		<thead>
    			<tr>
    				<th class="fix_show">课程号</th>
    				<th class="fix_show">课程名</th>
    				<th class="fix_show">评分</th>
    			</tr>
    		</thead>
    		<tbody>
    			<%
    				while(rs.next()){
    			 %>
    			<tr>
    				<th class="fix_show"><%=rs.getString("class_number") %></th>
    				<th class="fix_show"><%=score.GetClassName(rs.getString("class_number"), rs.getString("teacher_name")) %></th>
    				<th class="fix_show"><%=rs.getString("score") %></th>
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
