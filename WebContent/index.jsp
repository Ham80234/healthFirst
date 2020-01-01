<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import="java.io.*" %> 
<%@ page import="com.user.*" %>
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
<style>
  .Titlecard:hover{
    -moz-transform: translate(0px, -21px);
    -webkit-transform: translate(0px, -21px);
    -o-transform: translate(0px, -21px);
    -ms-transform: translate(0px, -21px);
    transform: translate(0px, -21px);
    transition-duration: .35s;
    border-style: solid;
    border-color: rgb(0, 162, 255);
  }
</style>
<body>
  <!--Nav Bar-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="#">Health First</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#LoginModel">
            Login
          </button>
        </li>
        <li class="nav-item">
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#RegisterModal">
            Register
          </button>
        </li>
      </ul>
     
    </div>
  </nav>
  <!-- Login Modal -->
  <div class="modal fade" id="LoginModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Login</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="/Health_first/loginCatcher.jsp" method='get'>
            <div class="form-group">
              <label for="exampleInputEmail1">Email address</label>
              <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                placeholder="Enter email">
              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Password</label>
              <input name="pass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
            <div class="form-group form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">Remember me </label>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
        </div>
        <div class="modal-footer">
          HeathFirst © 2019
        </div>
      </div>
    </div>
  </div>
  
  
  
  <!-- Register Modal -->
  <div class="modal fade bd-example-modal-xl" id="RegisterModal" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Register</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-8">
              <form action="/Health_first/register.jsp" method='get'>
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input name='email' type="email" class="form-control" id="Email" aria-describedby="emailHelp"
                    placeholder="Enter email">
                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                    else.</small>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input name="pass" type="password" class="form-control" id="password" placeholder="Password">
                  <label for="exampleInputPassword1">Confirm Password</label>
                  <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
                </div>
                <div class="form-group">
                  <label for="fname">First Name</label>
                  <input name ="fName" id='FirstName' type="Fname" class="form-control" placeholder="First Name">
                  <label for="exampleInputPassword1">Last Name</label>
                  <input name ="LName"class="form-control" id="LastName" placeholder="Last Name">
                </div>

                <div class="form-group">
                  <label for="Weight">Weight</label>
                  <input name ="CurrentWeight" type="number" class="form-control" id="Weight" placeholder="in lbs">
                  <label for="exampleInputPassword1">Height</label>
                  <div class="form-group col-md-8">
                    <label for="inputState">Feet</label>
                    <select name ="feet" id="inputState" class="form-control">
                      <option selected>Choose...</option>
                      <option>4</option>
                      <option>5</option>
                      <option>6</option>
                      <option>7</option>
                    </select>
                    <label for="inputState">Inches</label>
                    <select name ="inches" id="inputState" class="form-control">
                      <option selected>Choose...</option>
                      <option>0</option>
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option>5</option>
                      <option>6</option>
                      <option>7</option>
                      <option>8</option>
                      <option>9</option>
                      <option>10</option>
                      <option>11</option>
                    </select>
                  </div>
                </div>
                <button id='btnSubmit' type="submit" class="btn btn-primary">Submit</button>
              </form>
            </div>
            <div class="col-4">
              <img
                src="https://static.onecms.io/wp-content/uploads/sites/35/2013/04/13174100/woman-jump-roping-500-calorie-workout.jpg"
                alt="" srcset="" style="height: 700px; width: 350px; object-fit: cover; border-radius: 3%; ">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          HeathFirst © 2019
        </div>
      </div>
    </div>
  </div>



  
 <div class="jumbotron jumbotron-fluid">
    <div class="container">
      <h1 class="display-4">Welcome to HealthFirst!</h1>
      <p class="lead"></p>
    </div>
  </div>



  <!-- Main body-->
  <div class="container" >
    <div class="row" >
      <div class="col-sm" onclick="document.getElementById('food').scrollIntoView({ behavior: 'smooth', block: 'center' }, true);">
        <div class="Titlecard card shadow p-3 mb-5" style="width: 18rem; height: 26rem;">
          <img src="https://www.medicalnewstoday.com/content/images/articles/324/324956/close-up-of-a-plate-of-food.jpg"
            class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">What is in what you eat?</h5>
            <p class="card-text">They say you are what you eat. Well how do I know what I am eating?
              <br><br>This site will help users see what is in the food they eat. </p>

          </div>
        </div>
      </div>
      <div class="col-sm" onclick="document.getElementById('workout').scrollIntoView({ behavior: 'smooth', block: 'center' }, true);">
        <div class="Titlecard card shadow p-3 mb-5" style="width: 18rem; height: 26rem;">
          <img src="https://www.virginactive.com.au/images/library/Blog/Media/SunriseStretch_730x411.jpg"
            class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Workouts</h5>
            <p class="card-text">Our website makes it easy for users to track there work out and notice progress.
            </p>
          </div>
        </div>
      </div>
      <div class="col-sm" onclick="document.getElementById('mealprep').scrollIntoView({ behavior: 'smooth', block: 'center' }, true);">
        <div class="Titlecard card shadow p-3 mb-5"  style="width: 18rem; height: 26rem;">
          <img src="https://paleomg.com/wp-content/uploads/2019/02/Easy-Meals-960x643.jpg" class="card-img-top"
            alt="...">
          <div class="card-body">
            <h5 class="card-title">Meal Prep</h5>
            <p class="card-text">Our website will help users prepare food for them to eat to live a more healthy and
              active life style.</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="container" >
    <hr>
    <div class="row" style="height: 16rem;" id='food'>

      <div class="col-8">
        <h3>Food</h3>
        <p>sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac
          ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim
          diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices
          neque
          ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis
          rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in
          eu
          mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra</p>
      </div>
      <div class="col-4">
        <img
          src="https://www.diabetes.org/sites/default/files/styles/crop_large/public/2019-06/Healthy%20Food%20Made%20Easy%20-min.jpg"
          class="card-img-top" alt="..."></div>
    </div>
    <hr>

    <div class="row" style="height: 16rem;" id='workout'>
      <div class="col-4">
        <img src="https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/05/28/10/istock-937283086.jpg"
          class="card-img-top" alt="...">
      </div>
      <div class="col-8">
        <h3>Workout</h3>
        <p>sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac
          ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim
          diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices
          neque
          ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis
          rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in
          eu
          mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra</p>
      </div>
    </div>
    <hr>
    <div class="row" style="height: 16rem;">
      <div class="col-8" id ="mealprep">
        <h3>Meal Prep</h3>
        <p>sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac
            ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim
            diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices
            neque
            ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis
            rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in
            eu
            mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra</p>
      </div>
      <div class="col-4">
        <img
          src="https://assets.bonappetit.com/photos/5d7296eec4af4d0008ad1263/master/pass/Basically-Gojuchang-Chicken-Recipe-Wide.jpg"
          class="card-img-top" alt="...">

      </div>
    </div>
  </div>
  </div>
  <br>
  <br><br><br>
  <footer style="padding: 2rem;">HeathFirst © 2019</footer>



</body>

</html>