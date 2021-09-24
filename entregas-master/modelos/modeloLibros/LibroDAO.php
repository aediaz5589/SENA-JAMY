<?php

include_once '../ConstantesConexion.php';
include_once PATH . 'modelos/ConBdMysql.php';

class LibroDAO extends ConBdMySql {

    public function __construct($servidor, $base, $loginBD, $passwordBD) {

        parent::__construct($servidor, $base, $loginBD, $passwordBD);
    }

    public function seleccionarTodos() {

        $planConsulta = "SELECT l.isbn,l.titulo,l.autor,l.precio,cl.catLibId,cl.catLibNombre";
        $planConsulta .= " FROM libros l";
        $planConsulta .= " JOIN categorialibro cl ON l.categoriaLibro_catLibId=cl.catLibId ";
        $planConsulta .= " ORDER BY l.isbn ASC ";

        $registrosLibros = $this->conexion->prepare($planConsulta);
        $registrosLibros->execute(); //Ejecución de la consulta 

        $listadoRegistrosLibro = array();

        while ($registro = $registrosLibros->fetch(PDO::FETCH_OBJ)) {
            $listadoRegistrosLibro[] = $registro;
        }

        $this->cierreBd();

        return $listadoRegistrosLibro;
    }

    public function seleccionarId($sId) {

        $planConsulta = " SELECT * FROM libros l ";
        $planConsulta .= " WHERE l.isbn =  ? ;";

        $listar = $this->conexion->prepare($planConsulta);
        $listar->execute(array($sId[0]));

        $registroEncontrado = array();

        while ($registro = $listar->fetch(PDO::FETCH_OBJ)) {
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


            $query = "INSERT INTO libros ";
            $query .= " (isbn, titulo, autor, precio, categoriaLibro_catLibId) ";
            $query .= " VALUES";
            $query .= "(:isbn , :titulo , :autor , :precio , :categoriaLibro_catLibId ); ";
            
            $inserta = $this->conexion->prepare($query);

            $inserta->bindParam(":isbn", $registro['isbn']);
            $inserta->bindParam(":titulo", $registro['titulo']);
            $inserta->bindParam(":autor", $registro['autor']);
            $inserta->bindParam(":precio", $registro['precio']);
            $inserta->bindParam(":categoriaLibro_catLibId", $registro['categoriaLibro_catLibId']);

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
            $autor = $registro['autor'];
            $titulo = $registro['titulo'];
            $precio = $registro['precio'];
            $categoria = $registro['categoriaLibro_catLibId'];
            $isbn = $registro['isbn'];

            if (isset($isbn)) {
                $actualizar = "UPDATE libros SET autor= ? , titulo = ? , precio = ? , categoriaLibro_catLibId = ? WHERE isbn= ? ;";
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
        $planConsulta = "delete from libros ";
        $planConsulta .= " where isbn= :isbn ;";
        $eliminar = $this->conexion->prepare($planConsulta);
        $eliminar->bindParam(':isbn', $sId['isbn'], PDO::PARAM_INT);
        $resultado = $eliminar->execute();

        $this->cierreBd();

        if (!empty($resultado)) {
            return ['eliminar' => TRUE, 'registroEliminado' => array($sId['isbn'])];
        } else {
            return ['eliminar' => FALSE, 'registroEliminado' => array($sId['isbn'])];
        }
    }
//////
    public function eliminarLogico($sId = array()) {// Se deshabilita un registro cambiando su estado a 0
        try {

            $cambiarEstado = 0;

            if (isset($sId['isbn'])) {
                $actualizar = "UPDATE libros SET estado = ? WHERE isbn= ? ;";
                $actualizacion = $this->conexion->prepare($actualizar);
                $actualizacion = $actualizacion->execute(array($cambiarEstado, $sId['isbn']));
                return ['actualizacion' => $actualizacion, 'mensaje' => "Registro Inactivado."];
            }
        } catch (PDOException $pdoExc) {
            return ['actualizacion' => $actualizacion, 'mensaje' => $pdoExc];
        }
    }

    public function habilitar($sId = array()) {// Se habilita un registro cambiando su estado a 1
        try {

            $cambiarEstado = 1;

            if (isset($sId['isbn'])) {
                $actualizar = "UPDATE libros SET estado = ? WHERE isbn= ? ;";
                $actualizacion = $this->conexion->prepare($actualizar);
                $actualizacion = $actualizacion->execute(array($cambiarEstado, $sId['isbn']));
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
        $libro = new LibroDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $librosSeleccionados = $libro->seleccionarTodos();  //*******************

        echo "<pre>";
        print_r($librosSeleccionados);
        echo "</pre>";

        break;
    case 2:

        $id = 128;

        $libro = new LibroDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $libroSeleccionadoId = $libro->seleccionarId(array($id));  //*******************

        echo "<pre>";
        print_r($libroSeleccionadoId);
        echo "</pre>";

        break;
    case 3:

        $_POST['isbn'] = 130;
        $_POST['titulo'] = "LOS DUROS DE JAMY";
        $_POST['autor'] = "EL EQUIPO";
        $_POST['precio'] = 5000000;
        $_POST['categoriaLibro_catLibId'] = 2;

        $datos = array('isbn' => $_POST['isbn'], 'titulo' => $_POST['titulo'], 'autor' => $_POST['autor'], 'precio' => $_POST['precio'], 'categoriaLibro_catLibId' => $_POST['categoriaLibro_catLibId']);

        $libro = new LibroDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $libroInsertadoId = $libro->insertar($datos);  //*******************

        echo "<pre>";
        print_r($libroInsertadoId);
        echo "</pre>";

        break;
    case 4:

        $_POST['isbn'] = 130;
        $_POST['titulo'] = "LOS DUROS DE JAMYYYYYYYYYYYYYYYYYYYYYYY";
        $_POST['autor'] = "EL EQUIPO";
        $_POST['precio'] = 5000000;
        $_POST['categoriaLibro_catLibId'] = 2;

        $datos = array('isbn' => $_POST['isbn'], 'titulo' => $_POST['titulo'], 'autor' => $_POST['autor'], 'precio' => $_POST['precio'], 'categoriaLibro_catLibId' => $_POST['categoriaLibro_catLibId']);

        $libro = new LibroDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $libroActualizado = $libro->actualizar($datos);  //*******************

        echo "<pre>";
        print_r($libroActualizado);
        echo "</pre>";

        break;
    case 5:

        $_POST['isbn'] = 130;

        $datos = array('isbn' => $_POST['isbn']);

        $libro = new LibroDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $libroEliminado = $libro->eliminar($datos);  //*******************

        echo "<pre>";
        print_r($libroEliminado);
        echo "</pre>";

        break;
    case 6:

        $_POST['isbn'] = 258;

        $datos = array('isbn' => $_POST['isbn']);

        $libro = new LibroDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $libroEliminadoLogico = $libro->eliminarLogico($datos);  //*******************

        echo "<pre>";
        print_r($libroEliminadoLogico);
        echo "</pre>";

        break;
    case 7:

        $_POST['isbn'] = 258;

        $datos = array('isbn' => $_POST['isbn']);

        $libro = new LibroDAO(SERVIDOR, BASE, USUARIO_BD, CONTRASENIA_BD);
        $libroHabilitar = $libro->habilitar($datos);  //*******************

        echo "<pre>";
        print_r($libroHabilitar);
        echo "</pre>";

        break;
}
