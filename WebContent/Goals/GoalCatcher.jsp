<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
<%@ page import="com.goal.*" %>
<%@ page import="com.foodlists.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
 
 
<%
String email=request.getParameter("e").toString();
String pass=request.getParameter("p").toString();
String val=request.getParameter("val").toString();
String meas=request.getParameter("measure").toString();
String desc=request.getParameter("desc").toString();

UserAccount a =  new UserAccount();
a.BuildUser(email, pass);

GoalDOA b = new GoalDOA();
boolean flag = b.AddNewGoal(a.getUID(), desc, meas, val);

String url  = "http://localhost:8080/Health_first/Goals/Goals.jsp?email="+ email+"&password="+pass;
session.setAttribute("url", url);

if(flag){
	%><script>window.location.href = `${url}`</script> <% 
}else{
		
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>