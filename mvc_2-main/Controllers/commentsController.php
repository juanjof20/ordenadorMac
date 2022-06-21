<?php
    class commentsController extends Controller
    {
        function index()
        {
            require(ROOT . 'Models/Comments.php');
            $comments = new Comments();

            $d['comments'] = $comments->showAllComments();
            $this->set($d);
            $this->render("index");
        }

        function create()
        {
            require(ROOT . 'Models/Post.php');
            require(ROOT . 'Models/Users.php');

            $users = new User();
            $posts = new Post();

            $a['users'] = $users->showAllUsers();
            $this->set($a);
            
            $d['posts'] = $posts->showAllPosts();
            $this->set($d);

            if (isset($_POST["id"]) && isset($_POST["user_id"]) && isset($_POST["post_id"]) && isset($_POST["body"]))
            {
                require(ROOT . 'Models/Comments.php');
                $comments= new Comments();

                if ($comments->create($_POST["id"], $_POST["user_id"]), $_POST["post_id"], $_POST["body"]))
                {
                    header("Location: " . WEBROOT . "comments/index");
                }
            }
            $this->render("create");
        }

        function edit($id)
        {
            require(ROOT . 'Models/Comments.php');
            $comments= new Comments();
            $d["comments"] = $comments->showComments($id);
            
            if (isset($_POST["body"]))
            {
                if ($comments->edit($id, $_POST["body"]))
                {
                    header("Location: " . WEBROOT . "comments/index");
                }
            }
            $this->set($d);
            $this->render("edit");
        }

        function delete($id)
        {
            require(ROOT . 'Models/Comments.php');
            $comments = new Comments();

            if ($comments->delete($id))
            {
                header("Location: " . WEBROOT . "comments/index");
            }
        }

        function error($m)
        {
            $d["error"] = $m;
            $this->set($d);
            $this->render("error");
        }
    }
?>