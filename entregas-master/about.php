<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Nosotros</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
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
    <div class="address-bar"><strong>Siempre hay flores para aquellos que quieren verlas</div></strong>

    <!-- Navigation -->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
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
                    <li><a href="shop.php">Tienda</a></li>
                    <li><a href="bestseller.php">Productos más populares</a></li>
                    <li><a href="about.php">Nosotros</a></li>
                    <li><a href="#" onclick="ManagementOnclick();">Administrador</a></li>
                    <?php if($Username == null){echo '<li><a href="register.php?ActionType=Register">Registro</a></li>';} ?>
                    <?php if($Username == null){echo '<li><a href="Login.php?Role=User">Ingresar</a></li>';} else {echo '<li><a href="Logout.php">Salir</a></li>';} ?>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Nosotros
                        <strong>Floristeria Mi Gran Sueño</strong>
                    </h2>
                    <hr>
                </div>
                <div class="col-md-6">
                    <img class="img-responsive img-border-left" src="img" alt="">
                </div>
                <div class="col-md-10" align=left-aling> 
                    <h1 style="color: black" > ¿Quienes somos?</h1>
                    <p> Empresa dedicada a la entrega de arreglos florales a domicilio, contamos con un centro de distribución en donde se puede adquirir de forma presencial nuestro producto</p> <br><br><br><br>
                    <p> </p> 
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

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
                    <a href="#">Volver arriba</a>
                    </strong><br>
                    Floristeria mi gran sueño &copy;
                    </p>
                </div>
            </div>
        </div>
    </footer>


    <script src="js/jquery.js"></script>

    <script src="js/bootstrap.min.js"></script>
    <script>
        
        function ManagementOnclick(){
            if(confirm("Solo los administradores tienen permitido acceder a esta página. Inicie sesión como administrador.") == true)
            {
                window.open("Login.php?Role=Admin","_self",null,true);
            }
        }
        
    </script>

</body>

</html>
