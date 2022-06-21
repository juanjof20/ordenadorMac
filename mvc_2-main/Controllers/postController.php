<?php
    class postController extends Controller
    {
        function index()
        {
            require(ROOT . 'Models/Post.php');
            $post = new Post();

            $d['post'] = $post->showAllPosts();
            $this->set($d);
            $this->render("index");
        }

        function delete($id)
        {
            require(ROOT . 'Models/Post.php');
            $post = new Post();

            if ($post->delete($id))
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