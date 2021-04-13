<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ordenar</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" 
	rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" 
	rel="stylesheet" type="text/css">
	<style>
		#pdetails span{
			float: right;
		}
	</style>
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
                    <li><a href="index.php">inicio</a></li>
					<li><a href="shop.php">Tienda</a></li>
                    <li><a href="about.php">Nosotros</a></li>
			
                </ul>
            </div>
        </div>
    </nav>
	
	<?php
		require 'Connection.php';
		$UN = $_SESSION['Username'];
		$PASS = $_SESSION['Password'];
		$ProductID = $_GET['ProductID'];
		
		if(empty($UN)){echo '<script>window.open("Login.php?Role=User","_self",null,true);</script>';}
		
		$sql = "SELECT * FROM `tbl_customers` WHERE `Username` = '".$UN."' and `Password` = '".$PASS."' and `Role` = 'User'";
		$res = mysqli_query($Conn,$sql);
		while($Rows = mysqli_fetch_array($res)){
			$CustomerID = $Rows[0];
		}
	?>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Ordenar</h2>
                    <hr><br>
                </div>

                <div class="col-md-6">ID producto
                 <form role="form" action="OrderAction.php?ProductID=<?php echo $ProductID; ?>&CustomerID=<?php echo $CustomerID; ?>" method="POST">
					<div class="form-group">
					  <label for="ProductID"></label>
					  <input type="text" name="ProductID" class="form-control" id="ProductID" value="<?php echo $ProductID; ?>" disabled>
					</div>
					<div class="form-group">ID Cliente
					  <label for="CustomerID"></label>
					  <input type="text" name="CustomerID" class="form-control" id="CustomerID" value="<?php echo $CustomerID; ?>" disabled>
					</div>
				
					<div class="form-group">Nombre del producto
						<label for="ProductColor"></label>
						<input type="text" name="ProductColor" class="form-control" id="ProductColor">
					</div>
					<div class="form-group">Precio
						<label for="ProductSize"></label>
						<input type="number" name="ProductSize" class="form-control" id="ProductSize">
					</div>

                    <div class="form-group">Fecha
                        <label for="ProductColor"></label>
                        <input type="date" name="ProductColor" class="form-control" id="ProductColor">
                    </div>

                    <div class="form-group">Hora
                        <label for="ProductColor"></label>
                        <input type="time " name="ProductColor" class="form-control" id="ProductColor">
                    </div>


                    <div class="form-group">Direccion
                        <label for="ProductColor"></label>
                        <input type="text" name="ProductColor" class="form-control" id="ProductColor">
                    </div>
                    <div class="form-group">Telefono
                        <label for="ProductSize"></label>
                        <input type="number" name="ProductSize" class="form-control" id="ProductSize">
                    </div>




						<button type="submit" style="float: right;" class="btn btn-default">Enviar</button>
					</form>
				</div>
                
                <div class="clearfix"></div>
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

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
