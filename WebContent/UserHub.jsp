<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
<%@ page import="java.io.PrintWriter" %>
<% user current =  new user();
   current.setCurrentWeight(100);
   current.setFirstName("Tim");
   current.setLastName("smith");
   String name =  current.getFirstName();
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
    <!--Nav Bar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="#">Health First</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

    </nav>

    <!--Advanced Search-->
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Advanced Search</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    TODO add form
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <!--SideBar-->
    <div class="row" style="height: 100vh">
        <div class="col-3 bg-light">
            <div class="nav flex-column nav-pills bg-light border-right" id="v-pills-tab" role="tablist"
                aria-orientation="vertical">
                <div class="card">
                    <div class="row">
                        <div class="card-body d-inline">
                            <div class="col-2 d-inline">
                                <img class="rounded-circle border-right border border-dark"
                                    src="https://i0.wp.com/acaweb.org/wp-content/uploads/2018/12/profile-placeholder.png?fit=300%2C300&ssl=1"
                                    alt="" srcset="" style="width: 40px; height: 40px;">
                            </div>
                            <div class="col-11 d-inline">
                                Hi 	                       </div>
                        </div>
                    </div>

                </div>
                <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
                    aria-controls="v-pills-home" aria-selected="true">Home</a>
                <a class="nav-link" id="v-pills-goals-tab" data-toggle="pill" href="#v-pills-goals" role="tab"
                    aria-controls="v-pills-goals" aria-selected="false">Goals</a>
                <a class="nav-link" id="v-pills-lists-tab" data-toggle="pill" href="#v-pills-lists" role="tab"
                    aria-controls="v-pills-lists" aria-selected="false">Lists</a>
                <a class="nav-link" id="v-pills-food_lists-tab" data-toggle="pill" href="#v-pills-food_lists" role="tab"
                    aria-controls="v-pills-food_lists" aria-selected="false">Foodlists</a>
                <a class="nav-link" id="v-pills-Recipes-tab" data-toggle="pill" href="#v-pills-Recipes" role="tab"
                    aria-controls="v-pills-Recipes" aria-selected="false">Recipes</a>
                <a class="nav-link" id="v-pills-Workout-tab" data-toggle="pill" href="#v-pills-Workout" role="tab"
                    aria-controls="v-pills-Workout" aria-selected="false">Workout</a>

                <a class="nav-link fixed-bottom" id="v-pills-signout-tab" data-toggle="pill" href="#v-pills-signout"
                    role="tab" aria-controls="v-pills-signout" aria-selected="false">Sign-out</a>

            </div>
        </div>
        <div class="col-9">
            <div class="tab-content" id="v-pills-tabContent">
                <!--Home-->
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel"
                    aria-labelledby="v-pills-home-tab">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                            
                                <div class="card" style="margin-top: 50px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Welcome Back! </h5>
                                        <h6 class="card-subtitle mb-2 text-muted">Here is an overview of your account
                                        </h6>
                                        <p>Weight: ${Weight}lbs</p>
                                        <a href="#" class="card-link">Update Weight</a>
                                    </div>
                                </div>
                            </div>
  							
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="card" style="margin-top: 50px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Goals</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card" style="margin-top: 50px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Tracked Foods</h5>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--Goals-->
                <div class="tab-pane fade" id="v-pills-goals" role="tabpanel" aria-labelledby="v-pills-goals-tab">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="card" style="margin-top: 50px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Progress</h5>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="card" style="margin-top: 50px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Current Goals</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card" style="margin-top: 50px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Past Goals</h5>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--Lists-->
                <div class="tab-pane fade" id="v-pills-lists" role="tabpanel" aria-labelledby="v-pills-lists-tab">
                    <div class="container">
                        <div class="row">
                            <div class="col-3" style="margin-top: 50px;">
                                <div class="card">
                                    <div class="card-body" style="height: 80vh;">
                                        <ul>
                                            <button type="button" style="height: 100px; width: 100px; margin-top: 30px"
                                                class="btn btn-outline-primary">Add</button>
                                            <button type="button" style="height: 100px; width: 100px; margin-top: 30px"
                                                class="btn btn-outline-primary">Edit</button>
                                            <button type="button" style="height: 100px; width: 100px; margin-top: 30px"
                                                class="btn btn-outline-danger">Delete</button>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-9" style="margin-top: 50px;">
                                <div class="card">
                                    <div class="card-body">
                                        <h2>Lists:</h2>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Food lookup-->
                <div class="tab-pane fade" id="v-pills-food_lists" role="tabpanel"
                    aria-labelledby="v-pills-food_lists-tab">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="card" style="margin-top: 50px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Search: </h5>

                                        <div class="form-group">
                                            <label for="SearchTerm">Search</label>
                                            <input type="text" class="form-control" id="SearchTerm"
                                                aria-describedby="emailHelp" placeholder="Search">
                                            <button type="button" class="btn btn-outline-dark" data-toggle="modal"
                                                data-target="#exampleModal" style="margin-top: 10px;">
                                                Advanced search
                                            </button>
                                        </div>

                                        <button type="submit" class="btn btn-primary">search</button>


                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="card" style="margin-top: 50px">
                                    <div class="card-body">
                                        <h5 class="card-title">Results</h5>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--Recipes-->
                <div class="tab-pane fade" id="v-pills-Recipes" role="tabpanel" aria-labelledby="v-pills-Recipes-tab">
                    <div class="container" style="margin-top: 50px;">
                        <div class="row" style="margin-top: 50px;">
                            <div class="col-sm">
                                <div class="card" style="width: 18rem;">
                                    <img src="http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg"
                                        class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recipe</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm">
                                <div class="card" style="width: 18rem;">
                                    <img src="http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg"
                                        class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recipe</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm">
                                <div class="card" style="width: 18rem;">
                                    <img src="http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg"
                                        class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recipe</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 50px;">
                            <div class="col-sm">
                                <div class="card" style="width: 18rem;">
                                    <img src="http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg"
                                        class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recipe</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm">
                                <div class="card" style="width: 18rem;">
                                    <img src="http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg"
                                        class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recipe</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm">
                                <div class="card" style="width: 18rem;">
                                    <img src="http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg"
                                        class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recipe</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 50px;">
                            <div class="col-sm">
                                <div class="card" style="width: 18rem;">
                                    <img src="http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg"
                                        class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recipe</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm">
                                <div class="card" style="width: 18rem;">
                                    <img src="http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg"
                                        class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recipe</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm">
                                <div class="card" style="width: 18rem;">
                                    <img src="http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg"
                                        class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recipe</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Workout-->
                <div class="tab-pane fade" id="v-pills-Workout" role="tabpanel" aria-labelledby="v-pills-Workout-tab">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="card" style="margin-top: 50px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Stats:</h5>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="card" style="margin-top: 50px;">
                                    <div class="card-body">
                                        <h5 class="card-title">saved workout:</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card" style="margin-top: 50px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Saved Workouts:</h5>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

</body>

</html>