package com.sun.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	
	//static String sql="select * from register where uname=? and psw=?";
	
	public static boolean validate(String uname,String psw){  
		 
	
	try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","pawar");
	PreparedStatement ps=con.prepareStatement("select * from regis1 where uname=? and psw=?");  
			ps.setString(1,uname);  
			ps.setString(2,psw);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				//rs.getString(1);
				//rs.getString(2);
				//status = rs.next();
				return true;
			
				
				
			}
			
			ps.close();
		con.close();
	}catch(Exception e) {System.out.println(e);}
	
	
	return false;

}
	
}
