package com.action;

import com.dao.LoginDao;


import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;


import java.util.*;

public class Login extends ActionSupport{
	private String manager_number;
	private String manager_password;
	public String getManager_number() {
		return manager_number;
	}
	public void setManager_number(String manager_number) {
		this.manager_number = manager_number;
	}
	public String getManager_password() {
		return manager_password;
	}
	public void setManager_password(String manager_password) {
		this.manager_password = manager_password;
	}
	
	public String execute() throws Exception{
		LoginDao login=new LoginDao();
		boolean result=login.login(manager_number, manager_password);
		if(result==true){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
}
