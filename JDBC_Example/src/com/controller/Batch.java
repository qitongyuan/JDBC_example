package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import com.util.DBCon;

public class Batch {
		/**
		 * 批量添加数据
		 * @return 所影响的行数
		 */
		public int saveBatch(){
			int row = 0 ; 									// 行数
			Connection conn = DBCon.getConnection();				// 获取数据库连接
			try {
					// 插入数据的SQL语句
				String sql = "insert into tb_student(name,sex,age)	values(?,?,?)";
				// 创建PreparedStatement
				PreparedStatement ps = conn.prepareStatement(sql); 
				Random random = new Random();			// 实例化Random
				for (int i = 0; i < 10; i++) {			// 循环添加数据
					ps.setString(1, "学生" + i); 			// 对SQL语句中的第1个参数赋值
					// 对SQL语句中的第2个参数赋值
					ps.setBoolean(2, i % 2 == 0 ? true : false); 	
					ps.setInt(3, random.nextInt(5) + 10); 	// 对SQL语句中的第3个参数赋值
					ps.addBatch();						// 添加批处理命令
				}
				int[] rows = ps.executeBatch();	// 执行批处理操作并返回计数组成的数组
				row = rows.length; 						// 对行数赋值
				ps.close();								// 关闭PreparedStatement
				conn.close();								// 关闭Connection
			} catch (Exception e) {
				e.printStackTrace();
			}
			return row; 									// 返回添加的行数
		}

}
