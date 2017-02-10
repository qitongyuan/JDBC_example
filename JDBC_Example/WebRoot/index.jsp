<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>添加图书信息</title>
<script type="text/javascript">
	function check(form) {
		if (form.name.value == "") {
			alert("图书名称不能为空");
			return false;
		}
		if (form.price.value == "") {
			alert("定价不能为空");
			return false;
		}
		if (form.author.value == "") {
			alert("作者不能为空");
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
ul {
	list-style: none; /*设置不显示项目符号*/
	margin: 0px; /*设置外边距*/
	padding: 5px; /*设置内边距*/
}

li {
	padding: 5px; /*设置内边距*/
}
</style>
</head>
<body>
JDBC与MySQl操作演示
<hr>
<ol>
	<li><a href="test_connection.jsp">测试数据库连接</a><br></li>
	<li><a href="enter_bookinfo.jsp">使用preaparedStatement来添加图书信息</a><br></li>
	<li><a href="enter_bookinfo1.jsp">使用Statement来添加图书信息</a><br></li>
	<li><a href="FindServlet">查看图书列表</a><br></li>
	<li><a href="FindUpdateServlet">使用preaparedStatement修改图书信息</a><br></li>
	<li><a href="FindUpdateServletSta">使用Statement修改图书信息</a><br></li>
	<li><a href="FindDeleteServlet">删除图书</a><br></li>
	<li><a href="testBatchOperation.jsp">测试批处理</a><br></li>
	<li><a href="FindbyProcedure.jsp">使用存储过程查询所有图书</a><br></li>
	<li><a href="login.jsp">用户登录</a><br></li>
	</ol>
</body>
</html>