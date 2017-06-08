package com.dao;

import com.core.DBconnect;
import java.sql.*;

public class ShowClassDao {
	
	
	public ResultSet ShowClass(String teacher_name){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM class_info WHERE class_teacher='"+teacher_name+"'";
			ResultSet rs=stmt.executeQuery(sql);
			return rs;
		}catch(Exception e){
			System.err.println("出现错误:"+e.getMessage());
			return null;
		}
	}
	
	
	public boolean DeleteClass(String class_number,String class_teacher ){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql2="DELETE FROM class_choice WHERE class_number='"+class_number+"'";
			String sql="DELETE FROM class_info WHERE class_number='"+class_number+"' AND class_teacher='"+class_teacher+"'";
			int result1=stmt.executeUpdate(sql2);
			int result=stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			if(result>0){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			System.err.println("删除出错:"+e.getMessage());
			return false;
		}
	}
}
