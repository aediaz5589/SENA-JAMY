<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Producto nuevo</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

	<?php
		$Username = null;
		if(!empty($_SESSION["Username"]))
		{$Username = $_SESSION["Username"];}
		$ProductAction = $_GET["ProductAction"];
		if(empty($_SESSION['Admin'])){echo '<script>window.open("index.php","_self",null,true);</script>';}
	?>
</head>

<body>

    <div class="brand">Floristeria Mi Gran Sueño</div>
   <div class="address-bar"><strong>Siempre hay flores para aquellos que quieren verlas</div></strong>

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
					<li><a href="Management_Orders.php">Órdenes</a></li>
					<li><a href="Management_Products.php?ProductAction=Add">Productos</a></li>
					<li><a href="Management_ProductsList.php">Lista de Productos</a></li>
                    <li><a href="Management_Customers.php">Clientes</a></li>
					
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
						<hr>
						<h2 class="intro-text text-center">Producto nuevos</h2>
						<hr>

					<div class="col-md-12">	
						<div class="col-md-6">	
							<form role="form" action="Management_Products_Action.php?ProductAction=
							<?php echo $ProductAction; if($ProductAction=="Edit"){ echo "&ProductID=" . $_GET['ProdID'];} ?>" 
							method="POST" enctype = "multipart/form-data">
							
							<div class="form-group">
							  <label for="ProductName">Nombre de Producto:</label>
							  <input type="text" name="ProductName" class="form-control" id="ProductName" placeholder="Ingresa el nombre de tu producto" required>
							</div>
							
							<div class="form-group">
							  <label for="ProductBrand">Categoria:</label>
							  <input type="text" name="ProductBrand" class="form-control" id="ProductBrand" placeholder="Ingresa la marca del producto" required>
							</div>
							
							<div class="form-group">
							  <label for="ProductPrice">Precio del Producto:</label>
							  <input type="text" name="ProductPrice" class="form-control" id="ProductPrice" placeholder="Ingrese el precio del producto" required>
							</div>
						</div>

							
							<div class="form-group">
								<label for="ProductImage">Imagen de Producto:</label>
								<input type="file" name="ProductImage">
							</div>
							
							<div class="form-group">
							<button type="submit" style="float: right;" class="btn btn-default">Enviar</button>
							</div>
						</div>
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
                    <p>Floristeria Mi Gran Sueño &copy; </p>
                </div>
            </div>
        </div>
    </footer>	

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>

</body>

</html>
