<%@ page language="java" import="java.util.*,com.actionForm.TeacherForm" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发布课程</title>
    
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
	<link href="css/setclass.css" type="text/css" rel="stylesheet">

  </head>
  <%
  	TeacherForm teacher=(TeacherForm)session.getAttribute("user");
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
    				<li class="active"><a href="SetClass.jsp">发布课程</a></li>
    				<li><a href="ShowClass.jsp">查看课程</a></li>
    			</ul>
    		</div>
    	</div>
    </nav>
    <div class="form_fix">
    	<div class="page-header">
    		<h3>课程信息</h3>
    	</div>
    	<form role="form" action="InsertClass" method="post">
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="ClassInfo.class_number" class="form-control" id="class_number" placeholder="课程号" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
            	<label></label>
            	<select class="form-control" name="ClassInfo.class_name">
            		<option>选择课程</option>
            		<option>高数</option>
            		<option>英语</option>
            		<option>历史</option>
            		<option>政治</option>
            		<option>计算机组成</option>
            		<option>地理</option>
            	</select>
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="ClassInfo.class_credit" class="form-control" id="class_credit" placeholder="学分" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
            	<label></label>
            	<select  name="ClassInfo.class_start" class="form-control">
            		<option>开始时间</option>
            		<option>1</option>
            		<option>2</option>
            		<option>3</option>
            		<option>4</option>
            		<option>5</option>
            		<option>6</option>
            		<option>7</option>
            		<option>8</option>
            	</select>
            </div>
            <br>
            <div class="input-group">
            	<label></label>
            	<select  name="ClassInfo.class_end" class="form-control">
            		<option>结束时间</option>
            		<option>1</option>
            		<option>2</option>
            		<option>3</option>
            		<option>4</option>
            		<option>5</option>
            		<option>6</option>
            		<option>7</option>
            		<option>8</option>
            	</select>
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="ClassInfo.class_address" class="form-control" id="class_address" placeholder="上课地址" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="ClassInfo.class_stu_limit" class="form-control" id="class_stu_limit" placeholder="限制人数" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
            	<label></label>
            	<select  name="ClassInfo.class_date" class="form-control">
            		<option>星期</option>
            		<option>1</option>
            		<option>2</option>
            		<option>3</option>
            		<option>4</option>
            		<option>5</option>
            		<option>6</option>
            		<option>7</option>
            	</select>
            </div>
            <br>
            <div class="input-group">
            	<label></label>
            	<select name="ClassInfo.class_grade" class="form-control">
            		<option>年级</option>
            		<option>1</option>
            		<option>2</option>
            		<option>3</option>
            		<option>4</option>
            	</select>
            </div>
            <br>
            <div class="input-group">
            	<label></label>
            	<select name="ClassInfo.class_major" class="form-control">
            		<option>专业</option>
            		<option>网络工程</option>
            		<option>计算机科学与技术</option>
            		<option>软件工程</option>
            	</select>
            </div>
            <div class="btn-group pull-right" style="margin-right: 10px;">
                <input type="reset" value="重置" class="btn btn-default ">
                <input type="submit" value="提交" class="btn btn-default ">
            </div>
        </form>
    </div>
  </body>
</html>
