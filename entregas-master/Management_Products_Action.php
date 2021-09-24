<?php

require'ConBdMysql.php';

class productos extends ConBdMySql {

    public function __construct($servidor, $base, $loginBD, $passwordBD) {

        parent::__construct($servidor, $base, $loginBD, $passwordBD);
    }

 public function insertar($registro){

    try {

        $query = "INSERT INTO tbl_products";
        $query .= " ( ProductID, Productname, ProductSize, ProductPrice, ProductCategory, ProductImageName, proCantidadActual, proCantidadMinimo, proCantidadMaximo) ";
        $query .= " VALUES";
        $query .= "(:ProductID, :Productname, :ProductSize, :ProductPrice, :ProductCategory, :ProductImageName, :proCantidadActual, :proCantidadMinimo, :proCantidadMaximo); ";

        $inserta = $this->conexion->prepare($query);

        $inserta->bindParam(":ProductID", $registro['ProductID']);
        $inserta->bindParam(":Productname", $registro['Productname']);
        $inserta->bindParam(":ProductSize", $registro['ProductSize']);
        $inserta->bindParam(":ProductPrice", $registro['ProductPrice']);
        $inserta->bindParam(":ProductCategory", $registro['ProductCategory']);
        $inserta->bindParam(":ProductImageName", $registro['ProductImage']);
        $inserta->bindParam(":proCantidadActual", $registro['proCantidadActual']);
        $inserta->bindParam(":proCantidadMinimo", $registro['proCantidadMinimo']);
        $inserta->bindParam(":proCantidadMaximo", $registro['proCantidadMaximo']);


        $insercion = $inserta->execute();

        $clavePrimariaConQueInserto=$this->conexion->lastInsertId();


        return ['inserto' > 1, 'resultado' => $clavePrimariaConQueInserto];  
        
    } catch (PDOException $pdoExo) {
        return  ['inserto' > 0, $pdoExo->errorInfo[2]];
    }
  }
  public function actualizar($registro){

         $ProductID = $registro['ProductID'];
         $Productname = $registro['Productname'];
         $ProductSize = $registro['ProductSize'];
         $ProductPrice = $registro['ProductPrice'];
         $ProductCategory = $registro['ProductCategory'];
         $ProductImageName = $registro['ProductImage'];
         $proCantidadActual = $registro['proCantidadActual'];
         $proCantidadMinimo = $registro['proCantidadMinimo'];
         $proCantidadMaximo = $registro['proCantidadMaximo'];

        if (isset($ProductID)) {


        $actualizar = "UPDATE tbl_products SET ProductID = ? , Productname = ? , ProductSize = ? ,
        ProductPrice = ? , ProductCategory = ? , ProductImage = ? , proCantidadActual = ? ,
        proCantidadMinimo = ? , proCantidadMaximo = ? WHERE ProductID = ? ;";

        $actualizacion = $this->conexion->prepare($actualizar);
        $actualizacion = $actualizacion->execute(array($ProductID, $Productname, $ProductSize,
        $ProductPrice, $ProductCategory, $ProductImageName, $proCantidadActual, $proCantidadMinimo, $proCantidadMaximo));

    }

}
}








