<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Ordenes</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

	<?php
		if(empty($_SESSION['Admin'])){echo '<script>window.open("index.php","_self",null,true);</script>';}
	?>
</head>

<body>

    <div class="brand">Floristeria Mi Gran Sueño</div>
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
					<li><a href="Management_Orders.php">Órdenes</a></li>
					<li><a href="Management_Products.php?ProductAction=Add">Productos</a></li>
					<li><a href="Management_ProductsList.php">Lista de Productos</a></li>
                    <li><a href="Management_Customers.php">Clientes</a></li>
                    <li><a href="Management_Domicilio.php">Domicilio</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
						<hr>
						<h2 class="intro-text text-center">Órdenes</h2>
						<hr>
						<div class="table-responsive">
							<table border="5px" class="table">
								<tr style="text-align: center; color: Black; font-weight: bold;">
									<td>ID de Orden</td>
									<td>ID del cliente</td>
									<td>Nombre del producto</td>
									<td>Cantidad</td>
									<td>Color</td>
									<td>Categoria</td>
									<td>Precio</td>
									<td>Fecha de orden</td>
									<td>Fecha de entrega</td>
									<td>Acción</td>
								</tr>
								
								<?php 
								require 'Connection.php';
							    $sqlI = "SELECT tbl_orders.OrderID, tbl_orders.CustomerID, tbl_products.Productname,tbl_orders.Size, tbl_orders.Color, tbl_products.ProductCategory, tbl_products.ProductPrice, tbl_orders.DateOrdered, tbl_orders.FechaEntrega FROM tbl_products RIGHT JOIN tbl_orders on tbl_orders.ProductID = tbl_products.ProductID ORDER BY tbl_orders.OrderID";
								$Resulta = mysqli_query($Conn,$sqlI);
								while($Rows = mysqli_fetch_array($Resulta)):;
								?>
								<tr style="color: black">	
								<td><?php echo $Rows[0]; ?></td>
								<td><?php echo $Rows[1]; ?></td>
								<td><?php echo $Rows[2]; ?></td>
								<td><?php echo $Rows[3]; ?></td>
								<td><?php echo $Rows[4]; ?></td>
								<td><?php echo $Rows[5]; ?></td>
								<td><?php echo $Rows[6]; ?></td>
								<td><?php echo $Rows[7]; ?></td>
								<td><?php echo $Rows[8]; ?></td>


								<td>
								<a href="#" onclick="CancelOrderOnclick(<?php echo $Rows[0]; ?>);">Borrar</a>
								</td>
								<?php endwhile; ?>
								</tr>
							</table>
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
		function CancelOrderOnclick(ID)
		{
			if(confirm("Esta seguro que quiere eliminar esta orden?")==true)
			{
				window.open("Management_Orders_Action.php?id="+ID,"",null,true);
			}
		}
	</script>

</body>

</html>
