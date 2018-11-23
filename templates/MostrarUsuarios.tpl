{include file="header.tpl"}

<div class="">
  <h1 class="titulo">{$Titulo}</h1>

  <div class="container">
    <ul class="list-group">
          {foreach from=$Usuarios item=usuario}
            {if $usuario['esAdmin'] == 0}

              <li class="list-group-item"> USUARIO:  {$usuario['nombre']} ----- CLAVE:  {$usuario['clave']} <a class="btn btn-danger btn-block-sm" href="BorrarUsuario/{$usuario['id_usuario']}" role="button">BORRAR</a>  <a class="btn btn-warning btn-block-sm" href="asignarAdmin/{$usuario['id_usuario']}" role="button">ASIGNAR ADMIN </a> </li>
            {else}
            <li class="list-group-item">USUARIO:{$usuario['nombre']} ----- CLAVE:{$usuario['clave']} <a class="btn btn-danger btn-block-sm" href="BorrarUsuario/{$usuario['id_usuario']}" role="button">BORRAR</a></li>
            {/if}

          {/foreach}
    </ul>
  </div>
</div>



{include file="footer.tpl"}
