<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
<%@ page import="com.goal.*" %>
<%@ page import="com.workout.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
    
<%
String email=request.getParameter("email").toString();
String pass=request.getParameter("password").toString();
String item=request.getParameter("item").toString();
String d=request.getParameter("d").toString();
String v=request.getParameter("v").toString();
String m=request.getParameter("m").toString();


UserAccount a  = new UserAccount();

a.BuildUser(email, pass);

GoalDOA b = new GoalDOA();

workoutDOA c = new workoutDOA();
c.AddNewWorkout(a.getUID(), d, m, v);


b.deleteItem(a.getUID(), item);




String url  = "http://localhost:8080/Health_first/Goals/Goals.jsp?email="+ email+"&password="+pass;
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