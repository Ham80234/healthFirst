<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
<%@ page import="com.FoodSearch.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<%
String email=request.getParameter("e").toString();
String pass=request.getParameter("p").toString();
String term =request.getParameter("term").toString();
String fat =request.getParameter("f").toString();

String pr =request.getParameter("pro").toString();
System.out.println(pr);
String c =request.getParameter("c").toString();
String ch =request.getParameter("ch").toString();
String sf =request.getParameter("sf").toString();

UserAccount a =  new UserAccount();

a.BuildUser(email, pass);

foodDOA b =  new foodDOA();
List<Food>  foods = b.getfood(term, fat, pr, c, ch, sf);

System.out.println("items: "  +foods.size());

session.setAttribute("foodItems", foods);

String url  = "?email="+ email+"&password="+pass;
session.setAttribute("url", url);

String Specurl  = "http://localhost:8080/Health_first/FoodSearch/FoodCatcher.jsp?e="+ email+"&p="+pass+"&term=";
session.setAttribute("Specurl", Specurl);
%>
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
                    <a class="nav-link" href="./SearchFood.jsp${url}">Food Search</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../Lists/lists.jsp${url}">Food Lists</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../Workout/Workout.jsp${url}">Workout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../Workout/Workout.jsp${url}">Goals</a>
                </li>
                <li class="nav-item" style="margin-left: 800px;">
                    <a class="nav-link" href="../index.jsp">Sign out</a>
                </li>
            </ul>


        </div>
    </nav>

<div class="row">
    <div class="col-9">
        <div class="card shadow-sm" style="margin-top: 50px;margin-left: 30%;">
            <div class="card-body">
                <h5 class="card-title">Results</h5>
                <c:forEach items="${foodItems}" var="product">
									 	
					
										
										
										<div class="accordion" id="accordionExample">
										
										  <div class="card">
										    <div class="card-header" id="headingOne">
										      <h2 class="mb-0">
										      <div class="row">
										      <div class="col-10">
										        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${product.food_id}" aria-expanded="true" aria-controls="collapseOne">
										          ${product.name}
										        </button>
										        <h6>${product.group}</h6>
										        </div>
										        <div class="col-2">
										        <button type="button" onclick="window.location.href = `${Specurl}${product.food_id}`" class="btn btn-outline-dark">Add</button>
										        </div>
										        </div>
										      </h2>
										    </div>
										    
										    <div id="collapse${product.food_id}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
										      <div class="card-body">
										       <table class="table">
 												
												  <thead>
												    <tr>
												     
												      <th scope="col">Nutrient</th>
												      <th scope="col">Amount</th>
												      <th scope="col">Measurement</th>
												      
												 
												    </tr>
												  </thead>
												  <tbody>
												    <tr>
												      <th scope="row">Protein</th>
												      <td>${product.protein}</td>
												      <td>gram</td>
												    </tr>
												     <tr>
												      <th scope="row">Fat</th>
												      <td>${product.fat}</td>
												       <td>gram</td>
												    </tr>
												     <tr>
												      <th scope="row">Carbohydrates</th>
												      <td>${product.carb}</td>
												       <td>gram</td>
												    </tr>
												     <tr>
												      <th scope="row">Calories</th>
												      <td>${product.calories}</td>
												      <td>N/A</td>
												    </tr>
												  
												    <tr>
												      <th scope="row">Sucrose</th>
												      <td>${product.sucrose}</td>
												      <td>gram</td>
												    </tr>
												    <tr>
												      <th scope="row">Glucose</th>
												      <td>${product.glucose}</td>
												      <td>gram</td>
												    </tr>
												    <tr>
												      <th scope="row">Frutose</th>
												      <td>${product.frutose}</td>
												      <td>gram</td>
												    </tr>
												    <tr>
												      <th scope="row">Water</th>
												      <td>${product.water}</td>
												      <td>gram</td>
												    </tr>
												    <tr>
												      <th scope="row">Caffeine</th>
												      <td>${product.caffeine}</td>
												      <td>milligram</td>
												    </tr>
												    <tr>
												      <th scope="row">Fiber</th>
												      <td>${product.fiber}</td>
												      <td>gram</td>
												    </tr>
												     <tr>
												      <th scope="row">Calcium</th>
												      <td>${product.calcium}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Iron</th>
												      <td>${product.iron}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Magnesium</th>
												      <td>${product.magnesium}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Potassium</th>
												      <td>${product.potassium}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Sodium</th>
												      <td>${product.sodium}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Zinc</th>
												      <td>${product.zinc}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Copper</th>
												      <td>${product.copper}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Floride</th>
												      <td>${product.floride}</td>
												      <td>microgram</td>
												    </tr>
												    <tr>
												      <th scope="row">Manganese</th>
												      <td>${product.manganese}</td>
												      <td>milligram</td>
												    </tr>
												    <tr>
												      <th scope="row">Selenium</th>
												      <td>${product.selenium}</td>
												      <td>microgram</td>
												    </tr>
												    <tr>
												      <th scope="row">Vitamin A</th>
												      <td>${product.vita}</td>
												      <td>IU</td>
												    </tr>
												    <tr>
												      <th scope="row">Vitamin E</th>
												      <td>${product.vite}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Vitamin D</th>
												      <td>${product.vitd}</td>
												      <td>micrograms</td>
												    </tr>
												     <tr>
												      <th scope="row">Vitamin C</th>
												      <td>${product.vitc}</td>
												      <td>milligram</td>
												    </tr>
												    
												    
 													<tr>
												      <th scope="row">Vitamin B1</th>
												      <td>${product.vitb1}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Vitamin B2</th>
												      <td>${product.vitb1}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Vitamin B3</th>
												      <td>${product.vitb1}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Vitamin B5</th>
												      <td>${product.vitb1}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Vitamin B9</th>
												      <td>${product.vitb1}</td>
												      <td>milligram</td>
												    </tr>
												     <tr>
												      <th scope="row">Vitamin B12</th>
												      <td>${product.vitb12}</td>
												      <td>milligram</td>
												    </tr>
												    <tr>
												      <th scope="row">Choleterol</th>
												      <td>${product.choleterol}</td>
												      <td>milligram</td>
												    </tr>
												    <tr>
												      <th scope="row">Saturated Fats B12</th>
												      <td>${product.satfat}</td>
												      <td>milligram</td>
												    </tr>
												   
												    
												    
												    
												    
												    
												
												    
												    
												  </tbody>
												</table>
										      </div>
										    </div>
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
    