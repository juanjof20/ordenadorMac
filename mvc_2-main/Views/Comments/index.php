<h1>Comments</h1>
<div class="row col-md-12 centered">
    <table class="table table-striped custab">
        <thead>
        <a href="<?php echo WEBROOT;?>comments/create/" class="btn btn-primary btn-xs pull-right"><b>+</b> Add Comment</a>
        <tr>
            <th>ID</th>
            <th>User_id</th>
            <th>Post_id</th>
            <th>Body</th>
            <th class="text-center">Accion</th>
        </tr>
        </thead>
        <?php
            foreach ($comments as $comment)
            {
                echo '<tr>';
                echo "<td>" . $comment['id'] . "</td>";
                echo "<td>" . $comment['user_id'] . "</td>";
                echo "<td>" . $comment['post_id'] . "</td>";
                echo "<td>" . $comment['body'] . "</td>";
                echo "<td class='text-center'><a class='btn btn-info btn-xs' href='". WEBROOT."comments/edit/" . $comment["user_id"] . "' ><span class='glyphicon glyphicon-edit'></span> Editar</a> <a href='". WEBROOT."comments/delete/" . $comment["user_id"] . "' class='btn btn-danger btn-xs'><span class='glyphicon glyphicon-remove'></span> Borrar</a></td>";
                echo "</tr>";
            }
        ?>
    </table>
</div>