<?php session_start();
include_once "modelos/ConstantesConexion.php";

 ?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>pupulares</title>
	
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

<?php
		$Username = null;
		if(!empty($_SESSION["Username"]))
		{$Username = $_SESSION["Username"];}
?>
</head>

<body>
    <div class="brand">Floristeria Mi Gran Sueño</div>
    <div class="address-bar"><strong>PIDE TUS ARREGLOS </strong> Y DIRECTO A LA PUERTA DE TU CASA</div>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Floristeria Mi Gran Sueño</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
				<li><a href="index.php">Inicio</a></li>
					<li><a href="bestseller.php">Productos más Populares</a></li>
					<li><a href="shop.php">Tienda</a></li>
                    <li><a href="about.php">Nosotros</a></li>
					<li><a href="#" onclick="ManagementOnclick();">Administrador</a></li>
					<?php if($Username == null){echo '<li><a href="register.php?ActionType=Register">Registrarse para Pedidos</a></li>';} ?>
					<?php if($Username == null){echo '<li><a href="Login.php?Role=User">Ingresar</a></li>';} else {echo '<li><a href="Logout.php">salir</a></li>';} ?>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">

			<div class="row">
				<div class="box" style="border-radius: 10px;">
					<div class="col-lg-12">
						<hr>
						<h2 class="intro-text text-center">Top lo <strong>Más</strong> Vendidos</h2>
						<hr>
					</div><br></br>
				</div>
			</div>

			<?php
				$num = 5;
				require 'Connection.php';
				$sql = "SELECT * FROM `tbl_products` Limit 5";
				$Resulta = mysqli_query($Conn,$sql);
				while($Rows = mysqli_fetch_array($Resulta)){

					echo '	
						<div class="row">
							<div class="box" style="border-radius: 10px;">
								<div class="col-lg-12">
									<hr>
									<h2 class="intro-text text-center">Top '. $num.'</h2>
									<hr>
									<img style="border: 2px solid gray; border-radius: 10px; height: 229px; width: 298px;" src="'.IMAGENES.$Rows[5].'"alt="">
									<hr class="visible-xs">
									<p><strong>Nombre del Producto:</strong> '.$Rows[4].'</p>
									<p><strong>Precio: $</strong> '.$Rows[3].'</p>
									<a onclick="addToCartOnclick('.$Rows[0].');" href="#"  style="margin-bottom: 5px;" class="btn btn-primary">Agregar al Carro</a>


								</div>
							</div>
						</div>';
					$num--;
				}
			?>


	</div>


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
	<script>
		function addToCartOnclick(ProductID)
		{	
			if(confirm("Are you sure you want to add this product to your cart?") == true){
			window.open("Order.php?ProductID="+ProductID,"_self",null,true);
			}
		}
	</script>

</body>

</html>