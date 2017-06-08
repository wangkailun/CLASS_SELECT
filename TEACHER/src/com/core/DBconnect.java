package com.core;

import java.sql.*;

public class DBconnect {
	
	private Connection conn = null;
	
	public Connection init(){
		try{
			String url="jdbc:mysql://123.206.191.48:3306/CLASS_SELECT";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url , "root" , "root");
			System.out.println("连接成功!!!");
			return conn;
		}catch(Exception e){
			System.err.println("连接失败llll:"+e.getMessage());
			return null;
		}
		
	}
	
	public void CloseConn(){
		try{
			conn.close();
		}catch(Exception e){
			System.err.println("关闭失败:"+e.getMessage());
		}
	}
}
