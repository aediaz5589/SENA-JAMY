<?php
include_once '../ConstantesConexion.php';
include_once PATH . 'modelos/ConBdMysql.php';

class customerDAO extends ConBdMySql {

    public function __construct($servidor, $base, $loginBD, $passwordBD) {

        parent::__construct($servidor, $base, $loginBD, $passwordBD);
    }

    public function seleccionarTodos() {


        $planConsulta = "SELECT CustomerID,Username,PASSWORD,Role,Firstname,Middlename,Lastname,Address,EmailAddress FROM tbl_customers ";  

        $registrosCustomers = $this->conexion->prepare($planConsulta);
        $registrosCustomers->execute(); //Ejecución de la consulta 
        
        $listadoRegistroCustomer=array();

        while ($registro = $registrosCustomers->fetch(PDO::FETCH_OBJ)) {            
            $listadoRegistroCustomer[]=$registro;             
        }
                
        $this->cierreBd();
        
        return $listadoRegistroCustomer;
    }
public function seleccionarId($sId) {

        $planConsulta = " SELECT * FROM tbl_customers c ";
        $planConsulta .= " where c.CustomerID =  ? ;";

        $listarCR = $this->conexion->prepare($planConsulta);
        $listarCR->execute(array($sId[0]));

        $registroEncontrado = array();

        while ($registro = $listarCR->fetch(PDO::FETCH_OBJ)) {
            $registroEncontrado[] = $registro;
        }

        $this->cierreBd();

        if (!empty($registroEncontrado)) {
            return ['exitoSeleccionId' => true, 'registroEncontrado' => $registroEncontrado];
        } else {
            return ['exitoSeleccionId' => false, 'registroEncontrado' => $registroEncontrado];
        }
  
    }

 public function insertar($registro) {
        try {


            $query = "INSERT INTO tbl_customers ";
            $query .= " (CustomerID,Username,PASSWORD,Role,Firstname,Middlename,Lastname,Address,EmailAddress,tbl_customersUsuSesion,tbl_customers_created_at,tbl_customers_updated_at,custEstado) ";
            $query .= " VALUES";
            $query .= "(:CustomerID, :Username, :PASSWORD, :Role, :Firstname, :Middlename, :Lastname, :Address, :EmailAddress, :tbl_customersUsuSesion, :tbl_customers_created_at, :tbl_customers_updated_at, :custEstado); ";

            $inserta = $this->conexion->prepare($query);

            $inserta->bindParam(":CustomerID", $registro['CustomerID']);
            $inserta->bindParam(":Username", $registro['Username']);
            $inserta->bindParam(":PASSWORD", $registro['PASSWORD']);
            $inserta->bindParam(":Role", $registro['Role']);
            $inserta->bindParam(":Firstname", $registro['Firstname']);
            $inserta->bindParam(":Middlename", $registro['Middlename']);
            $inserta->bindParam(":Lastname", $registro['Lastname']);
            $inserta->bindParam(":Address", $registro['Address']);
            $inserta->bindParam(":EmailAddress ", $registro['EmailAddress ']);
            $inserta->bindParam(":tbl_customersUsuSesion", $registro['tbl_customersUsuSesion']);
            $inserta->bindParam(":tbl_customers_created_at", $registro['tbl_customers_created_at']);
            $inserta->bindParam(":tbl_customers_updated_at", $registro['tbl_customers_updated_at']);
            $inserta->bindParam(":custEstado", $registro['custEstado']);

            $insercion = $inserta->execute();

            $clavePrimariaConQueInserto = $this->conexion->lastInsertId();

            return ['inserto' > 1, 'resultado' => $clavePrimariaConQueInserto];
        } catch (PDOException $pdoExc) {
            return ['inserto' > 0, $pdoExc->errorInfo[2]];
        };
    }

