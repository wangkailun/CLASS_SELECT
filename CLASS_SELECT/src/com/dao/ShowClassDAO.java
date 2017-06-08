package com.dao;

import com.core.DBconnect;
import java.sql.*;
import com.actionForm.StudentForm;

public class ShowClassDAO {
	
	//按学生的年级和专业，展示选课表
	public ResultSet ShowClass(StudentForm student){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql1="SELECT * FROM students_info WHERE stu_number='"+student.getStu_number()+"' AND stu_password='"+student.getStu_password()+"'";
			ResultSet rs=stmt.executeQuery(sql1);
			rs.next();
			String sql2="SELECT * FROM class_info WHERE class_grade='"+rs.getString("stu_grade")+"' AND class_major='"+rs.getString("stu_major")+"'";
			ResultSet rs1=stmt.executeQuery(sql2);
			return rs1;
		}catch(Exception e){
			System.out.println("展示课程出现错误"+e.getMessage());
			return null;
		}
	}
	//判断当前课程是否已经被选择
	public boolean JudgeInfo(String stu_number,String teacher_name, String class_number){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM class_choice WHERE stu_number='"+stu_number+"' AND class_number='"+class_number+"' AND teacher_name='"+teacher_name+"'";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				System.out.println("已选");
				stmt.close();
				conn.close();
				return true;
			}else{
				System.out.println("未选");
				stmt.close();
				conn.close();
				return false;
			}
		}catch(Exception e){
			System.err.println("判断选课时出现错误:"+e.getMessage());
			return false;
		}
		
	}
	
	//计算已经选择此课程的学生数量
	public int CountStudent(String class_number, String teacher_name){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM class_choice WHERE class_number='"+class_number+"' AND teacher_name='"+teacher_name+"'";
			ResultSet rs=stmt.executeQuery(sql);
			int row=0;
			rs.last();
			row=rs.getRow();
			rs.close();
			stmt.close();
			conn.close();
			return row;
		}catch(Exception e){
			System.err.println("统计出现错误:"+e.getMessage());
			return 0;
		}
	}
	
	public ResultSet ChoicedClass(StudentForm student){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM class_info WHERE class_number in (SELECT class_number FROM class_choice WHERE stu_number='"+student.getStu_number()+"')";
			ResultSet rs=stmt.executeQuery(sql);
			return rs;
		}catch(Exception e){
			System.err.println("展示已选课程出错:"+e.getMessage());
			return null;
		}
	}
	
	
}
