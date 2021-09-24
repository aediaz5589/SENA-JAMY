<?php 
	session_start(); 
	$ActionType = $_GET['ActionType'];
	if($ActionType == "Edit"){
		$ID = $_GET['ID'];
		$Loc = $_GET['Loc'];
	}
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php if($ActionType == "Register"){echo "Register an Accout";}else echo "Edit Account Information"; ?></title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">


	<?php
		$Username = null;
		if(!empty($_SESSION["Username"]))
		{
			$Username = $_SESSION["Username"];
		}
	?>
</head>

<body>

    <div class="brand">Floristeria Mi Gran Sueño</div>
    <div class="address-bar"><strong>PIDE TUS ARREGLOS</strong> yY DIRECTO A LA PUERTA DE TU CASA</div>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">TFloristeria Mi Gran Sueño</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Floristeria Mi Gran Sueño</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="index.php">Inicio</a></li>
					<li><a href="bestseller.php">Productos más populares </a></li>
					<li><a href="shop.php">Tienda</a></li>
                    <li><a href="about.php">Nosotros</a></li>
					<?php if($Username == null){echo '<li><a href="registerdom.php?ActionType=Register">Registro</a></li>';} ?>
					<?php if($Username == null){echo '<li><a href="Logindom.php?Role=User">Ingresar</a></li>';} else {echo '<li><a href="Logoutdom.php">Cerrar Sesión</a></li>';} ?>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
						<hr>
						<h2 class="intro-text text-center"><?php if($ActionType == "Register"){echo "Registro";}else echo "Edita la Información de tu Cuenta"; ?></h2>
						<hr>
					<div class="col-md-6">	
							<form role="form" action="RegisterActiondom.php?ActionType=<?php echo $ActionType; if($ActionType == "Edit"){ echo "&Loc=" . $Loc . "&ID=" .$ID;} ?>" 
							method="POST">
							
							<div class="form-group">
							  <label for="username">Usuario:</label>
							  <input type="text" name="Username" class="form-control" id="Username" placeholder="Ingresa tu usuario">
							</div>
							
							<div class="form-group">
							  <label for="Password">Contraseña:</label>
							  <input type="Password" name="Password" class="form-control" id="Password" placeholder="Ingresa tu contraseña">
							</div>

							<div class="form-group">
							  <label for="Firstname">Primer Nombre:</label>
							  <input type="text" name="Firstname" class="form-control" id="Firstname" placeholder="Ingresa tu primer nombre">
							</div>
							
							<div class="form-group">
							  <label for="Middlename">Primer Apellido:</label>
							  <input type="text" name="Middlename" class="form-control" id="Middlename" placeholder="Ingresa tu primer apellido">
							</div>
							
							<div class="form-group">
							  <label for="Lastname">Segundo Apellido:</label>
							  <input type="text" name="Lastname" class="form-control" id="Lastname" placeholder="Ingresa tu segundo apellido">
							</div>
							
							<div class="form-group">
							  <label for="Address">Dirección:</label>
							  <input type="text" name="Address" class="form-control" id="Address" placeholder="Ingresa tu dirección">
							</div>
							
							<div class="form-group">
							  <label for="EmailAddress">Correo electronico:</label>
							  <input type="email" name="EmailAddress" class="form-control" id="EmailAddress" placeholder="Ingresa tu dirección de correo">
							</div>
							
							<button type="submit" class="btn btn-default">Enviar</button><br><br>
						</form>
					</div>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container -->

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Floristeria Mi Gran Sueño &copy;</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
