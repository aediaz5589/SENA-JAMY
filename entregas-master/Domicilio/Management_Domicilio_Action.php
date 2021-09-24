<?php
	require 'Connection.php';
	$ID = $_GET["id"];
	$sql = "DELETE FROM domicilio WHERE IDdomicilio =$ID;";
	$res = mysqli_query($Conn,$sql);
	if($res){
		echo '<script>window.open("Management_Domicilio.php","_self",null,true);</script>';
	}
	
?>