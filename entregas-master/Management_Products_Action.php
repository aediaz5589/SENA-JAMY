<?php

    session_start();
    $ProductAction = $_GET["ProductAction"];
    
    require 'Connection.php';
    
    
    if($ProductAction == "Add")
    {
        $_ProductID = $_POST["ProductID"];
        $_Productname = $_POST["Productname"];
        $_ProductSize = $_POST["ProductSize"];
        $_ProductPrice = $_POST["ProductPrice"];
        $_ProductCategory = $_POST["ProductCategory"];
        $_ProductImageName = $_POST["ProductImageName"];
        $_ProductImage = $_POST["ProductImage"];
        $_proEstado = $_POST["proEstado"];
        
        
        $query = "INSERT INTO tbl_products";
        $query .= " ( ProductID, Productname, ProductSize, ProductPrice, ProductCategory, ProductImageName, ProductImage, proEstado) ";
        $query .= " VALUES";
        $query .= "(:ProductID, :Productname, :ProductSize, :ProductPrice, :ProductCategory, :ProductImageName, :ProductImage, :proEstado); ";
        $res = mysqli_query($Conn,$query);
        if($res)
        {
            echo '<script>window.open("Management_ProductsList.php","_self",null,true);</script>';
        }
        else
        {
            echo '<script>alert("Fallo!")</script>';
        }
    }else if($ProductAction == "Edit")
    {
        $_ProductID = $_POST["ProductID"];
        $_Productname = $_POST["Productname"];
        $_ProductSize = $_POST["ProductSize"];
        $_ProductPrice = $_POST["ProductPrice"];
        $_ProductCategory = $_POST["ProductCategory"];
        $_ProductImageName = $_POST["ProductImageName"];
        $_ProductImage = $_POST["ProductImage"];
        $_proEstado = $_POST["proEstado"];
        
        
        $_ProductID = $_GET["ProductID"];
        if(empty($_FILES['ProductImage']['tmp_name'])){
            $sql = "UPDATE `tbl_products` SET `ProductID`='$_ProductID ',`Productname`='$_Productname',`ProductSize`='$_ProductSize'," .
                   "`ProductPrice`='$_ProductPrice',`ProductCategory`='$_ProductCategory',`ProductImageName`='$_ProductImageName', `ProductImage`='$_ProductImage', `proEstado`='$_proEstado' WHERE `ProductID` =  $_ProductID";
            $res = mysqli_query($Conn,$sql);
            if($res)
            {
                echo '<script>window.alert("El producto ha sido actualizado!"); window.open("Management_ProductsList.php","_self",null,true)</script>';
            }
        }
            $sql = "UPDATE `tbl_products` SET `ProductID`='$_ProductID ',`Productname`='$_ProductImage',`ProductSize`='$_ProductSize'," .
                   "`ProductPrice`='$_ProductPrice',`ProductCategory`='$_ProductCategory',`ProductImageName`='$_ProductImageName', `ProductImage`='$_ProductImage', `proEstado`='$_proEstado' WHERE `ProductID` =  $_ProductID";
        $res = mysqli_query($Conn,$sql);
        if($res)
        {
            echo '<script>window.alert("El producto ha sido actualizado!"); window.open("Management_ProductsList.php","_self",null,true)</script>';
        }
    }else if($ProductAction == "Delete")
    {
        $_ProductID = $_GET["ProdID"];
        $sql = "DELETE FROM `tbl_products` where `ProductID` = $_ProductID";
        $res = mysqli_query($Conn,$sql);
        if($res)
        {
            echo '<script>window.alert("El producto ha sido eliminado!"); window.open("Management_ProductsList.php","_self",null,true)</script>';
        }
    }

?>