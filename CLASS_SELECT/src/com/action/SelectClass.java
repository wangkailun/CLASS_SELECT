package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.dao.SelectClassDAO;

public class SelectClass extends ActionSupport{
	private String stu_number;
	private String teacher_name;
	private String class_number;
	
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
		System.out.println(teacher_name);
		boolean result=select.Select(stu_number, teacher_name, class_number);
		if(result==true){
			System.out.println("操作成功!!!");
			return SUCCESS;
		}else{
			System.out.println("操作失败!!!!");
			return ERROR;
		}
		
	}
}





