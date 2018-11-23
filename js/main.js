'use strict';


let templateEquipos;
let templateComentarios;
let templateComentarioslog;
let templatePublicacion;

fetch('js/templates/comentarios_admin.handlebars')
.then(response => response.text())
.then(template => {
    templateComentarios = Handlebars.compile(template); // compila y prepara el template
    getComentarios();

});
fetch('js/templates/comentarios.handlebars')
.then(response => response.text())
.then(template => {
    templateComentarioslog = Handlebars.compile(template); // compila y prepara el template
    getComentariosLog();
});

fetch('js/templates/publicacion.handlebars')
.then(response => response.text())
.then(template => {
    templatePublicacion = Handlebars.compile(template); // compila y prepara el template
    getFormPublicacion();
});


function getFormPublicacion() {
  let nombre=document.querySelector('#nombre-usuario').innerHTML;
  fetch("api/jugador")
  .then(response => response.json())
  .then(jsonJugadores=> {
      let jugadores=jsonJugadores;
      let context = { // como el assign de smarty
          usuario:nombre,
          Jugadores:jugadores,
      }
      document.querySelector("#publicacion-container").innerHTML =templatePublicacion(context) ;
      document.querySelector("#js-addComentario").addEventListener("click",create);
    })
}

function getComentarios() {
    fetch("api/comentario")
    .then(response => response.json())
    .then(jsonComentarios=> {
        mostrarComentarios(jsonComentarios);
      })
}
function getComentariosLog() {
    fetch("api/comentario")
    .then(response => response.json())
    .then(jsonComentarios=> {
        mostrarComentariosLog(jsonComentarios);
      })
}
function mostrarComentariosLog(jsonComentarios) {

    let context = { // como el assign de smarty
        Comentarios: jsonComentarios,


    }
    let html2 = templateComentarioslog(context);
    document.querySelector("#comentariosLog-container").innerHTML = html2;
    //asignarEventoBorrarComentario();
}

function mostrarComentarios(jsonComentarios) {

    let context = { // como el assign de smarty
        Comentarios: jsonComentarios,


    }
    let html2 = templateComentarios(context);
    document.querySelector("#comentarios-container").innerHTML = html2;
    asignarEventoBorrarComentario();
}


function asignarEventoBorrarComentario(){

  var botones = document.querySelectorAll('.js-delComentario');
  botones.forEach(function(boton) {
    var z = boton.value;
    boton.addEventListener('click', function() {borrarComentario(z);});

  });
}
function borrarComentario(z){
  alert(z);
  let id=z;
  let url= "api/comentario/" +id;
  fetch(url, {
    method: 'DELETE',
    mode: 'cors',
    headers: {
      'Content-Type': 'application/json'
    },
  })
  .then(r=>{console.log(r);});//refresh a la pagina
}

function create(){

  let comentario=document.querySelector("#comentario").value;
  let id_usuario=document.querySelector("#id-usuario").value;
  let jugador=document.querySelector("#jugador").value;
  let imagen=document.querySelector("#imagen").value;
  let publicacion ={
    "comentario":comentario,
    "id_usuario":id_usuario,//aca tiene  q ir el usuario logueado.
    "id_jugador":jugador,//aca va el id de un jugador q exista, sino da error
    "imagen":imagen
  }

 alert(JSON.stringify(publicacion));
  let url= "api/comentario";
  fetch(url, {
    method: 'POST',
    mode: 'cors',
    headers: {
      'Content-Type':'application/json'
    },
    body: JSON.stringify(publicacion)


  })
  .then(r=>{console.log(r);});//refresh;
}
/*
fetch('js/templates/equipos.handlebars')
.then(response => response.text())
.then(template => {
    templateEquipos = Handlebars.compile(template); // compila y prepara el template
    getEquipos();
});*/
function getEquipos() {
    fetch("api/equipo")
    .then(response => response.json())
    .then(jsonEquipos => {
        mostrarEquipos(jsonEquipos);
    })
}
function mostrarEquipos(jsonEquipos) {
    let context = { // como el assign de smarty
        Equipos: jsonEquipos,
    //    otra: "hola"
    }
    let html = templateEquipos(context);
    document.querySelector("#equipos-container").innerHTML = html;
}
