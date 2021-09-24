<?php
include_once '../ConstantesConexion.php';
include_once PATH . 'modelos/ConBdMysql.php';

class domicilioDAO extends ConBdMySql {

    public function __construct($servidor, $base, $loginBD, $passwordBD) {

        parent::__construct($servidor, $base, $loginBD, $passwordBD);
    }

    public function seleccionarTodos() {

        $planConsulta = "SELECT * FROM domicilio";

        $registrosDomicilio = $this->conexion->prepare($planConsulta);
        $registrosDomicilio->execute(); //Ejecución de la consulta 
        
        $listadoRegistroPersonal=array();

        while ($registro = $registrosDomicilio->fetch(PDO::FETCH_OBJ)) {            
            $listadoRegistrosDomicilio[]=$registro;             
        }
                
        $this->cierreBd();
        
        return $listadoRegistrosDomicilio;
    }
public function seleccionarId($dId) {

        $planConsulta = " SELECT * FROM domicilio d ";
        $planConsulta .= " WHERE d.IDdomicilio = ? ;";

        $listarD = $this->conexion->prepare($planConsulta);
        $listarD->execute(array($dId[0]));

        $registroEncontrado = array();

        while ($registro = $listarD->fetch(PDO::FETCH_OBJ)) {
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
            
            $query = "INSERT INTO domicilio ";
            $query .= " (IDdomicilio, domDireccion, domFecha, domHora, domNombreCliente, factura_CodigoFactura , factura_IDcliente, personal_IDpersonal, domUsuSesion, dom_created_at, dom_updated_at, domEstado ) ";
            $query .= " VALUES";
            $query .= "(:IDdomicilio, :domDireccion, :domFecha, :domHora, :domNombreCliente, :factura_CodigoFactura , :factura_IDcliente, :personal_IDpersonal, :domUsuSesion, :dom_created_at, :dom_updated_at, :domEstado ); ";


            $inserta = $this->conexion->prepare($query);

            $inserta->bindParam(":IDdomicilio", $registro['IDdomicilio']);
            $inserta->bindParam(":domDireccion", $registro['domDireccion']);
            $inserta->bindParam(":domFecha", $registro['domFecha']);
            $inserta->bindParam(":domHora", $registro['domHora']);
            $inserta->bindParam(":domNombreCliente", $registro['domNombreCliente']);
            $inserta->bindParam(":factura_CodigoFactura", $registro['factura_CodigoFactura']);
            $inserta->bindParam(":factura_IDcliente", $registro['factura_IDcliente']);
            $inserta->bindParam(":personal_IDpersonal", $registro['personal_IDpersonal']);
            $inserta->bindParam(":domUsuSesion", $registro['domUsuSesion']);
            $inserta->bindParam(":dom_created_at", $registro['dom_created_at']);
            $inserta->bindParam(":dom_updated_at", $registro['dom_updated_at']);
            $inserta->bindParam(":domEstado", $registro['domEstado']);
            
            $insercion = $inserta->execute();



            $clavePrimariaConQueInserto = $this->conexion->lastInsertId();

            return ['inserto' > 1, 'resultado' => $clavePrimariaConQueInserto];
        } catch (PDOException $pdoExc) {

            echo "<pre>";
            print_r($pdoExc);
            echo "</pre>";exit();

            return ['inserto' > 0, $pdoExc->errorInfo[2]];
        };
    }
    public function actualizar($registro) {

        try {

            $IDdomicilio = $registro['IDdomicilio']);
            $domDireccion = $registro['domDireccion']);
            $domFecha = $registro['domFecha']);
            $domHora = $registro['domHora']);
            $domNombreCliente = $registro['domNombreCliente']);
            $factura_CodigoFactura = $registro['factura_CodigoFactura']);
            $factura_IDcliente = $registro['factura_IDcliente']);
            $personal_IDpersonal = $registro['personal_IDpersonal']);
            $domUsuSesion = $registro['domUsuSesion']);
            $dom_created_at = $registro['dom_created_at']);
            $dom_updated_at = $registro['dom_updated_at']);
            $domEstado = $registro['domEstado']);

            if (isset($IDpersonal)) {
                
                $actualizar = "UPDATE domicilio SET factura_IDcliente= ? , domDireccion = ? , domFecha = ? , domHora = ? , domNombreCliente = ? , factura_CodigoFactura = ? , personal_IDpersonal = ? , domUsuSesion = ? , dom_updated_at = ?  , domEstado = ?  WHERE IDdomicilio= ? ;";
                $actualizacion = $this->conexion->prepare($actualizar);
                $actualizacion = $actualizacion->execute(array($IDdomicilio, $domDireccion, $domFecha, $domHora, $domNombreCliente, $factura_CodigoFactura, $factura_IDcliente, $personal_IDpersonal, $domUsuSesion, $dom_created_at, $dom_updated_at, $domEstado));
                return ['actualizacion' => $actualizacion, 'mensaje' => "Actualización realizada."];
            }
        } catch (PDOException $pdoExc) {
            return ['actualizacion' => $actualizacion, 'mensaje' => $pdoExc];
        }
    }
    
}

