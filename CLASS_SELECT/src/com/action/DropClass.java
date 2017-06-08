package com.action;

import com.dao.SelectClassDAO;

import com.opensymphony.xwork2.ActionSupport;

public class DropClass extends ActionSupport{
	private String stu_number;
	private String class_number;
	private String teacher_name;
	public String getStu_number() {
		return stu_number;
	}
	public void setStu_number(String stu_number) {
		this.stu_number = stu_number;
	}
	public String getClass_number() {
		return class_number;
	}
	public void setClass_number(String class_number) {
		this.class_number = class_number;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	
	public String execute() throws Exception{
		SelectClassDAO select=new SelectClassDAO();
		boolean result=select.DropClass(stu_number, teacher_name, class_number);
		if(result==true){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
}
