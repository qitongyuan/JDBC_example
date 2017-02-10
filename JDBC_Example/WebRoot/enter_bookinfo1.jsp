<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>添加图书信息</title>
<script type="text/javascript">
	function checkBlank(Form) {
		var v = true;
		for (i = 0; i < Form.length; i++) {
			if (Form.elements[i].value == "") {
				alert(Form.elements[i].title + "不能为空");
				Form.elements[i].focus();
				v = false;
				return false;
			}
		}
		return v;
	}
	function check_int(bookCount) {
		var type = "^[0-9]*[1-9][0-9]*$";
		var re = new RegExp(type);
		if (bookCount.match(re) == null) {
			//alert("请输入大于零的整数!");
			return false;
		}
		return true;
	}
	function check_double(price) {
		var r= /^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
	return r.test(price);
	}
	function check_new(Form){
		if( checkBlank(Form)){
			if(check_int(Form.bookCount.value)){
				if(check_double(Form.price.value)){
					return true;
				}
				else{
					alert("图书价格必须为浮点数");
					Form.price.focus();
			        return false;
				}
			}
			else{
				alert("图书数量必须为整数");
				Form.bookCount.focus();
		        return false;
			}
		}
		else{
		return false;
		}
	}
	function check(form) {	
		if (form.name.value == "") {
			alert("图书名称不能为空");
			form.name.focus();
			return false;
		}
		if (form.price.value == "") {
			alert("定价不能为空");
			return false;
		}
		if(!check_double(form.price.value)){
			alert("图书价格必须为浮点数");
			form.price.focus();
	        return false;
		}
		if (form.bookCount.value == "") {
			alert("图书数量不能为空");
			return false;
		}
		if(!check_int(form.bookCount.value)){
			alert("图书价格必须为整数");
			form.price.focus();
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
	<!--form的onsubmit属性，表示当提交表单时执行一段 JavaScript-->
	<form action="addBook_sta.jsp" method="post" onsubmit=" return check_new(this)">
		<ul>
			<li>图书名称：<input type="text" name="name" title="图书名称" /></li>
			<li>价 格：<input type="text" name="price" title="价　　格" /></li>
			<li>数 量：<input type="text" name="bookCount" title="数　　量" /></li>
			<li>作 者：<input type="text" name="author" title="作　　者" /></li>
			<li><input type="submit" value="添　加"></li>
		</ul>
	</form>
</body>
</html>