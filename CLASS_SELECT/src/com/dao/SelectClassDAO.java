package com.dao;
import java.sql.*;

import javax.jms.Session;

import com.core.DBconnect;

public class SelectClassDAO {
	public  boolean Select(String stu_number,String teacher_name,String class_number){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="INSERT INTO class_choice(stu_number,class_number,teacher_name) VALUES ('"+stu_number+"','"+class_number+"','"+teacher_name+"')";
			int result=0;
			result = stmt.executeUpdate(sql);
			sql="UPDATE class_info SET class_stu_num=class_stu_num+1 WHERE class_number='"+class_number+"' AND class_teacher='"+teacher_name+"'";
			int result2=stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			if(result==1 && result2==1){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			System.err.println("选课时出错:"+e.getMessage());
			return false;
		}
	}
	
	public boolean DropClass(String stu_number,String teacher_name,String class_number){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="DELETE FROM class_choice WHERE stu_number='"+stu_number+"' AND class_number='"+class_number+"' AND teacher_name='"+teacher_name+"'";
			int result=stmt.executeUpdate(sql);
			sql="UPDATE class_info SET class_stu_num=class_stu_num-1 WHERE class_number='"+class_number+"' AND class_teacher='"+teacher_name+"'";
			int result2=stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			if(result>0 && result2>0){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			System.err.println("退课出错:"+e.getMessage());
			return false;
		}
	}
}
