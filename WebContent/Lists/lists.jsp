<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
<%@ page import="com.foodlists.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>

<html lang="en">
<%
String email=request.getParameter("email").toString();
String pass=request.getParameter("password").toString();

UserAccount a  = new UserAccount();

a.BuildUser(email, pass);

FooditemDOA b = new FooditemDOA();

List<Fooditem> items = b.getfoodIDs(a.getUID());

session.setAttribute("foodItems", items);



String url  = "?email="+ email+"&password="+pass;
session.setAttribute("url", url);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
        integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="style.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
        integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous">
    </script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
        integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous">
    </script>

    <title>Document</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="#">HealthFirst</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
             			<li class="nav-item">
                            <a class="nav-link" href="../Home.jsp${url}">Home</a>
                        </li>
                    	<li class="nav-item">
                            <a class="nav-link" href="../FoodSearch/SearchFood.jsp${url}">Food Search</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="">Food Lists</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../Workout/Workout.jsp${url}">Workout</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../Goals/Goals.jsp${url}">Goals</a>
                        </li>
                        <li class="nav-item" style="margin-left: 800px;">
                            <a class="nav-link" href="../index.jsp">Sign out</a>
                        </li>
            </ul>

           
            
        </div>
    </nav>
    
    <!--AddModel -->

     <!--Body-->

     <div class="container">
            <div class="row">
                <div class="col-3" style="margin-top: 50px;">
                    <div class="card shadow-sm">
                        <div class="card-body" style="height: 80vh;">
                            <ul>
                                <button onclick="window.location.href = `http://localhost:8080/Health_first/FoodSearch/SearchFood.jsp${url}`" type="button" style="height: 100px; width: 100px; margin-top: 30px"
                                    class="btn btn-outline-primary">Add</button>
                        
                               
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-9" style="margin-top: 50px;">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h2>List:</h2>
                            

								<c:forEach items="${foodItems}" var="product">
									 	
									 	<div class="card">
										  <div class="card-body">
										    <h4>${product.foodName}</h4>
										    <hr>
										    <h6>${product.foodGroup}</h6>
										   <button onclick = "window.location.href='http://localhost:8080/Health_first/Lists/DeleteListCatcher.jsp${url}&item=${product.food_id}'" type="button" class= "btn btn-outline-danger">Delete</button>
										  </div>
										</div>
								 
								</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</body>

</html>