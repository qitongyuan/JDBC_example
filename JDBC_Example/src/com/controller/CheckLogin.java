package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBCon;

@WebServlet("/checklogin")
public class CheckLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String forward = "";
		try {
			conn = DBCon.getConnection();
			ps = conn
					.prepareStatement("select count(*) from user where userName=? and passWord=?");
			req.setCharacterEncoding("utf-8");
			String userName = req.getParameter("userName");
			String passWord = req.getParameter("passWord");
			ps.setString(1, userName);
			ps.setString(2, passWord);
			rs = ps.executeQuery();


			if (!rs.first()) { // Moves the cursor to the first row in this
				rs.close();
				ps.close();
				conn.close();
				forward = "error.jsp";
			}
			if (0 == rs.getInt(1)) {
				rs.close();
				ps.close();
				conn.close();
				forward = "error.jsp";
			} else {
				rs.close();
				ps.close();
				conn.close();
				forward = "success.jsp";
				req.setAttribute("userName", userName);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
			try {
				if (ps != null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
			RequestDispatcher rd = req.getRequestDispatcher(forward);
			rd.forward(req, resp);
		}
	}
}
