package com.dao;

import java.sql.*;
import com.core.DBconnect;

public class ScoreClassDAO {
	public ResultSet ShowScore(String class_number,String class_teacher){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM class_choice WHERE class_number='"+class_number+"' AND teacher_name='"+class_teacher+"'";
			ResultSet rs=stmt.executeQuery(sql);
			return rs;
		}catch(Exception e){
			System.err.println("查询出现错误:"+e.getMessage());
			return null;
		}
	}
}
