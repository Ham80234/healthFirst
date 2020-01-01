<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
<%@ page import="com.goal.*" %>
<%@ page import="com.foodlists.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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
    <title>User index</title>
</head>
<% 
String email=request.getParameter("email").toString();
String pass=request.getParameter("password").toString();
//session.setAttribute("SES_NAME",email);
System.out.println(email);
System.out.println(pass);
UserAccount a = new UserAccount();
a.BuildUser(email, pass);

FooditemDOA b = new FooditemDOA();

GoalDOA c = new GoalDOA();
List<Goal> results = c.getGoal(a.getUID());

List<Fooditem> items = b.getfoodIDs(a.getUID());

session.setAttribute("foodItems", items);
session.setAttribute("GoalItem", results);
session.setAttribute("email", email);
session.setAttribute("pass", pass);




session.setAttribute("SES_NAME", a.getFName());
session.setAttribute("SES_WEIGHT", a.getWeight());

String url  = "?email="+ email+"&password="+pass;
session.setAttribute("url", url);
%>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="#">HealthFirst</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="./Home.jsp${url}">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./FoodSearch/SearchFood.jsp${url}">Food Search</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./Lists/lists.jsp${url}">Food Lists</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./Workout/Workout.jsp${url}">Workout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./Goals/Goals.jsp${url}">Goals</a>
                </li>
                <li class="nav-item" style="margin-left: 800px;">
                    <a class="nav-link" href="./index.jsp">Sign out</a>
                </li>
            </ul>


        </div>
    </nav>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Change Weight</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="/Health_first/WeightCathcer.jsp" method="get">
        <div class="form-group">
			    <label for="exampleInputEmail1">New Weight:</label>
			    <input name ="weight" type="number" class="form-control"  placeholder="Weight">
			    <input name ="email" type="email" class=" invisible form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${email}">
			    <input name = "password"  class=" invisible form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${pass}">
			    <button type="submit" class="btn btn-primary">Submit</button>
			  </div>
        </form>
      </div>
    </div>
  </div>
</div>


    <div class="container">
            <div class="row">
                <div class="col">
                    <div class="card" style="margin-top: 50px;">
                        <div class="card-body shadow-sm">
                            <h5 class="card-title">Welcome Back ${SES_NAME}! </h5>
                            <h6 class="card-subtitle mb-2 text-muted">Here is an overview of your account
                            </h6>
                            <p>Weight: ${SES_WEIGHT} lbs</p>
                            <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModal">
								  Update Weight
						    </button>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col">
                    <div class="card shadow-sm" style="margin-top: 50px;">
                        <div class="card-body shadow-sm">
                            <h5 class="card-title">Goals</h5>
                            <c:forEach items="${GoalItem}" var="product">			 	
									 	<div class="card">
										  <div class="card-body">
										    <h4>Goal:  ${product.desc}</h4>
										    <hr>
										    <h6>Target: ${product.value} ${product.messure}</h6>
										   
										  </div>
										</div>
								</c:forEach>
                        </div>
                        
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="margin-top: 50px;">
                        <div class="card-body shadow-sm">
                            <h5 class="card-title">Tracked Foods</h5>
								<c:forEach items="${foodItems}" var="product">
									 	
									 	<div class="card">
										  <div class="card-body">
										    <h4>${product.foodName}</h4>
										    <hr>
										    <h6>${product.foodGroup}</h6>
										   
										  </div>
										</div>
								 
								</c:forEach>
                        </div>
                    </div>
                </div>


</body>

</html>
