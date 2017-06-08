package com.dao;

import com.core.DBconnect;
import java.sql.*;

public class LoginDao {
	public boolean login(String manager_number,String manager_password){
		DBconnect db = new DBconnect();
		Connection conn;
		conn = db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="SELECT * FROM managers_info WHERE manager_number= '"+manager_number+"' AND manager_password= '"+manager_password+"'";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				rs.close();
				stmt.close();
				conn.close();
				return true;
			}else{
				rs.close();
				stmt.close();
				conn.close();
				return false;
			}
		}catch(Exception e){
		System.err.println("登录错误了:"+e.getMessage());
		return false;
		}
	}
	
}
