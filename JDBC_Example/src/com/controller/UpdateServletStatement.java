package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBCon;

/**
 * Servlet实现类UpdateServletStatement 使用的是Statement
 */
@WebServlet("/UpdateServletStatement")
// 配置Servlet
public class UpdateServletStatement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateServletStatement() {
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
		Statement st = null;
		try {
			String sql = "update user set bookCount='" + bookCount
					+ "' where id='" + id + "'";
			// String sql = "update tb_book set bookcount=? where id=?";//
			// 更新SQL语句
			st = conn.createStatement();
			int i = st.executeUpdate(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			response.sendRedirect("FindServlet"); // 重定向到FindServlet
		}

	}
}
