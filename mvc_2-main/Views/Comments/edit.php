<h1>Create a Comments</h1>
<form method='post' action='#'>

    <div class="form-group">
        <label for="id">ID</label>
        <input type="text" class="form-control" id="id" placeholder="Enter an id" name="id" value ="<?php if (isset($users["id"])) echo $users["id"];?>">
    </div>

    <div class="form-group">
        <label for="user_id">User_id</label>
        <input type="text" class="form-control" id="user_id" placeholder="Enter an user_id" name="user_id" value ="<?php if (isset($users["user_id"])) echo $users["user_id"];?>">
    </div>

    <div class="form-group">
        <label for="post_id">Post_id</label>
        <input type="text" class="form-control" id="post_id" placeholder="Enter a post_id" name="post_id" value ="<?php if (isset($users["post_id"])) echo $users["post_id"];?>">
    </div>

    <div class="form-group">
        <label for="body">Body</label>
        <input type="text" class="form-control" id="body" placeholder="Enter a body" name="body" value ="<?php if (isset($users["body"])) echo $users["body"];?>">
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>