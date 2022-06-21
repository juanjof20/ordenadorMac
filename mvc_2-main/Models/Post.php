<?php
    class Post extends Model
    {
        public function showAllPosts()
        {
            $sql = "SELECT * FROM post";
            try
            {
                $req = Database::getBdd()->prepare($sql);
                $req->execute();
                return $req->fetchAll();
            } catch(PDOException $e)
            {
                print_r($e->getMessage());
            }
        }

        public function delete($id)
        {
            $sql = 'DELETE FROM post WHERE id = ?';
            try
            {   
                $req = Database::getBdd()->prepare($sql);
                return $req->execute([$id]);
            } catch(PDOException $e)
            {
                print_r($e->getMessage());
            }
        }
    }
?>