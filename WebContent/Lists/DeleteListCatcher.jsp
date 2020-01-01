<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
<%@ page import="com.foodlists.*" %>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
    
<%
String email=request.getParameter("email").toString();
String pass=request.getParameter("password").toString();

String item=request.getParameter("item").toString();

UserAccount a  = new UserAccount();

a.BuildUser(email, pass);

FooditemDOA b = new FooditemDOA();

b.deleteItem(a.getUID(), item);


String url  = "http://localhost:8080/Health_first/Home.jsp?email="+ email+"&password="+pass;
session.setAttribute("url", url);
%>
<!DOCTYPE html>
<script>window.location.href = `${url}`</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>