package com.action;

import com.dao.SetClassDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import com.actionForm.*;
import java.util.Map;
import com.dao.ShowClassDao;

public class SetClass extends ActionSupport{
	
	private classForm ClassInfo=new classForm();
	
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

	public classForm getClassInfo() {
		return ClassInfo;
	}

	public void setClassInfo(classForm classInfo) {
		ClassInfo = classInfo;
	}
	
	public String execute() throws Exception{
		ActionContext context=ActionContext.getContext();
		Map session=context.getSession();
		TeacherForm teacher=new TeacherForm();
		teacher=(TeacherForm)session.get("user");
		ClassInfo.setClass_teacher(teacher.getTeacher_name());
		ClassInfo.setClass_stu_num(0);
		SetClassDao setclass=new SetClassDao();
		boolean result=setclass.SetClass(ClassInfo);
		if(result==true){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	public String DeleteClass() throws Exception{
		ShowClassDao show=new ShowClassDao();
		boolean result=show.DeleteClass(class_number, class_teacher);
		if(result==true){
			return SUCCESS;
		}else{
			return ERROR;
		}
		
	}

}
