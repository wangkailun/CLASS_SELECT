package com.action;

import java.util.*;
import com.dao.ScoreClassDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ScoreClass extends ActionSupport{
	
	private String class_number;
	private String class_teacher;
	public String getClass_number() {
		return class_number;
	}
	public void setClass_number(String class_number) {
		this.class_number = class_number;
	}
	public String getClass_teacher() {
		return class_teacher;
	}
	public void setClass_teacher(String class_teacher) {
		this.class_teacher = class_teacher;
	}
	
	public String execute() throws Exception{
		ActionContext context=ActionContext.getContext();
		Map session=context.getSession();
		session.put("class_number", class_number);
		session.put("class_teacher", class_teacher);
		return SUCCESS;
	}

}
