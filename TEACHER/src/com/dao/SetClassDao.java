package com.dao;

import java.sql.*;
import com.actionForm.classForm;
import com.core.DBconnect;


public class SetClassDao {
	
	public boolean SetClass(classForm Class){
		Connection conn;
		DBconnect db=new DBconnect();
		conn=db.init();
		try{
			Statement stmt=conn.createStatement();
			String sql="INSERT INTO class_info(class_teacher,class_number,class_name,class_credit,class_end,class_start,class_address,class_stu_num,class_stu_limit,class_date,class_grade,class_major) VALUES('"+Class.getClass_teacher()+"','"+Class.getClass_number()+"','"+Class.getClass_name()+"','"+Class.getClass_credit()+"','"+Class.getClass_end()+"','"+Class.getClass_start()+"','"+Class.getClass_address()+"','"+Class.getClass_stu_num()+"','"+Class.getClass_stu_limit()+"','"+Class.getClass_date()+"','"+Class.getClass_grade()+"','"+Class.getClass_major()+"')";
			int result=stmt.executeUpdate(sql);
			if(result==1){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
				System.err.println("插入课程出现错误:"+e.getMessage());
				return false;
		}
	}
	

}
