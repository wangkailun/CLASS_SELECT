package com.dao;

import com.actionForm.TeacherForm;
import com.core.DBconnect;
import java.sql.*;

public class LoginDao {
	public boolean login(String teacher_number,String teacher_password){
		Connection conn;
		DBconnect db=new DBconnect();
		conn = db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM teacher_info WHERE teacher_number='"+teacher_number+"' AND teacher_password='"+teacher_password+"'";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			System.err.println("登录错误:"+e.getMessage());
			return false;
		}
	}
	public TeacherForm setlogin(String teacher_number,String teacher_password){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		TeacherForm teacher=new TeacherForm();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM teacher_info WHERE teacher_number='"+teacher_number+"' AND teacher_password='"+teacher_password+"'";
			ResultSet rs=stmt.executeQuery(sql);
			rs.next();
			teacher.setTeacher_number(rs.getString("teacher_number"));
			teacher.setTeacher_name(rs.getString("teacher_name"));
			teacher.setTeacher_age(rs.getString("teacher_age"));
			teacher.setTeacher_password(rs.getString("teacher_password"));
			teacher.setTeacher_sex(rs.getString("teacher_sex"));
			teacher.setTeacher_phone(rs.getString("teacher_phone"));
			return teacher;
		}catch(Exception e){
			System.err.println("设置session出错:"+e.getMessage());
			return null;
		}
	}

}
