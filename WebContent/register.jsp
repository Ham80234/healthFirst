<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
<%
String email=request.getParameter("email");
String Password=request.getParameter("pass");
String First=request.getParameter("fName");
String Last=request.getParameter("LName");
String CurrentW = request.getParameter("CurrentWeight");
String feets =request.getParameter("feet");
String inch = request.getParameter("inches");
System.out.println(email+Last+First+Password+CurrentW+feets+inch);

String url  = "http://localhost:8080/Health_first/Home.jsp?email="+ email+"&password="+Password;

session.setAttribute("url", url);
if (email!= null&&!email.trim().equals("")){
UserLogin DBentry=new UserLogin();
boolean flag=DBentry.Register(email, Password, First, Last, CurrentW, feets, inch);
if(flag) {%><script>window.location.href = `${url}`;</script><%
	}
else { %><script type="text/javascript">window.location = 'http://localhost:8080/Health_first/index.jsp'; alert('email already in use')</script><% }
}

%>


</body>
</html>