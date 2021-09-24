<?php

session_start();
//echo "<pre>";
//print_r($_REQUEST);
//echo "</pre>";

$operacion = $_REQUEST['operacion'];

switch ($operacion) {
   case "facturar":
        facturar();
        break;
    case "cancelar":
        cancelar();
        break;
}

function facturar() {

    if (!empty($_SESSION['USER']) && !empty($_SESSION['tbl_products'])) {
        include 'connection.php';
        $factura = $_SESSION['factura']; //  Bajar de la sesión los datos de cliente para asociarlo a una venta
        $tbl_orders = $_SESSION['tbl_orders']; //  Bajar de la sesión los datos de artículos para asociarlos a una venta

        $bd->query("INSERT INTO factura values('$factura->documento') "); //Creamos una nueva venta asociada al cliente, tener en cuenta el autonúmerico
        $orderID = $bd->lastInsertId(); // obtenemos el último ID generado de la inserción de venta
        //  Empezar a recorrer cada uno de los artículos e ir insertándolos

        foreach ($a as $a) {
            $bd->query("INSERT INTO detalle_venta(venta,articulo,cantidad) values($venta,$a->codigo,$a->cantidad)");
        }
//        session_destroy();
//        header("location:formulario.php");
        imprimir();
    } else {
        header("location:formulario.php");
    }
}

function cancelar() {
    session_destroy();
    header("location:formulario.php");
}

function imprimir() {
    include 'conexion.php';
    include './librerias/fpdf/fpdf.php';

    $cliente = $_SESSION['cliente'];
    $articulos = $_SESSION['articulos'];

    $ventas = $bd->query("select v.num_venta,c.documento,c.nombre,c.telefono,
                        dv.num_detalle,dv.articulo,a.descripcion,
                        dv.cantidad,a.precio
                        from ((clientes c join ventas v on c.documento=v.cliente)
                        join detalle_venta dv on v.num_venta=dv.venta)
                        join articulos a on dv.articulo=a.codigo")->fetchAll(PDO::FETCH_OBJ); //Devuelve un arreglo de Objetos
//http://www.fpdf.org/en/download.php

    $hoja = new FPDF();
    $hoja->AddPage();
    //CABECERAS
    $hoja->SetFont('Arial', 'B', 36);
    $hoja->SetXY(10, 10);
    $hoja->Cell(210, 30, "VENTAS", 0, 1, 'C');
    $hoja->SetFont('Arial', 'B', 22);
    $hoja->Cell(210, 30, "Listado de Ventas", 0, 1, 'C');
    $hoja->SetFont('Arial', 'B', 12);
    //COLUMNAS CLIENTE
    $hoja->Cell(40, 10, "Documento", 1, 0, 'C');
    $hoja->Cell(90, 10, "Nombre", 1, 0, 'C');
    $hoja->Cell(50, 10, "Telefono", 1, 1, 'C');
    //DATOS CLIENTE
    $hoja->Cell(40, 10, $cliente->documento, 1, 0, 'C');
    $hoja->Cell(90, 10, $cliente->nombre, 1, 0, 'C');
    $hoja->Cell(50, 10, $cliente->telefono, 1, 1, 'C');

//AGREGAR UN SALTO DE LINEA PARA SEPARAR BLOQUES DE DATOS
    $hoja->Ln();
    
    $hoja->SetFont('Arial', 'I', 10);
    //COLUMNAS ARTICULOS
    $hoja->Cell(30, 10, "Codigo", 1, 0, 'C');
    $hoja->Cell(30, 10, "Cantidad", 1, 0, 'C');
    $hoja->Cell(50, 10, "Descripción", 1, 0, 'C');
    $hoja->Cell(30, 10, "Precio", 1, 0, 'C');
    $hoja->Cell(30, 10, "Subtotal", 1, 1, 'C');

    //DATOS ARTICULOS
    foreach($articulos as $a) {
        $hoja->Cell(30,10,$a->codigo,1,0,'C');
        $hoja->Cell(30,10,$a->cantidad,1,0,'C');
        $hoja->Cell(50,10,$a->descripcion,1,0,'C');
        $hoja->Cell(30,10,$a->precio,1,0,'C');
        $hoja->Cell(30,10,($a->precio*$a->cantidad),1,1,'C');
        
    }

    $hoja->Output();
    ;
}
