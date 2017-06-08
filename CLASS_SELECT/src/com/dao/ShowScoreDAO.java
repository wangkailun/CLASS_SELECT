package com.dao;

import java.sql.*;
import com.core.DBconnect;

public class ShowScoreDAO {
	
	public ResultSet GetScore(String stu_number){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM class_choice WHERE stu_number='"+stu_number+"'";
			ResultSet rs=stmt.executeQuery(sql);
			return rs;
		}catch(Exception e){
			System.err.println("出现错误:"+e.getMessage());
			return null;
		}
	}
	
	public String GetClassName(String class_number,String teacher_name){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT class_name FROM class_info WHERE class_number='"+class_number+"' AND class_teacher='"+teacher_name+"'";
			ResultSet rs=stmt.executeQuery(sql);
			rs.next();
			String class_name=rs.getString("class_name");
			return class_name;
		}catch(Exception e){
			System.err.println("出现错误:"+e.getMessage());
			return null;
		}
	}

}
