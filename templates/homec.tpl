{include file="header.tpl"}
{include file="navbar.tpl"}

<button id="refresh" type="button" class="btn btn-default btn-xs pull-right" aria-label="Refresh">
  <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
</button>
<div class="container" id="equipos-container">

</div>

  <div class="row">
    <div class="container col-lg-4 col-sm-12">
      <h1 class="titulo">{$Titulo1}</h1>
    <table class="table table-bordered table-dark col-3">
      <thead>
      <tr>
        <th scope='col'>nombre_equipo</th>
        <th scope='col'>pos_tabla</th>
        <th scope='col'>clasificacion_copa</th>
      </tr>
    </thead>
    <tbody>
        <tr>
          {foreach from=$equipos item=equipo}
            <tr><td>{$equipo['nombre_equipo']}</td>
              <td>{$equipo['pos_tabla']}</td>
              <td>{$equipo['clasificacion_copa']}</td>

            </tr>
           {/foreach}
        </tr>

      </tbody>
    </table>
    </div>






    <div class="container col-lg-8 col-sm-12">
    <h1 class="titulo">{$Titulo2}</h1>
    <table class="table table-bordered table-dark col-9">
    <thead>
    <tr>

      <th scope="col">
        <form class="" method="get">
          <select class="custom-select" name="sel_equipo" >
            <option value="" >EQUIPO</option>
            {foreach from=$equipos item=equipo}

            <option value= {$equipo['id_equipo']} >{$equipo['nombre_equipo']}</option>
            {/foreach}
          </select>
          <button name="filtro" type="submit" class="btn btn-success">filtrar</button>
        </form>

      </th>
      <th scope="col">dorsal</th>
      <th scope="col">nombre de jugador</th>
      <th scope="col">fecha nacimiento</th>
      <th scope="col">altura</th>
    </tr>
    </thead>
    <tbody>
    <tr>

     {foreach from=$jugadores item=jugador}

     <tr>
        <td>
         {foreach from=$equipos item=equipo}
          {if $equipo['id_equipo'] eq {$jugador['id_equipo']}}
            {$equipo['nombre_equipo']}
            {/if}
          {/foreach}
          </td>
          <td>{$jugador['dorsal']}</td>
          <td>{$jugador['nombre_jugador']}</td>
          <td>{$jugador['fecha_nac']}</td>
          <td>{$jugador['altura']}</td>
    </tr>

      {/foreach}

      </tr>
    </tbody>
    </table>

    </div>


  </div>
  <div class="container" id="comentariosLog-container">

  </div>

  {include file="footer.tpl"}
