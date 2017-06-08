package com.dao;

import java.sql.*;
import com.actionForm.TeacherForm;
import com.core.DBconnect;
import com.actionForm.StudentForm;


public class GetInfoDao {
	
	public boolean SetTeacher(TeacherForm teacher){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="INSERT INTO teacher_info(teacher_number,teacher_name,teacher_sex,teacher_age,teacher_phone,teacher_password) VALUES ('"+teacher.getTeacher_number()+"','"+teacher.getTeacher_name()+"','"+teacher.getTeacher_sex()+"','"+teacher.getTeacher_age()+"','"+teacher.getTeacher_phone()+"','"+teacher.getTeacher_password()+"')";
			int result=stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			if(result==1){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			System.err.println("插入数据出现错误:"+e.getMessage());
			return false;
		}
	}
	
	public ResultSet GetTeacher(){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM teacher_info";
			ResultSet rs=stmt.executeQuery(sql);
			return rs;
		}catch(Exception e){
			System.err.println("查询出错:"+e.getMessage());
			return null;
		}
	}
	
	public boolean DeleteTeacher(String teacher_number){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql2="SELECT teacher_name FROM teacher_info WHERE teacher_number='"+teacher_number+"'";
			ResultSet rs=stmt.executeQuery(sql2);
			String teacher_name=rs.getString("teacher_name");
			String sql3="DELETE FROM class_choice WHERE teacher_name='"+teacher_name+"'";
			String sql4="DELETE FROM class_info WHERE teacher_name='"+teacher_name+"'";
			int result2=stmt.executeUpdate(sql3);
			int result3=stmt.executeUpdate(sql4);
			String sql="DELETE FROM teacher_info WHERE teacher_number='"+teacher_number+"'";
			int result=stmt.executeUpdate(sql);
			rs.close();
			stmt.close();
			conn.close();
			if(result >0){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			System.err.println("删除出现错误:"+e.getMessage());
			return false;
		}
	}
	
	public boolean SetStudent(StudentForm student){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="INSERT INTO students_info(stu_number,stu_name,stu_sex,stu_age,stu_major,stu_department,stu_grade,stu_password) VALUES ('"+student.getStu_number()+"','"+student.getStu_name()+"','"+student.getStu_sex()+"','"+student.getStu_age()+"','"+student.getStu_major()+"','"+student.getStu_department()+"','"+student.getStu_grade()+"','"+student.getStu_password()+"')";
			int result=stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			if(result==1){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			System.err.println("插入学生信息出现错误:"+e.getMessage());
			return false;
		}
	}
	
	public StudentForm SelectStudent(String stu_number){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		StudentForm student=new StudentForm();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM students_info WHERE stu_number='"+stu_number+"'";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				student.setStu_number(rs.getString("stu_number"));
				student.setStu_name(rs.getString("stu_name"));
				student.setStu_age(rs.getString("stu_age"));
				student.setStu_department(rs.getString("stu_department"));
				student.setStu_grade(rs.getString("stu_grade"));
				student.setStu_major(rs.getString("stu_major"));
				student.setStu_sex(rs.getString("stu_sex"));
				student.setStu_password(rs.getString("stu_password"));
				rs.close();
				stmt.close();
				conn.close();
				
			}else{
				String str="";
				student.setStu_number(str);
				student.setStu_name(str);
				student.setStu_age(str);
				student.setStu_department(str);
				student.setStu_grade(str);
				student.setStu_major(str);
				student.setStu_sex(str);
				student.setStu_password(str);
				rs.close();
				stmt.close();
				conn.close();
			}
			return student;
		}catch(Exception e){
			System.err.println("出现错误:"+e.getMessage());
			return null;
		}
	}
	
	public boolean DeleteStudent(String stu_number){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="DELETE FROM students_info WHERE stu_number='"+stu_number+"'";
			String sql2="DELETE FROM class_choice WHERE stu_number='"+stu_number+"'";
			int rs1=stmt.executeUpdate(sql2);
			int rs=stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			if(rs>0){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			System.err.println("删除出现错误:"+e.getMessage());
			return true;
		}
	}

}
