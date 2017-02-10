<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>测试数据库连接</title>
</head>
<body>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/db_database09";
			String username = "root";
			String password = "root";
			Connection conn = DriverManager.getConnection(url, username,password);
			//Connection conn =DriverManager. getConnection ("jdbc:mysql://localhost:3306/db_database09?user=root&password=root");
			if (conn != null) {
				out.println("数据库连接成功");
				conn.close();
			} else {
				out.println("数据库连接失败");
			}
		} catch (ClassNotFoundException e) {
			out.println(e.getMessage());
		} catch (SQLException e) {
			out.println(e.getMessage());
		} 
	%>
</body>
</html>
