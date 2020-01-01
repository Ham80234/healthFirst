<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
<%@ page import="com.FoodSearch.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("e").toString();
String pass=request.getParameter("p").toString();
String term =request.getParameter("term").toString();


int FoodID = Integer.parseInt(term);			
UserAccount a =  new UserAccount();

a.BuildUser(email, pass);

boolean flag = a.AddItem(a.getUID(), FoodID);
String url  = "http://localhost:8080/Health_first/Home.jsp?email="+ email+"&password="+pass;
session.setAttribute("url", url);

if(flag){
	%><script>window.location.href = `${url}`</script> <%
}else{
	
}
%>

</body>
</html>