package com.action;

import com.actionForm.TeacherForm;
import com.opensymphony.xwork2.ActionSupport;
import com.dao.GetInfoDao;
public class GetTeacherInfo extends ActionSupport{
	private TeacherForm teacher;
	private String teacher_number;

	public String getTeacher_number() {
		return teacher_number;
	}

	public void setTeacher_number(String teacher_number) {
		this.teacher_number = teacher_number;
	}

	public TeacherForm getTeacher() {
		return teacher;
	}

	public void setTeacher(TeacherForm teacher) {
		this.teacher = teacher;
	}
	
	public String execute() throws Exception{
		GetInfoDao info = new GetInfoDao();
		boolean result=info.SetTeacher(teacher);
		if(result==true){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	public String DeleteTeacher() throws Exception{
		GetInfoDao info =new GetInfoDao();
		boolean result=info.DeleteTeacher(teacher_number);
		if(result==true){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
}
