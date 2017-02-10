package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBCon;

/**
 * Servlet实现类UpdateServlet
 */
@WebServlet("/DeleteServlet")	//配置Servlet
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public DeleteServlet() {
		super();
	}

	/**
	 * 处理POST请求
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		// 创建Connection连接
		Connection conn = DBCon.getConnection();
		try {
			/*
			 如果是用Connection的Stament来创建则使用下面的语句
			 String sql="delete from user where id="+id;
			 Statement st=conn.createStatement();
             st.executeUpdate(sql);
			 */
			String sql = "delete from tb_book where id=?";// 更新SQL语句
			PreparedStatement ps = conn.prepareStatement(sql);// 获取PreparedStatement
			ps.setInt(1, id); // 对SQL语句中的第一个参数赋值
			ps.executeUpdate(); // 执行更新操作
			ps.close(); // 关闭PreparedStatement
			//conn.close(); // 关闭Connection
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
		}
		
		response.sendRedirect("FindServlet"); // 重定向到FindServlet
		
	}

}
