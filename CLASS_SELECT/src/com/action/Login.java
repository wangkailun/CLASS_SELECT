package com.action;

import com.actionForm.StudentForm;
import com.dao.LoginDao;


import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;


import java.util.*;

public class Login extends ActionSupport{
	private StudentForm student;

	public StudentForm getStudent() {
		return student;
	}

	public void setStudent(StudentForm student) {
		this.student = student;
	}
	
	
	public String execute() throws Exception{
		LoginDao login=new LoginDao();
		student=login.login(student);
		if(student!=null){
			System.out.println(student.getStu_number());
			ActionContext context=ActionContext.getContext();
			Map<String, Object> session=context.getSession();
			session.put("user", student);
			return SUCCESS;
		}else{
			return ERROR;
			
		}
	}
}
