<h1>Edit an User</h1>
<form method='post' action='#'>

    <div class="form-group">
        <label for="id">ID</label>
        <input type="text" class="form-control" id="id" placeholder="Enter an id" name="id" value ="<?php if (isset($users["id"])) echo $users["id"];?>">
    </div>

    <div class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name" placeholder="Enter a name" name="name" value ="<?php if (isset($users["name"])) echo $users["name"];?>">
    </div>

    <div class="form-group">
        <label for="email">Email</label>
        <input type="text" class="form-control" id="email" placeholder="Enter an email" name="email" value ="<?php if (isset($users["email"])) echo $users["email"];?>">
    </div>

    <div class="form-group">
        <label for="password">Password</label>
        <input type="text" class="form-control" id="password" placeholder="Enter a password" name="password" value ="<?php if (isset($users["password"])) echo $users["password"];?>">
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>