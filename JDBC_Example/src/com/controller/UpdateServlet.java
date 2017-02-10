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
@WebServlet("/UpdateServlet")	//配置Servlet
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public UpdateServlet() {
		super();
	}

	/**
	 * 处理POST请求
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		int bookCount = Integer.valueOf(request.getParameter("bookCount"));
		Connection conn = DBCon.getConnection();
		try {
			
			String sql = "update tb_book set bookcount=? where id=?";// 更新SQL语句
			PreparedStatement ps = conn.prepareStatement(sql);// 获取PreparedStatement
			ps.setInt(1, bookCount); // 对SQL语句中的第一个参数赋值
			ps.setInt(2, id); // 对SQL语句中的第二个参数赋值
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
