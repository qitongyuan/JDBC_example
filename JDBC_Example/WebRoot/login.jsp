<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>通过连接数据库登录</title>
  </head>
  
  <body>
  <form action="checklogin" method="post">
      用户名 <input type="text" name="userName"> <br>
     密&nbsp;码  <input type="text" name="passWord"> <br>
  <input type="submit" value="登录"> &nbsp;&nbsp;  <input type="reset" value="重置"> 
  </form>
  </body>
</html>
