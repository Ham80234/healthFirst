<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


    <title>Admin</title>
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

                <a class="nav-link" href="./index.jsp">Sign out</a>
                </li>
            </ul>


        </div>
    </nav>

    <div> you are currently logged in as an admin</div>

	 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteModal">
        Delete item
    </button>
    
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete Food Item</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="Food_name">Food ID</label>
                            <input name="Fn" type="text" class="form-control" id="Food_name">
                        </div>
                        </div>
                     <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Add Food item
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Food Item</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="Food_name">Food name</label>
                            <input name="Fn" type="text" class="form-control" id="Food_name">
                        </div>
                        <div class="form-group">
                            <label for="Food_group">Food group</label>
                            <input name="Fg" type="text" class="form-control" id="Food_group">
                        </div>
                        <div class="form-group">
                            <label for="Cal">Calcium</label>
                            <input name="Cal" type="number" class="form-control" id="Cal">
                        </div>
                        <div class="form-group">
                            <label for="ir">Iron</label>
                            <input name="ir" type="number" class="form-control" id="ir">
                        </div>
                        <div class="form-group">
                            <label for="mg">Magnesium</label>
                            <input name="mg" type="number" class="form-control" id="mg">
                        </div>
                        <div class="form-group">
                            <label for="ph">Phosphorous</label>
                            <input name="ph" type="number" class="form-control" id="ph">
                        </div>
                        <div class="form-group">
                            <label for="K">Potassium</label>
                            <input name="K" type="number" class="form-control" id="K">
                        </div>
                        <div class="form-group">
                            <label for="Na">Sodium</label>
                            <input name="Na" type="number" class="form-control" id="Na">
                        </div>
                        <div class="form-group">
                            <label for="Z">Zinc</label>
                            <input name="Z" type="number" class="form-control" id="Z">
                        </div>
                        <div class="form-group">
                            <label for="Cu">Copper</label>
                            <input name="Cu" type="number" class="form-control" id="Cu">
                        </div>
                        <div class="form-group">
                            <label for="Fl">Floride</label>
                            <input name="Fl" type="number" class="form-control" id="Fl">
                        </div>
                        <div class="form-group">
                            <label for="mng">Manganese</label>
                            <input name="mng" type="number" class="form-control" id="mng">
                        </div>
                        <div class="form-group">
                            <label for="sel">selenium</label>
                            <input name="sel" type="number" class="form-control" id="sel">
                        </div>
                        <div class="form-group">
                            <label for="va">Vit A</label>
                            <input name="va" type="number" class="form-control" id="va">
                        </div>
                        <div class="form-group">
                            <label for="ve">Vit E</label>
                            <input name="ve" type="number" class="form-control" id="ve">
                        </div>
                        <div class="form-group">
                            <label for="vd">Vit D</label>
                            <input name="vd" type="number" class="form-control" id="vd">
                        </div>
                        <div class="form-group">
                            <label for="vc">Vit C</label>
                            <input name="vc" type="number" class="form-control" id="vc">
                        </div>
                        <div class="form-group">
                            <label for="vb1">Vit B1</label>
                            <input name="vb1" type="number" class="form-control" id="vb1">
                        </div>
                        <div class="form-group">
                            <label for="vb2">Vit B2</label>
                            <input name="vb2" type="number" class="form-control" id="vb2">
                        </div>
                        <div class="form-group">
                            <label for="vb3">Vit B3</label>
                            <input name="vb3" type="number" class="form-control" id="vb3">
                        </div>
                        <div class="form-group">
                            <label for="vb5">Vit B5</label>
                            <input name="vb5" type="number" class="form-control" id="vb5">
                        </div>
                        <div class="form-group">
                            <label for="vb9">Vit B9</label>
                            <input name="vb9" type="number" class="form-control" id="vb9">
                        </div>
                        <div class="form-group">
                            <label for="vb12">Vit B12</label>
                            <input name="vb12" type="number" class="form-control" id="vb12">
                        </div>
                        <div class="form-group">
                            <label for="cl">Calories</label>
                            <input name="cl" type="number" class="form-control" id="cl">
                        </div>
                        <div class="form-group">
                            <label for="pr">Protein</label>
                            <input name="pr" type="number" class="form-control" id="pr">
                        </div>
                        <div class="form-group">
                            <label for="fat">Fat</label>
                            <input name="fat" type="number" class="form-control" id="fat">
                        </div>

                        <div class="form-group">
                            <label for="carb">Carbs</label>
                            <input name="carb" type="number" class="form-control" id="carb">
                        </div>
                        <div class="form-group">
                            <label for="fib">fiber</label>
                            <input name="fib" type="number" class="form-control" id="fib">
                        </div>
                        <div class="form-group">
                            <label for="su">sucrose</label>
                            <input name="su" type="number" class="form-control" id="su">
                        </div>
                        <div class="form-group">
                            <label for="glc">glucose</label>
                            <input name="glc" type="number" class="form-control" id="glc">
                        </div>
                        <div class="form-group">
                            <label for="fru">Fructose</label>
                            <input name="fru" type="number" class="form-control" id="fru">
                        </div>
                        <div class="form-group">
                            <label for="wat">water</label>
                            <input name="wat" type="number" class="form-control" id="wat">
                        </div>
                        <div class="form-group">
                            <label for="caf">Caffine</label>
                            <input name="caf" type="number" class="form-control" id="caf">
                        </div>
                        <div class="form-group">
                            <label for="cho">Cholesterol</label>
                            <input name="cho" type="number" class="form-control" id="cho">
                        </div>
                        <div class="form-group">
                            <label for="sf">Sat Fat</label>
                            <input name="sf" type="number" class="form-control" id="sf">
                        </div>
                     <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>

            </div>
        </div>
    </div>

</body>

</html>