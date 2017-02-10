package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {
	public DBCon() {
		// TODO Auto-generated constructor stub
	}

	public static Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/db_database09";
		String name = "root";
		String password = "root";
		Connection conn = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");// 加载数据库驱动，注册到驱动管理器
			conn = DriverManager.getConnection(url, name, password);
			//conn.setAutoCommit(false);//设置为不自动提交
			return conn;
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}
}
