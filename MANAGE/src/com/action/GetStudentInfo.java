



package com.action;

import java.util.Map;

import com.dao.GetInfoDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import com.actionForm.StudentForm;

public class GetStudentInfo extends ActionSupport{
	private StudentForm student;
	private String stu_number;
	private String del_number;
	
	

	public String getDel_number() {
		return del_number;
	}

	public void setDel_number(String del_number) {
		this.del_number = del_number;
	}

	public String getStu_number() {
		return stu_number;
	}

	public void setStu_number(String stu_number) {
		this.stu_number = stu_number;
	}

	public StudentForm getStudent() {
		return student;
	}

	public void setStudent(StudentForm student) {
		this.student = student;
	}
	
	public String execute() throws Exception{
		GetInfoDao info = new GetInfoDao();
		boolean result=info.SetStudent(student);
		if(result==true){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	public String SelectStudent() throws Exception{
		GetInfoDao info= new GetInfoDao();
		StudentForm stu=info.SelectStudent(stu_number);
		ActionContext context=ActionContext.getContext();
		Map<String, Object> session=context.getSession();
		session.put("stu", stu);
		return SUCCESS;
	}
	
	public String DeleteStudent() throws Exception{
		GetInfoDao info=new GetInfoDao();
		boolean rs=info.DeleteStudent(del_number);
		ActionContext context=ActionContext.getContext();
		Map<String, Object> session=context.getSession();
		session.remove("stu");
		if(rs==true){
			
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
}
