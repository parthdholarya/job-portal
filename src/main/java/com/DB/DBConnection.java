package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static Connection conn;
	
	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal", "root", "Parth@9268");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
}