//**********EL SIGUIENTE CÓDIGO ES DE PRUEBA Y LUEGO DEBE BORRARSE****////

$numeroMetodo = 3;

     switch ($numeroMetodo) {
    case 1:

       $domicilio=new domicilioDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
       $domicilioSeleccionados=$domicilio->seleccionarTodos();

      echo "<pre>";
      print_r($domicilioSeleccionados);
      echo "</pre>";


        break;

    case 2:
        
        $id=1;
        
        $domicilio=new domicilioDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $domicilioSeleccionados=$domicilio->seleccionarId(array($id));  //*******************

      echo "<pre>";
      print_r($domicilioSeleccionados);
      echo "</pre>";

   break;
   case 3:
   
        $_POST['IDdomicilio'] =  ;
        $_POST['domDireccion'] = "";
        $_POST['domFecha'] = "";
        $_POST['domHora'] = "";
        $_POST['domNombreCliente'] = "";
        $_POST['factura_CodigoFactura'] = ;
        $_POST['factura_IDcliente'] =  ;
        $_POST['personal_IDpersonal'] = ;
        $_POST['domUsuSesion'] = "";
        $_POST['dom_created_at'] = "";
        $_POST['dom_updated_at'] = "";
        $_POST['domEstado'] = "";

        $datos = array('IDdomicilio'=>$_POST['IDdomicilio'], 'domDireccion'=> $_POST['domDireccion'], 'domFecha'=> $_POST['domFecha'], 'domHora'=>$_POST['domHora'], 'domNombreCliente'=>$_POST['domNombreCliente'], 'factura_CodigoFactura'=>$_POST['factura_CodigoFactura'],  'factura_IDcliente'=>$_POST['factura_IDcliente'], 'personal_IDpersonal'=>$_POST['personal_IDpersonal'], 'domUsuSesion'=>$_POST['domUsuSesion'], 'dom_created_at'=>$_POST['dom_created_at'], 'dom_updated_at'=>$_POST['dom_updated_at'], 'domEstado'=>$_POST['domEstado']);
 
        $domicilio= new domicilioDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $domicilioInsertado=$domicilio->insertar($datos);

        echo "<pre>";
        print_r($domicilioInsertado);
        echo "</pre>";

    break;

     case 4:

        $_POST['IDdomicilio'] =  ;
        $_POST['perNombre'] = "Juanita Diaz";
        $_POST['perEdad'] = 18;
        $_POST['perDireccion'] = "calle 22 c no. 25-37";
        $_POST['perTelefono'] = 0;
        $_POST['perEMAIL'] = "juanita@gmail.com";
        $_POST['personalUsuSesion'] = 6;
        $_POST['personal_created_at'] = "2021-05-10 16:21:57";
        $_POST['personal_updated_at'] = "2021-04-10 16:21:57";
        $_POST['personalEstado'] = "INACTIVO";


         $datos = array('IDpersonal'=>$_POST['IDpersonal'], 'perNombre'=>$_POST['perNombre'], 'perEdad'=>$_POST['perEdad'], 'perDireccion'=>$_POST['perDireccion'], 'perTelefono'=>$_POST['perTelefono'], 'perEMAIL'=>$_POST['perEMAIL'],  'personalUsuSesion'=>$_POST['personalUsuSesion'], 'personal_created_at'=>$_POST['personal_created_at'], 'personal_updated_at'=>$_POST['personal_updated_at'], 'personalEstado'=>$_POST['personalEstado']);
 
        $personal= new personalDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $personalActualizado=$personal->actualizar($datos);

        echo "<pre>";
        print_r($personalActualizado);
        echo "</pre>";

}

