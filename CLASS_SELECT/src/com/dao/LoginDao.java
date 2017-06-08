package com.dao;

import com.core.DBconnect;
import java.sql.*;
import com.actionForm.StudentForm;

public class LoginDao {
	public StudentForm login(StudentForm student){
		DBconnect db = new DBconnect();
		Connection conn;
		conn = db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM students_info WHERE stu_number= '"+student.getStu_number()+"' AND stu_password= '"+student.getStu_password()+"'";
			ResultSet rs=stmt.executeQuery(sql);
			rs.next();
			student.setStu_age(rs.getString("stu_age"));
			student.setStu_department(rs.getString("stu_department"));
			student.setStu_grade(rs.getString("stu_grade"));
			student.setStu_sex(rs.getString("stu_sex"));
			student.setStu_major(rs.getString("stu_major"));
			student.setStu_name(rs.getString("stu_name"));
			rs.close();
			stmt.close();
			conn.close();
			return student;
		}catch(Exception e){
		System.err.println("登录错误了:"+e.getMessage());
		return null;
		}
	}
	
}
