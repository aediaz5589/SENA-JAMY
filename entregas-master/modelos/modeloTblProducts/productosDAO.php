<?php
include_once '../ConstantesConexion.php';
include_once PATH . 'modelos/ConBdMysql.php';

class productosDAO extends ConBdMySql {

    public function __construct($servidor, $base, $loginBD, $passwordBD) {

        parent::__construct($servidor, $base, $loginBD, $passwordBD);
    }

    public function seleccionarTodos() {

        $planConsulta = "SELECT pr.ProductID,pr.Productname,pr.ProductCategory,pr.ProductSize,pr.ProductPrice,ord.ProductID,ord.Color,ord.ordEstado";
        $planConsulta .= " FROM tbl_products pr";
        $planConsulta .= " JOIN tbl_orders ord ON pr.ProductID=ord.ProductID";

        $registrosProductos = $this->conexion->prepare($planConsulta);
        $registrosProductos->execute(); //Ejecución de la consulta 
        
        $listadoRegistroProductos=array();

        while ($registro = $registrosProductos->fetch(PDO::FETCH_OBJ)) {            
            $listadoRegistroProductos[]=$registro;             
        }
                
        $this->cierreBd();
        
        return $listadoRegistroProductos;
    }
public function seleccionarId($prId) {

        $planConsulta = " SELECT * FROM tbl_products pr ";
        $planConsulta .= " WHERE pr.ProductID = ? ;";

        $listarPR = $this->conexion->prepare($planConsulta);
        $listarPR->execute(array($prId[0]));

        $registroEncontrado = array();

        while ($registro = $listarPR->fetch(PDO::FETCH_OBJ)) {
            $registroEncontrado[] = $registro;
        }

        $this->cierreBd();

        if (!empty($registroEncontrado)) {
            return ['exitoSeleccionId' => true, 'registroEncontrado' => $registroEncontrado];
        } else {
            return ['exitoSeleccionId' => false, 'registroEncontrado' => $registroEncontrado];
        }
    }
public function insertar($registro){

    try {

        $query = "INSERT INTO tbl_products";
        $query .= " ( ProductID, Productname, ProductSize, ProductPrice, ProductCategory, ProductImageName, proCantidadActual, proCantidadMinimo, proCantidadMaximo, pro_created_at, pro_updated_at, proEstado) ";
        $query .= " VALUES";
        $query .= "(:ProductID, :Productname, :ProductSize, :ProductPrice, :ProductCategory, :ProductImageName, :proCantidadActual, :proCantidadMinimo, :proCantidadMaximo, :pro_created_at, :pro_updated_at, :proEstado); ";

        $inserta = $this->conexion->prepare($query);

        $inserta->bindParam(":ProductID", $registro['ProductID']);
        $inserta->bindParam(":Productname", $registro['Productname']);
        $inserta->bindParam(":ProductSize", $registro['ProductSize']);
        $inserta->bindParam(":ProductPrice", $registro['ProductPrice']);
        $inserta->bindParam(":ProductCategory", $registro['ProductCategory']);
        $inserta->bindParam(":ProductImageName", $registro['ProductImageName']);
        $inserta->bindParam(":proCantidadActual", $registro['proCantidadActual']);
        $inserta->bindParam(":proCantidadMinimo", $registro['proCantidadMinimo']);
        $inserta->bindParam(":proCantidadMaximo", $registro['proCantidadMaximo']);
        $inserta->bindParam(":pro_created_at", $registro['pro_created_at']);
        $inserta->bindParam(":pro_updated_at", $registro['pro_updated_at']);
        $inserta->bindParam(":proEstado", $registro['proEstado']);

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
         $ProductImageName = $registro['ProductImageName'];
         $proCantidadActual = $registro['proCantidadActual'];
         $proCantidadMinimo = $registro['proCantidadMinimo'];
         $proCantidadMaximo = $registro['proCantidadMaximo'];
         $pro_created_at = $registro['pro_created_at'];
         $pro_updated_at = $registro['pro_updated_at'];
         $proEstado = $registro['proEstado'];

        if (isset($ProductID)) {


        $actualizar = "UPDATE tbl_products SET Productname = ? , Productname = ? , ProductSize = ? ,
        ProductPrice = ? , ProductCategory = ? , ProductImageName = ? , proCantidadActual = ? ,
        proCantidadMinimo = ? , proCantidadMaximo = ? , pro_created_at = ? , pro_updated_at = ?
        WHERE proEstado = ? ;";

        $actualizacion = $this->conexion->prepare($actualizar);
        $actualizacion = $actualizacion->execute(array($ProductID, $Productname, $ProductSize,
        $ProductPrice, $ProductCategory, $ProductImageName, $proCantidadActual, $proCantidadMinimo, $proCantidadMaximo, $pro_created_at, 
        $pro_updated_at, $proEstado));

         return ['actualizacion' => $actualizacion, 'mensaje' => "Actualización realizada."];

         } catch (PDOException $pdoExc) {
            
            return ['actualizacion' => $actualizacion, 'mensaje' => $pdoExc];
        }
    }
        
        public function eliminar($sID = array()){
        
        $planConsulta = &quot;delte from tbl_products&quot;;
        $planConsulta .= &quot; where ProductID = : ProductID; &quot;;
        $eliminar = $this-&gt;conexion-&gt;prepare($planConsulta);
        $eliminar-&gt;bindParam(&#39;:ProductID&#39;, $sID[&#39;ProductID&#39;], PDO: :PARAM_INT);
        $resultado = $eliminar-&gt;execute();
        
        $this-&gt;cierreBd();
        
        if (!empty($resultado)) {
        return [&#39;eliminar&#39; =&gt; TRUE, &#39;registroEliminar&#39; =&gt; array($sID [&#39;ProductID&#39;])];
        }else{
        return [&#39;eliminar&#39; =&gt; FALSE, &#39;registroEliminar&#39; =&gt; array($sID [&#39;ProductID&#39;])];
        }
        }
        
        public function eliminarLogico($sID = array()){
        try{
        
                $cambiarEstado = 0;
                
                if (isset($sID[&#39;ProductID&#39;])) {
                $actualizar = &quot;UPDATE tbl_products set proEstado = ? WHERE ProductID = ? ;&quot;;
                $actualizacion = $this-&gt;conexion-&gt;prepare($actualizar);
                $actualizacion = $actualizacion-&gt;execute(array($proEstado, $sID[&#39;ProductID&#39;]));
                return[&#39;actualizacion&#39;=&gt; $actualizacion, &#39;mensaje&#39;=&gt; &quot;Registro inactivado&quot;];
                }
                }catch {PDOException $pdoExc}{
                return[&#39;actualizacion&#39;=&gt; $actualizacion, &#39;mensaje&#39;=&gt; $pdoExc ];
                }
                
                }
                
     public function habilitar($sID = array()){
                try{
        
        $cambiarEstado = 1;
        
        if (isset($sID[&#39;ProductID&#39;])) {
        $actualizar = &quot;UPDATE tbl_products set proEstado = ? WHERE ProductID = ? ;&quot;;
        $actualizacion = $this-&gt;conexion-&gt;prepare($actualizar);
        $actualizacion = $actualizacion-&gt;execute(array($proEstado, $sID[&#39;ProductID&#39;]));
        return[&#39;actualizacion&#39;=&gt; $actualizacion, &#39;mensaje&#39;=&gt; &quot;Registro activado&quot;];
        }
        }catch {PDOException $pdoExc}{
        return[&#39;actualizacion&#39;=&gt; $actualizacion, &#39;mensaje&#39;=&gt; $pdoExc ];
        }
        }
        }
        
        //**********EL SIGUIENTE CÓDIGO ES DE PRUEBA Y LUEGO DEBE BORRARSE****////
        
        $numeroMetodo = 4;
        
             switch ($numeroMetodo) {
            case 1:
        
        $productos=new productosDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $productosSeleccionados=$productos->seleccionarTodos();
        
        echo "<pre>";
        print_r($productosSeleccionados);
        echo "</pre>";
        
        
                break;
        
            case 2:
                
                $id=1;
        
$productos=new productosDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
$productosSeleccionados=$productos->seleccionarId(array($id));  //*******************

echo "<pre>";
print_r($productosSeleccionados);
echo "</pre>";

   break;

   case 3:

$_POST['ProductID']=6;
$_POST['Productname']="RAMO";  
$_POST['ProductSize']=4;  
$_POST['ProductPrice']=180000;  
$_POST['ProductCategory']="GRADUACION";  
$_POST['ProductImageName']="RAMO GRADUACION";  
$_POST['proCantidadActual']=6;  
$_POST['proCantidadMinimo']=1;  
$_POST['proCantidadMaximo']=5;  
$_POST['pro_created_at']="2021-05-11 05:59:39";  
$_POST['pro_updated_at']="2021-05-11 05:59:39";  
$_POST['proEstado']="ACTIVO";  

$datos = array('ProductID'=>$_POST['ProductID'],'Productname'=> $_POST['Productname'], 'ProductSize'=>$_POST['ProductSize'], 'ProductSize'=>$_POST['ProductPrice'],'ProductCategory'=>$_POST['ProductCategory'],'ProductImageName'=> $_POST['ProductImageName'],'proCantidadActual'=> $_POST['proCantidadActual'],'proCantidadMinimo'=> $_POST['proCantidadMinimo'],'proCantidadMaximo'=> $_POST['proCantidadMaximo'],'pro_created_at'=> $_POST['pro_created_at'],'pro_updated_at'=> $_POST['pro_updated_at'],'proEstado'=> $_POST['proEstado']);

$productos = new productosDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
$productosInsertadoId = $productos->insertar($datos);

echo "<pre>";
print_r($productosInsertadoId);
echo "</pre>";
}
break;
    case 4:

        $_POST['Username'] = 130;
        $_POST['PASSWORD'] = "LOS DUROS DE JAMYYYYYYYYYYYYYYYYYYYYYYY";
        $_POST['Role'] = "EL EQUIPO";
        $_POST['Firstname'] = 5000000;
        $_POST['CustomerID'] = 2;

        $datos = array('Username' => $_POST['Username'], 'PASSWORD' => $_POST['PASSWORD'], 'Role' => $_POST['Role'], 'Firstname' => $_POST['Firstname'], 'CustomerID' => $_POST['CustomerID']);

        $Customer = new customerDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $CustomerActualizado = $Customer->actualizar($datos);  //*******************

        echo "<pre>";
        print_r($CustomerActualizado);
        echo "</pre>";

        break;
    case 5:

        $_POST['Username'] = 130;

        $datos = array('Username' => $_POST['Username']);

        $Customer = new customerDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $CustomerEliminado = $Customer->eliminar($datos);  //*******************

        echo "<pre>";
        print_r($CustomerEliminado);
        echo "</pre>";

        break;
    case 6:

        $_POST['Username'] = 258;

        $datos = array('Username' => $_POST['Username']);

        $Customer = new customerDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $CustomerEliminadoLogico = $Customer->eliminarLogico($datos);  //*******************

        echo "<pre>";
        print_r($CustomerEliminadoLogico);
        echo "</pre>";

        break;
    case 7:

        $_POST['Username'] = 258;

        $datos = array('Username' => $_POST['Username']);

        $Customer = new customerDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $CustomerHabilitar = $Customer->habilitar($datos);  //*******************

        echo "<pre>";
        print_r($CustomerHabilitar);
        echo "</pre>";

        break;
}
