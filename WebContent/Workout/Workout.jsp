<%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
<%@ page import="com.workout.*" %>
<%@ page import="com.FoodSearch.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<%
String email=request.getParameter("email").toString();
String pass=request.getParameter("password").toString();

UserAccount a =  new UserAccount();
a.BuildUser(email, pass);

workoutDOA b = new workoutDOA();
List<workout> results = b.getWorkout(a.getUID());


session.setAttribute("WorkoutList", results);
String url  = "?email="+ email+"&password="+pass;
session.setAttribute("url", url);

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
    <title>User index</title>
</head>

<body>
 
 
 
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Workout</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/Health_first/Workout/WorkoutCatcher.jsp">
      <div class="modal-body">
       
        <label for="exampleInputEmail1">Workout area </label>
    		<input name="desc" class="form-control" id="exampleInputEmail1" placeholder="ex. cardio">
    
		     <label for="exampleInputEmail1">How Many/ How long?</label>
		    <input  name="val"type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ex. 30">
		    <hr>
		    <select name = "measure" class="form-control">
		  <option>Choose one</option>
		  <option>Reps</option>
		  <option>Miles</option>
		  <option>Sets</option>
		  <option>min</option>
		  <option>hours</option>
		   <input name="e" type="text" class="invisible form-control" id="SearchTerm"
           aria-describedby="emailHelp" placeholder="Search" value = "${email}">
           <input name="p" type="text" class=" invisible form-control" id="SearchTerm"
           aria-describedby="emailHelp" placeholder="Search" value ="${pass}">
           <button type="submit" class="btn btn-primary">Submit</button>                    
		  
		  </form>
		</select>
      </div>
      
    </div>
  </div>
</div>
 
 
 
 
 
 
 
 
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
                <li class="nav-item">
                    <a class="nav-link" href="../Lists/lists.jsp${url}">Food Lists</a>
                </li>
                <li class="nav-item active" >
                    <a class="nav-link" href="">Workout</a>
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



    <div class="container">
        <div class="row">
            <div class="col">
                <div class="card" style="margin-top: 50px;">
                    <div class="card-body shadow-sm">
                        <h5 class="card-title ">Stats:</h5>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-3" style="margin-top: 50px;">
                <div class="card">
                    <div class="card-body shadow-sm" style="height: 80vh;">
                        <ul>
                           
                           <button type="button" style="height: 100px; width: 100px; margin-top: 30px" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal">
									  Add
						</button>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card" style="margin-top: 50px;">
                    <div class="card-body shadow-sm">
                        <h5 class="card-title">Previous Workout:</h5>
							<c:forEach items="${WorkoutList}" var="product">
									 	
									 	<div class="card">
										  <div class="card-body">
										
										    	<h6>type: ${product.workout_type}</h6>
										    	<h6>length: ${product.workout_length} ${product.workout_measure}</h6>
										    	
										    	<button onclick = "window.location.href='http://localhost:8080/Health_first/Workout/DeleteWorkoutCatcher.jsp${url}&item=${product.workout_id}'" type="button" class= "btn btn-outline-danger">Delete</button>
										  </div>
										</div>
								 
								</c:forEach>
                    </div>
                </div>
            </div>

        </div>
        </div>
    </div>
    </div>



</body>

</html>
