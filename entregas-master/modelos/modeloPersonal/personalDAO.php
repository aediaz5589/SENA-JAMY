<?php
include_once '../ConstantesConexion.php';
include_once PATH . 'modelos/ConBdMysql.php';

class personalDAO extends ConBdMySql {

    public function __construct($servidor, $base, $loginBD, $passwordBD) {

        parent::__construct($servidor, $base, $loginBD, $passwordBD);
    }

    public function seleccionarTodos() {

        $planConsulta = "SELECT p.IDpersonal,p.perNombre,p.perDireccion,p.perEdad,p.personalEstado,d.personal_IDpersonal";
        $planConsulta .= " FROM personal p";
        $planConsulta .= " JOIN domicilio d ON d.personal_IDpersonal=p.IDpersonal";

        $registrosPersonal = $this->conexion->prepare($planConsulta);
        $registrosPersonal->execute(); //Ejecución de la consulta 
        
        $listadoRegistroPersonal=array();

        while ($registro = $registrosPersonal->fetch(PDO::FETCH_OBJ)) {            
            $listadoRegistrosPersonal[]=$registro;             
        }
                
        $this->cierreBd();
        
        return $listadoRegistrosPersonal;
    }


 public function seleccionarId($pId) {

        $planConsulta = " SELECT * FROM personal p ";
        $planConsulta .= " WHERE p.IDpersonal = ? ;";

        $listarP = $this->conexion->prepare($planConsulta);
        $listarP->execute(array($pId[0]));

        $registroEncontrado = array();

        while ($registro = $listarP->fetch(PDO::FETCH_OBJ)) {
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
            
            $query = "INSERT INTO personal ";
            $query .= " (IDpersonal, perNombre, perEdad, perDireccion, perTelefono, perEMAIL,personalUsuSesion, personal_created_at, personal_updated_at, personalEstado) ";
            $query .= " VALUES";
            $query .= "(:IDpersonal, :perNombre, :perEdad, :perDireccion, :perTelefono, :perEMAIL, :personalUsuSesion, :personal_created_at, :personal_updated_at, :personalEstado ); ";


            $inserta = $this->conexion->prepare($query);

            $inserta->bindParam(":IDpersonal", $registro['IDpersonal']);
            $inserta->bindParam(":perNombre", $registro['perNombre']);
            $inserta->bindParam(":perEdad", $registro['perEdad']);
            $inserta->bindParam(":perDireccion", $registro['perDireccion']);
            $inserta->bindParam(":perTelefono", $registro['perTelefono']);
            $inserta->bindParam(":perEMAIL", $registro['perEMAIL']);
            $inserta->bindParam(":personalUsuSesion", $registro['personalUsuSesion']);
            $inserta->bindParam(":personal_created_at", $registro['personal_created_at']);
            $inserta->bindParam(":personal_updated_at", $registro['personal_updated_at']);
            $inserta->bindParam(":personalEstado", $registro['personalEstado']);

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

            $IDpersonal =  $registro['IDpersonal'];
            $perNombre =  $registro['perNombre'];
            $perEdad =  $registro['perEdad'];
            $perDireccion =  $registro['perDireccion'];
            $perTelefono =  $registro['perTelefono'];
            $perEMAIL =  $registro['perEMAIL'];
            $personalUsuSesion =  $registro['personalUsuSesion'];
            $personal_created_at =  $registro['personal_created_at'];
            $personal_updated_at =  $registro['personal_updated_at'];
            $personalEstado =  $registro['personalEstado'];

            if (isset($IDpersonal)) {
                
                $actualizar = "UPDATE personal SET perNombre= ? , perEdad = ? , perDireccion = ? , perTelefono = ? , perEMAIL = ? , personalUsuSesion = ? , personal_created_at = ? , personal_updated_at = ? , personalEstado = ?  WHERE IDpersonal= ? ;";
                $actualizacion = $this->conexion->prepare($actualizar);
                $actualizacion = $actualizacion->execute(array($IDpersonal, $perNombre, $perEdad, $perDireccion, $perTelefono, $perEMAIL, $personalUsuSesion, $personal_created_at, $personal_updated_at, $personalEstado));
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
        $planConsulta = "DELETE  from personal ";
        $planConsulta .= " WHERE IDpersonal= :IDpersonal ;";
        $eliminar = $this->conexion->prepare($planConsulta);
        $eliminar->bindParam(':IDpersonal', $sId['IDpersonal'], PDO::PARAM_INT);
        $resultado = $eliminar->execute();

        $this->cierreBd();

        if (!empty($resultado)) {
            return ['eliminar' => TRUE, 'registroEliminado' => array($sId['IDpersonal'])];
        } else {
            return ['eliminar' => FALSE, 'registroEliminado' => array($sId['IDpersonal'])];
        }
    }
//////
    public function eliminarLogico($sId = array()) {// Se deshabilita un registro cambiando su estado a 0
        try {

            $cambiarEstado = 0;

            if (isset($sId['IDpersonal'])) {
                $actualizar = "UPDATE personal SET personalEstado = ? WHERE IDpersonal= ? ;";
                $actualizacion = $this->conexion->prepare($actualizar);
                $actualizacion = $actualizacion->execute(array($cambiarEstado, $sId['IDpersonal']));
                return ['actualizacion' => $actualizacion, 'mensaje' => "Registro Inactivado."];
            }
        } catch (PDOException $pdoExc) {
            return ['actualizacion' => $actualizacion, 'mensaje' => $pdoExc];
        }
    }

    public function habilitar($sId = array()) {// Se habilita un registro cambiando su estado a 1
        try {

            $cambiarEstado = 1;

           if (isset($sId['IDpersonal'])) {
                $actualizar = "UPDATE personal SET personalEstado = ? WHERE IDpersonal= ? ;";
                $actualizacion = $this->conexion->prepare($actualizar);
                $actualizacion = $actualizacion->execute(array($cambiarEstado, $sId['IDpersonal']));
                return ['actualizacion' => $actualizacion, 'mensaje' => "Registro Activado."];
            }
        } catch (PDOException $pdoExc) {
            return ['actualizacion' => $actualizacion, 'mensaje' => $pdoExc];
        }
    }
}

//**********EL SIGUIENTE CÓDIGO ES DE PRUEBA Y LUEGO DEBE BORRARSE****////

$numeroMetodo = 4;

switch ($numeroMetodo) {
    case 1:

       $personal=new personalDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
       $personalSeleccionados=$personal->seleccionarTodos();

       echo "<pre>";
       print_r($personalSeleccionados);
       echo "</pre>";

        break;

    case 2:
        
        $id=1000128655;
        
        $personal= new personalDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $personalSeleccionados=$personal->seleccionarId(array($id));  //*******************

        echo "<pre>";
        print_r($personalSeleccionados);
        echo "</pre>";

   break;

   case 3:
   
        $_POST['IDpersonal'] = 1012363082 ;
        $_POST['perNombre'] = "Juanita Diaz";
        $_POST['perEdad'] = 20;
        $_POST['perDireccion'] = "calle 22 c no. 25-37";
        $_POST['perTelefono'] = 0;
        $_POST['perEMAIL'] = "juanita@gmail.com";
        $_POST['personalUsuSesion'] = "6";
        $_POST['personal_created_at'] = "2021-05-10 16:21:57";
        $_POST['personal_updated_at'] = "2021-04-10 16:21:57";
        $_POST['personalEstado'] = "INACTIVO";

        $datos = array('IDpersonal'=>$_POST['IDpersonal'], 'perNombre'=>$_POST['perNombre'], 'perEdad'=>$_POST['perEdad'], 'perDireccion'=>$_POST['perDireccion'], 'perTelefono'=>$_POST['perTelefono'], 'perEMAIL'=>$_POST['perEMAIL'],  'personalUsuSesion'=>$_POST['personalUsuSesion'], 'personal_created_at'=>$_POST['personal_created_at'], 'personal_updated_at'=>$_POST['personal_updated_at'], 'personalEstado'=>$_POST['personalEstado']);
 
        $personal= new personalDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $personalInsertado=$personal->insertar($datos);

        echo "<pre>";
        print_r($personalInsertado);
        echo "</pre>";

        break;

     case 4:

        $_POST['IDpersonal'] = 1012363082 ;
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

        break;

        case 5:

        $_POST['IDpersonal'] = 1012363081 ;

        $datos = array('IDpersonal' => $_POST['IDpersonal']);

        $personal= new personalDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $personalEliminado=$personal->eliminar($datos);

        echo "<pre>";
        print_r($personalEliminado);
        echo "</pre>";
        break;

        case 6:

        $_POST['IDpersonal'] = 1000143666;

        $datos = array('IDpersonal' => $_POST['IDpersonal']);

        $personal= new personalDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $personalEliminadoLogico=$personal->eliminarLogico($datos);

        echo "<pre>";
        print_r($personalEliminadoLogico);
        echo "</pre>";

        break;
    case 7:

        $_POST['IDpersonal'] = 1000143666;

        $datos = array('IDpersonal' => $_POST['IDpersonal']);

        $personal = new personalDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $personalHabilitar = $personal->habilitar($datos);  //*******************

        echo "<pre>";
        print_r($personalHabilitar);
        echo "</pre>";

        break;
}
