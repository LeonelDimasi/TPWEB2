<div class="banner">
<h1></h1>
</div>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">SuperLiga</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="homeadmin">home<span class="sr-only">(current)</span></a>
        </li>

        <li class="nav-item active">
              <a class="nav-link titulo" href="MostrarUsuarios">MostrarUsuarios</a>
            </li>



      </ul>
    </div>
    <form class="form-inline">

      <input id="id-usuario" type="hidden" name="" value="{$usuario["0"]['id_usuario']}">
   <h1 class="usuario"id="nombre-usuario">{$usuario["0"]['nombre']}</h1>
    <a class="btn btn-danger btn-block" href="logout" role="button">Log Out</a>



</form>
  </nav>