    public function actualizar($registro) {

        try {
//            $autor = $registro[0]['autor'];
//            $titulo = $registro[0]['titulo'];
//            $precio = $registro[0]['precio'];
//            $categoria = $registro[0]['categoriaLibro_catLibId'];
//            $isbn = $registro[0]['isbn'];

            $CustomerID = $registro['CustomerID']);
            $Username = $registro['Username'];
            $PASSWORD = $registro['PASSWORD'];
            $Role = $registro['Role'];
            $Firstname = $registro['Firstname'];
            $Middlename = $registro['Middlename'];
            $Lastname = $registro['Lastname'];
            $Address = $registro['Address'];
            $EmailAddress = $registro['EmailAddress '];
            $tbl_customersUsuSesion = $registro['tbl_customersUsuSesion'];
            $tbl_customers_created_at = $registro['tbl_customers_created_at'];
            $tbl_customers_updated_at = $registro['tbl_customers_updated_at']; 
            $custEstado = $registro['custEstado'];


            if (isset($isbn)) {
                $actualizar = "UPDATE tbl_customers SET Username= ? , PASSWORD = ? , Role = ? , Firstname = ?,  Middlename = ? , Lastname = ? , Address = ? , EmailAddress  = ? , tbl_customersUsuSesion  = ? , tbl_customers_created_at  = ? , tbl_customers_updated_at  = ? , custEstado  = ?  WHERE CustomerID= ? ;";

                $actualizacion = $this->conexion->prepare($actualizar);
                $actualizacion = $actualizacion->execute(array($autor, $titulo, $precio, $categoria, $isbn));
                return ['actualizacion' => $actualizacion, 'mensaje' => "Actualización realizada."];
            }
        } catch (PDOException $pdoExc) {
            return ['actualizacion' => $actualizacion, 'mensaje' => $pdoExc];
        }
    }
     
    public function eliminar($sId = array()) {//Recibe llave primaria a eliminar
//        echo "<pre>";
//        print_r($sId);
//        echo "</pre>";exit();
        $planConsulta = "DELETE from tbl_customers  ";
        $planConsulta .= " WHERE CustomerID= :CustomerID ;";
        $eliminar = $this->conexion->prepare($planConsulta);
        $eliminar->bindParam(':CustomerID', $sId['CustomerID'], PDO::PARAM_INT);
        $resultado = $eliminar->execute();

        $this->cierreBd();

        if (!empty($resultado)) {
            return ['eliminar' => TRUE, 'registroEliminado' => array($sId['CustomerID'])];
        } else {
            return ['eliminar' => FALSE, 'registroEliminado' => array($sId['CustomerID'])];
        }
    }
//////
    public function eliminarLogico($sId = array()) {// Se deshabilita un registro cambiando su estado a 0
        try {

            $cambiarEstado = 0;

            if (isset($sId['CustomerID'])) {
                $actualizar = "UPDATE tbl_customers SET custEstado = ? WHERE CustomerID= ? ;";
                $actualizacion = $this->conexion->prepare($actualizar);
                $actualizacion = $actualizacion->execute(array($cambiarEstado, $sId['CustomerID']));
                return ['actualizacion' => $actualizacion, 'mensaje' => "Registro Inactivado."];
            }
        } catch (PDOException $pdoExc) {
            return ['actualizacion' => $actualizacion, 'mensaje' => $pdoExc];
        }
    }

    public function habilitar($sId = array()) {// Se habilita un registro cambiando su estado a 1
        try {

            $cambiarEstado = 1;

            if (isset($sId['CustomerID'])) {
                $actualizar = "UPDATE tbl_customers SET custEstado = ? WHERE CustomerID= ? ;";
                $actualizacion = $this->conexion->prepare($actualizar);
                $actualizacion = $actualizacion->execute(array($cambiarEstado, $sId['CustomerID']));
                return ['actualizacion' => $actualizacion, 'mensaje' => "Registro Activado."];
            }
        } catch (PDOException $pdoExc) {
            return ['actualizacion' => $actualizacion, 'mensaje' => $pdoExc];
        }
    }   

 }      
 //**********EL SIGUIENTE CÓDIGO ES DE PRUEBA Y LUEGO DEBE BORRARSE****////

$numeroMetodo = 2;

switch ($numeroMetodo) {
    case 1:
        $Customer = new customerDAO (SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $CustomerSeleccionados = $Customer->seleccionarTodos();  //*******************

        echo "<pre>";
        print_r($CustomerSeleccionados);
        echo "</pre>";

        break;
    case 2:

        $id = 1000128655;

        $Customer = new customerDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $CustomerSeleccionadoId = $Customer->seleccionarId(array($id));  //*******************

        echo "<pre>";
        print_r($CustomerSeleccionadoId);
        echo "</pre>";

        break;
 
   
}