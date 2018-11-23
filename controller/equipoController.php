<?php
require_once "./view/equipoView.php";
require_once "./model/equipoModel.php";
require_once "./controller/jugadorController.php";
require_once "./controller/usuarioController.php";
require_once "securedController.php";

class equipoController
{
  private $equipoView;
  private $TITULO;
  private $titulo1;
  private $titulo2;
  private $equipoModel;

    function __construct()
    {
    $this->equipoView=new equipoView();
    $this->equipoModel=new equipoModel();
    $this->usuarioController=new usuarioController();
    $this->jugadorController=new jugadorController();
    $this->titulo1="Equipos de la Superliga  Argentina";
    $this->titulo2="Jugadores de la Superliga  Argentina";
    $this->tituloedit="editar jugador";
    $this->Titulo="HOME";
    }

  function home(){
    $jugadores =$this->filtro_equipo();
    $equipos = $this->equipoModel->getEquipos();
    session_start();
    if(isset($_SESSION["User"])){


      if($_SESSION["Admin"]){
        $temp="homeAdmin";
        $usuario =$this->usuarioController->getUser($_SESSION["User"]);
        $this->equipoView->mostrar($this->Titulo,$this->titulo1,$this->titulo2,$jugadores,$equipos,$temp,$usuario);
      }
      else {
          $temp="homeLogueado";
          $usuario =$this->usuarioController->getUser($_SESSION["User"]);
          $this->equipoView->mostrar($this->Titulo,$this->titulo1,$this->titulo2,$jugadores,$equipos,$temp,$usuario);
      }
    }
    else {
        $temp="homec";
        $usuario="visitante";
        $this->equipoView->mostrar($this->Titulo,$this->titulo1,$this->titulo2,$jugadores,$equipos,$temp,$usuario);
    }
}


 function editEquipo($param){
     $id_equipo = $param[0];
     $equipo = $this->equipoModel->getEquipo($id_equipo);
     $this->equipoView->muestraFormEquipo($this->tituloedit,$equipo);
 }
 function guardarEquipo(){
   $id_equipo = $_POST['id_equipo'];
   $nombreequipo = $_POST['nombre_equipo'];
   $postabla = $_POST['pos_tabla'];
   $clasificacioncopa = $_POST['clasificacion_copa'];
   if ($id_equipo=="") {
     $this->equipoModel->addEquipo($id_equipo,$nombreequipo,$postabla,$clasificacioncopa);
     header(HOME);
   }
   else {
     $this->equipoModel->guardarEquipo($id_equipo,$nombreequipo,$postabla,$clasificacioncopa);
     header(HOME);
   }
 }


 function  removeEquipo($param){
     $this->equipoModel->removeEquipo($param[0]);//id_equipo
     header(HOME);
 }
 function addEquipo(){
     $equipo=0;
     $this->equipoView->muestraFormEquipo($this->tituloedit,$equipo);
 }
 function adddEquipo($param){

  $nombreequipo = $_POST['nombre_equipo'];
  $postabla = $_POST['pos_tabla'];
  $clasificacioncopa = $_POST['clasificacion_copa'];
  if(isset($nombreequipo) && !empty($postabla) && !empty($clasificacioncopa)){
      $this->equipoModel->addEquipo($nombreequipo,$postabla,$clasificacioncopa);
    }
  }


/*function getEquipo(){
 $nombreequipo = $_POST['nombre_equipo'];
 if(isset($_POST['nombre_equipo'])) {
     $equipo=$this->equipoModel->getEquipo($nombreequipo);
     $jugadores=$this->equipoModel->getJugadores($equipo['id_equipo']);
     $this->equipoView->mostrar($equipo,$jugadores);
   }
 }*/
 function filtro_equipo(){
  if (isset($_GET['sel_equipo']) && ($_GET['sel_equipo']!= "")) {
       $sel_equipo=$_GET['sel_equipo'];
        $jugadores =$this->jugadorController->getJugadoresEquipo($sel_equipo);
       }
  else {
         $jugadores =$this->jugadorController->getJugadores();
       }
return $jugadores;
}




}
?>
