package com.action;

import java.util.Map;

import com.dao.LoginDao;
import com.actionForm.TeacherForm;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class Login extends ActionSupport{
	private String teacher_number;
	private String teacher_password;
	public String getTeacher_number() {
		return teacher_number;
	}
	public void setTeacher_number(String teacher_number) {
		this.teacher_number = teacher_number;
	}
	public String getTeacher_password() {
		return teacher_password;
	}
	public void setTeacher_password(String teacher_password) {
		this.teacher_password = teacher_password;
	}
	
	public String execute() throws Exception{
		LoginDao login=new LoginDao();
		boolean result = login.login(teacher_number, teacher_password);
		if(result==true){
			TeacherForm teacher=login.setlogin(teacher_number, teacher_password);
			ActionContext context=ActionContext.getContext();
			Map<String, Object> session=context.getSession();
			session.put("user", teacher);
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
}
