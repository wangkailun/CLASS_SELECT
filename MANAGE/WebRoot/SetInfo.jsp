<%@ page language="java" import="java.util.*,java.sql.*,com.dao.GetInfoDao" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>设置师生信息</title>
    
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
    <link rel="stylesheet" type="text/css" href="css/setinfo.css">
  </head>
  
  <%
  	GetInfoDao info=new GetInfoDao();
  	ResultSet rs=info.GetTeacher();
   %>
  
  <body>
    <nav class="navbar navbar-default" role="navigation">
    	<div class="container-fluid">
    		<div class="navbar-header">
    			<a class="navbar-brand">山东大学信息管理系统</a>
    		</div>
    		<div class="collapse navbar-collapse pull-right" id="gly">
    			<ul class="nav navbar-nav">
    				<li><a href="#"><span class="glyphicon glyphicon-user"></span>管理员</a></li>
    				<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>
    			</ul>
    		</div>
    		<div class="pull-right">
    			<ul class="nav navbar-nav">
    				<li class="active"><a href="#">教师注册</a></li>
    				<li><a href="SetStuInfo.jsp">学生注册</a></li>
    			</ul>
    		</div>
    	</div>
    </nav>
    <div class="form_div">
        <div class="page-header">
            <h3>教师信息</h3>
        </div>
        <form role="form" action="GetInfo" method="post">
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="teacher.teacher_number" class="form-control" id="teacher_number" placeholder="教师工号" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="teacher.teacher_password" class="form-control" id="teacher_password" placeholder="密码" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="teacher.teacher_name" class="form-control" id="teacher_name" placeholder="教师姓名" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
                <span>性别:</span>
                <label class="checkbox-inline">
                    <input type="radio" name="teacher.teacher_sex" id="sex1" value="男" checked="checked">男
                </label>
                <label class="checkbox-inline">
                    <input type="radio" name="teacher.teacher_sex" id="sex1" value="女">女
                </label>
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="teacher.teacher_age" class="form-control" id="teacher_age" placeholder="教师年龄" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="teacher.teacher_phone" class="form-control" id="teacher_phone" placeholder="教师电话" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="btn-group pull-right" style="margin-right: 10px;">
                <input type="reset" value="重置" class="btn btn-default ">
                <input type="submit" value="提交" class="btn btn-default ">
            </div>
        </form>
    </div>
    <br>
    <div style="margin-left:300px;">
    	<div class="page-header">
    		<h3>教师列表</h3>
    	</div>
        <table class="table">
            <thead>
                <tr>
                    <th>工号</th>
                    <th>姓名</th>
                    <th>密码</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>电话</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            	<%
            		while(rs.next()){
            	 %>
                <tr>
                    <th><%=rs.getString("teacher_number") %></th>
                    <th><%=rs.getString("teacher_name") %></th>
                    <th><%=rs.getString("teacher_password") %></th>
                    <th><%=rs.getString("teacher_sex") %></th>
                    <th><%=rs.getString("teacher_age") %></th>
                    <th><%=rs.getString("teacher_phone") %></th>
                    <th><a href="DeleteTeacher?teacher_number=<%=rs.getString("teacher_number") %>">删除</a></th>
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
