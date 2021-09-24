<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Informacion</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

	<?php
		require 'Connection.php';
		$Username = null;
		if(!empty($_SESSION["Username"]))
		{
			$Username = $_SESSION["Username"];
		}
		$sql = "select * from tbl_customers where Username = '".$Username."' and Password = '".$_SESSION['Password']."'";
		$Res = mysqli_query($Conn,$sql);
		while($Rows = mysqli_fetch_array($Res))
		{
			$C_ID = $Rows[0];
			$C_Username = $Rows[1];
			$C_Password = $Rows[2];
			$C_Firstname = $Rows[4];
			$C_Middlename = $Rows[5];
			$C_Lastname = $Rows[6];
			$C_Address = $Rows[7];
			$C_Email = $Rows[8];
		}
	?>
</head>

<body>

    <div class="brand">Floristeria Mi Gran Sueño</div>
    <div class="address-bar"><strong>Siempre hay flores para aquellos que quieren verlas</div>

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
					<li><a href="bestseller.php">Productos más vendidos</a></li>
					<li><a href="shop.php">Tienda</a></li>
                    <li><a href="about.php">Nosotros</a></li>
					<?php if($Username == null){echo '<li><a href="register.php?ActionType=Register">Register</a></li>';} ?>
					<?php if($Username == null){echo '<li><a href="Login.php?Role=User">Login</a></li>';} else {echo '<li><a href="Logout.php">Salir</a></li>';} ?>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
						<hr>
						<h2 class="intro-text text-center">Informacion de tu cuenta</h2>
						<hr>
					<div class="col-md-6">	
							<form role="form" action="Register.php?ActionType=Edit&Loc=MA&ID=<?php echo $C_ID; ?>" method="POST">
							<h4 style="text-align: center">INFORMACIÓN DE TU CUENTA</h4>
							<div class="form-group">
							  <label for="username">Nombre de usuario:</label>
							  <input type="text" name="Username" class="form-control" id="Username" value="<?php echo $C_Username; ?>" disabled>
							</div>
							
							<div class="form-group">
							  <label for="Password">Contraseña:</label>
							  <input type="Password" name="Password" class="form-control" id="Password" value="<?php echo $C_Password; ?>" disabled>
							</div>

							<div class="form-group">
							  <label for="Firstname">Primer Nombre:</label>
							  <input type="text" name="Firstname" class="form-control" id="Firstname" value="<?php echo $C_Firstname; ?>" disabled>
							</div>
							
							<div class="form-group">
							  <label for="Middlename">Segundo Nombre:</label>
							  <input type="text" name="Middlename" class="form-control" id="Middlename" value="<?php echo $C_Middlename; ?>" disabled>
							</div>
							
							<div class="form-group">
							  <label for="Lastname">Apellido:</label>
							  <input type="text" name="Lastname" class="form-control" id="Lastname" value="<?php echo $C_Lastname; ?>" disabled>
							</div>
							
							<div class="form-group">
							  <label for="Address">Direccion:</label>
							  <input type="text" name="Address" class="form-control" id="Address" value="<?php echo $C_Address; ?>" disabled>
							</div>
							
							<div class="form-group">
							  <label for="EmailAddress">Correo Electronico:</label>
							  <input type="email" name="EmailAddress" class="form-control" id="EmailAddress" value="<?php echo $C_Email; ?>" disabled>
							</div>
							
							<button type="submit" class="btn btn-default">Editar Informacion</button>
						</form>
					</div>
					
					<div class="col-md-6">	
						<h4 style="text-align: center">PEDIDOS</h4>
						<div class="table-responsive">
							<table border="5px" class="table">
								<tr style="text-align: center; color: Black; font-weight: bold;">
										<td>ID de Orden</td>
									<td>Producto ID</td>
									<td>Cantidad</td>
									<td>Color</td>
									<td>Fecha de orden</td>
									<td>Factura</td>
									<td>Acción</td>
								</tr>
								
								<?php 
								$sqlI = "SELECT OrderID, ProductID,  Size, Color, DateOrdered, factura_CodigoFactura " .
								"FROM tbl_orders ";
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
								<td>
								<a href="#" onclick="OrderOnclick(<?php echo $Rows[0]; ?>);">Cancel</a>
								</td>
								<?php endwhile; ?>
								</tr>
							</table>
						</div>
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
		function OrderOnclick(OrderID)
		{
			if(confirm("Are you sure you want to cancel this order?") == true)
			{
				window.open("ManageAccountAction.php?oID="+OrderID,"_self",null,true);
			}
		}
	</script>

</body>

</html>














