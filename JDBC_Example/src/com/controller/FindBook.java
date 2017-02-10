package com.controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.BookBean;
import com.util.DBCon;

public class FindBook {
	/**
	 * 通过存储过程查询数据
	 * @return  List<Book> 
	 */
	public List<BookBean> findAll(){
		List<BookBean> list = new ArrayList<>();				// 实例化List对象
		Connection conn = DBCon.getConnection();						// 创建数据库连接
		try {
			//调用存储过程	
			CallableStatement cs = conn.prepareCall("{call findAllBook()}");
			ResultSet rs = cs.executeQuery();			// 执行查询操作，并获取结果集
			while(rs.next()){						// 判断光标向后移动，并判断是否有效
				BookBean book = new BookBean();						// 实例化Book对象
				book.setId(rs.getInt("id"));					// 对id属性赋值
				book.setName(rs.getString("name"));			// 对name属性赋值
				book.setPrice(rs.getDouble("price"));			// 对price属性赋值
				book.setBookCount(rs.getInt("bookCount"));	// 对bookCount属性赋值
				book.setAuthor(rs.getString("author"));		// 对author属性赋值
				list.add(book); 							// 将图书对象添加到集合中
			}
			rs.close();
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
		return list; 											// 返回list
	}

}
