<h1>Tareas</h1>
<div class="row col-md-12 centered">
    <table class="table table-striped custab">
        <thead>
        <a href="<?php echo WEBROOT;?>tasks/create/" class="btn btn-primary btn-xs pull-right"><b>+</b> Añadir tarea</a>
        <tr>
            <th>ID</th>
            <th>Tarea</th>
            <th>Descripcion</th>
            <th class="text-center">Accion</th>
        </tr>
        </thead>
        <?php
            foreach ($tasks as $task)
            {
                echo '<tr>';
                echo "<td>" . $task['task_id'] . "</td>";
                echo "<td>" . $task['title'] . "</td>";
                echo "<td>" . $task['description'] . "</td>";
                echo "<td class='text-center'><a class='btn btn-info btn-xs' href='". WEBROOT."tasks/edit/" . $task["task_id"] . "' ><span class='glyphicon glyphicon-edit'></span> Editar</a> <a href='". WEBROOT."tasks/delete/" . $task["task_id"] . "' class='btn btn-danger btn-xs'><span class='glyphicon glyphicon-remove'></span> Borrar</a></td>";
                echo "</tr>";
            }
        ?>
    </table>
</div>