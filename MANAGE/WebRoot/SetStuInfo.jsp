<%@ page language="java" import="java.util.*,com.actionForm.StudentForm" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生注册</title>
    
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
    				<li ><a href="SetInfo.jsp">教师注册</a></li>
    				<li class="active"><a>学生注册</a></li>
    			</ul>
    		</div>
    	</div>
    </nav>
    <div class="form_div">
        <div class="page-header">
            <h3>学生信息</h3>
        </div>
        <form role="form" action="SetStudent" method="post">
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="student.stu_number" class="form-control" id="stu_number" placeholder="学号" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="student.stu_password" class="form-control" id="stu_password" placeholder="密码" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="student.stu_name" class="form-control" id="stu_name" placeholder="姓名" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" name="student.stu_age" class="form-control" id="stu_age" placeholder="年龄" aria-describedby="basic-addon1">
            </div>
            <br>
            <div class="input-group">
                <span>性别:</span>
                <label class="checkbox-inline">
                    <input type="radio" name="student.stu_sex" id="sex1" value="男" checked="checked">男
                </label>
                <label class="checkbox-inline">
                    <input type="radio" name="student.stu_sex" id="sex1" value="女">女
                </label>
            </div>
            <br>
            <div class="input-group">
                <label></label>
                <select class="form-control" name="student.stu_major">
                	<option>选择专业</option>
                	<option>网络工程</option>
                	<option>软件工程</option>
                	<option>信息安全</option>
                </select>
            </div>
            <br>
            <div class="input-group">
                <label></label>
                <select class="form-control" name="student.stu_department">
                	<option>选择学院</option>
                	<option>计算机科学与技术</option>
                	<option>机械学院</option>
                	<option>信息学院</option>
                	<option>人文学院</option>
                </select>
            </div>
            <br>
            <div class="input-group">
                <label></label>
                <select class="form-control" name="student.stu_grade">
                	<option>选择年级</option>
                	<option>1</option>
                	<option>2</option>
                	<option>3</option>
                	<option>4</option>
                </select>
            </div>
            <br>
            <div class="btn-group pull-right" style="margin-right: 10px;">
                <input type="reset" value="重置" class="btn btn-default ">
                <input type="submit" value="提交" class="btn btn-default ">
            </div>
        </form>
    </div>
    <div class="form_div">
        <div class="page-header">
            <h3>学生查询</h3>
        </div>
    </div>
    <div class="form_div">
        <form role="form" action="SelectStudent" method="post">
            <div class="input-group">
                <input type="text" name="stu_number" class="form-control">
                <span class="input-group-btn">
                    <input type="submit" value="查询" class="btn btn-default">
                </span>
            </div>
        </form>
    </div>
    <div style="margin-left:300px;">
    	<%
    		StudentForm student=(StudentForm)session.getAttribute("stu");
    		if(student!=null){
    	 %>
    	 <table class="table">
    	 	<thead>
    	 		<tr>
    	 			<th>学号</th>
    	 			<th>姓名</th>
    	 			<th>性别</th>
    	 			<th>年龄</th>
    	 			<th>专业</th>
    	 			<th>学院</th>
    	 			<th>年级</th>
    	 			<th>密码</th>
    	 			<th>操作</th>
    	 		</tr>
    	 	</thead>
    	 	<tbody>
    	 		<tr>
    	 			<th><%=student.getStu_number() %></th>
    	 			<th><%=student.getStu_name() %></th>
    	 			<th><%=student.getStu_sex() %></th>
    	 			<th><%=student.getStu_age() %></th>
    	 			<th><%=student.getStu_major() %></th>
    	 			<th><%=student.getStu_department() %></th>
    	 			<th><%=student.getStu_grade() %></th>
    	 			<th><%=student.getStu_password() %></th>
    	 			<th><a href="DeleteStudent?del_number=<%=student.getStu_number() %>">删除</a></th>
    	 		</tr>
    	 	</tbody>
    	 </table>
    	 <%
    	 	
    	 	}
    	  %>
    </div>
  </body>
</html>
