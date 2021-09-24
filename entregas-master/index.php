<?php session_start();
include_once "modelos/ConstantesConexion.php";
 ?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Floristeria mi gran sueño">
    <meta name="author" content="JAMY">

    <title>Floristeria Mi Gran Sueño</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.comss?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
   
	
	
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
    <div class="address-bar"><strong>Siempre hay flores para aquellos que quieren verlas</strong></div>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Floristeria Mi Gran sueño</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                <li><a href="index.php">Inicio</a></li>

					<li><a href="shop.php">Tienda</a></li>
					<li><a href="bestseller.php">Productos mas populares</a></li>
                    <li><a href="about.php">Nosotros</a></li>
                     <li><a href="logindomi.php" >Domicilio</a></li>
					<li><a href="#" onclick="ManagementOnclick();">Administrador</a></li>
					<?php if($Username == null){echo '<li><a href="register.php?ActionType=Register">Registrarse para Pedidos</a></li>';} ?>
					<?php if($Username == null){echo '<li><a href="Login.php?Role=User">Ingresar</a></li>';} else {echo '<li><a href="Logout.php">salir</a></li>';} ?>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12 text-center">
                    <div id="carousel-example-generic" class="carousel slide">
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
							<li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        </ol>
                        <div class="carousel-inner">

                           <h1 class="text-center" style="height: 30px " >ALGUNOS DE NUESTROS PRODUCTOS</h1>
                            <div class="item active">
                                <img style="border: 15px solid gray; border-radius: 20px; height: 800px; width: 400px;"class="img-responsive img-full" src="https://image.freepik.com/foto-gratis/arco-ceremonia-boda-arco-decorado-hermosas-flores-frescas-tela-inscripcion-lugar-matrimonio-arco-boda-flores-reales-noche_159701-222.jpg" alt="">
                            </div>
                            <div class="item">
                                <img style="border: 15px solid gray; border-radius: 20px; height: 800px; width: 400px;" class="img-responsive img-full" src="https://www.fiestaideasclub.com/wp-content/uploads/2018/05/centros_de_mesa_para_boda-fiesta-ideas_003.jpg" alt="">
                            </div>
                            <div class="item">
                                <img style="border: 15px solid gray; border-radius: 20px; height: 800px; width: 400px;" class="img-responsive img-full" src="https://espaciohogar.com/wp-content/uploads/2019/09/centros-de-mesa-para-boda-2020-istock-600x400.jpg?8784e8&8784e88" alt="">
                            </div>
							<div class="item">
                                <img style="border: 15px solid gray; border-radius: 20px; height: 800px; width: 400px;"class="img-responsive img-full" src="https://espaciohogar.com/wp-content/uploads/2013/06/centro-mesa-bodas-vintage.jpg" alt="">
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
		
		<?php 
			$conn = mysqli_connect("localhost","root","","jamy");
			$sql = "SELECT * FROM `tbl_products` Limit 10";
			$Resulta = mysqli_query($conn,$sql);
		
	  

?>

		<?php while($Rows = mysqli_fetch_array($Resulta)){
 
		#echo "<pre>"; 
	    #print_r($Rows);
	    #echo "</pre>"; 
	    #exit();

		echo '	
		<div class="col-sm-4 col-lg-4 col-md-4">
             <div class="thumbnail">
				<h4 style="text-align: center;">'.$Rows[0].'</h4>
                <img style="border: 2px solid gray; border-radius: 10px; height: 229px; width: 298px;" src="'.IMAGENES.$Rows[5].'" alt="">
                <div class="caption">
					<p><strong>Nombre del Producto:</strong> '.$Rows[4].'</p>
					
					<p><strong>Precio del producto $'.$Rows[3].'.00</strong></p>
                </div>
				<center><a onclick="addToCartOnclick('.$Rows[0].');" href="#"  style="margin-bottom: 5px;" class="btn btn-primary">Agregar al Carrito</a></center>
            </div>
        </div>
		';
		}?>
		
	</div>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>
					<?php echo '<strong>'.$Username.'</strong>'; ?>
					<br>
					<strong>
					<?php if($Username != null){echo '<a href="ManageAccount.php?Role=User">informacion de tu cuenta</a> |';} ?> 
					<?php if($Username == null){echo '<a href="Login.php?Role=User">Ingresar</a>';} else {echo '<a href="Logout.php">salir</a>';} ?> | 
					<a href="#">Volver al inicio</a>
					</strong><br>
					floristeria mi gran sueño &copy; 
					</p>
					
                </div>
            </div>
        </div>
    </footer>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
		$('.carousel').carousel({
			interval: 5000 //changes the speed
		})
		
		$('#reg').click(function(){
			window.open('register.html',_self);
		});
		
		function ManagementOnclick(){
			if(confirm("Solo los administradores tienen permitido acceder a esta página. Inicie sesión como administrador.") == true)
			{
				window.open("Login.php?Role=Admin","_self",null,true);
			}
		}
		
		function addToCartOnclick(ProductID)
		{	
			if(confirm("Estas seguro que deseas agregar este producto al carrito") == true){
			window.open("Order.php?ProductID="+ProductID,"_self",null,true);
			}
		}
    </script>
</body>

</html>
