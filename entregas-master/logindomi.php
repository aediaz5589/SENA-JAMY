<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>inicia sesion</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
</head>

<body>

    <div class="brand">Floristeria Mi Gran Sueño </div>
    <div class="address-bar"><strong>PIDE TUS ARREGLOS</strong> Y DIRECTO A LA PUERTA DE TU CASA</div>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Floristeria Mi Gran Sueño</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Floristeria Mi Gran Sueño</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="index.php">Inicio</a></li>
          <li><a href="bestseller.php">Productos más populares</a></li>
          <li><a href="shop.php">Tienda</a></li>
                    <li><a href="about.php">Nosotros</a></li>
                </ul>
            </div>
        </div>
    </nav>
<?php
  $con=mysqli_connect("localhost","root","","jamy") or die ("ERROR DE CONEXIÓN");
?>
    <div class="container">

        <div class="row">
            <div class="box">
      
                <div class="col-lg-12">
                    <hr>

                    <h2 class="intro-text text-center">Ingresar Domiciliario</h2>
                    <hr>
                </div>

                <div class="col-md-6">
                 < <center>
  <form method="POST" action="validardom.php">
    <label>Usuario</label>
    <input type="text" name="Username" placeholder="Escriba su Usuario"><br/><br/>
    <label>Contraseña </label>
    <input type="password" name="Password" placeholder="Escriba su contraseña"><br/><br/>
    <input type="submit" name="insert" value="INGRESAR"><br/><br/>

                                                      
  </form>

   </center>
          
          </form>
                </div>
             
            </div>
        </div>

    </div>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Floriseria Mi Gran Sueño &copy; </p>
                </div>
            </div>
        </div>
    </footer>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>

</body>

</html>