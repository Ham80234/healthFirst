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
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Home</title>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
  </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
  </script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossOrigin="anonymous">
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-3">
   
    </div>
    <div class="col-6">
     <div class="card shadow" style= "margin-top: 5rem;">
  		<div class="card-body" >
    		<h3>One Moment...</h3>
    		<hr>
    		
    		
    		<%
			String email=request.getParameter("email").toString();
			String Password=request.getParameter("pass").toString();
			
			
			UserLogin DBentry=new UserLogin();
			
			ResultSet flag=DBentry.Login(email, Password);
			boolean flags=DBentry.entry(email, Password);
			if(flags) 
			{
		
        	String url  = "http://localhost:8080/Health_first/Home.jsp?email="+ email+"&password="+Password;
        	session.setAttribute("url", url);
        	   %><script>window.location.href = `${url}`</script>  <%
    	 	}
			else 
			{%>
			 
			<a href="/Health_first/index.jsp">
			<div class="alert alert-danger" role="alert">
				Something happened, click me to go back</div></a>
				
				<script type="text/javascript"></script>
				
				<%}
			%>
			
  		</div>
	</div>
    </div>
    <div class="col-3">
    </div>
  </div>
</div>

</body>
</html>
</body>
</html>