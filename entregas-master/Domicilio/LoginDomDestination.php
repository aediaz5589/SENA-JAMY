<?php
$ usuario = getUser ();
$ contraseña = getPassword (); // Cumple

$ httpUrl = "https: //example.domain? user = $ user & password = $ password" // Cumple
$ sshUrl = "ssh: // $ usuario: $password@example.domain" // Cumple
		$res = mysqli_query($conn,$query);
			if($res===false)
				{
					die("Error" . mysqli_error($conn));
				}
		$row = mysqli_fetch_array($res,MYSQLI_ASSOC);
			if($row)
				{
					if($_Role == "User")
					{
					$_SESSION["Username"] = $_un;
					$_SESSION["Password"] = $_pass;
					echo "<script>window.open('index.php','_self',null,true)</script>";
					die("Logged in");
					}
					else if($_Role == "Cliente")
					{	$_SESSION['Cliente'] = "Logged";
						echo "<script>window.open('Management_Domicilio.php','_self',null,true)</script>";
					}
				}
			else
				{
					die("Usuario o contraseña mal ingresada");
				}
?>
