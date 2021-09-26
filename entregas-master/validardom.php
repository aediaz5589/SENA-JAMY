<?php
session_start();
$IDpersonal=$_POST['IDpersonal'];
$password=$_POST['Password'];
$con=mysqli_connect("localhost","root","","jamy") or die ("ERROR DE CONEXIÓN");

$_SESSION['IDpersonal']=$IDpersonal;
$consulta="SELECT * FROM `personal` WHERE `IDpersonal` = '".$IDpersonal."' and `Password` = '".$password."'";

$resultado=mysqli_query ($con, $consulta);

$filas=mysqli_num_rows($resultado);

if($filas>0){
	header ("location:Domicilio.php");
}
else
{
	echo "ERROR DE AUTENTIFICACIÓN";

}
mysqli_free_result($resultado);
?>