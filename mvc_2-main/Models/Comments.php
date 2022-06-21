<?php
    class Comments extends Model
    {
        public function create($id, $user_id, $post_id, $body)
        {
            $sql = "INSERT INTO comments (id, user_id, post_id, body) VALUES (:id, :user_id, :post_id, :body)"; // Tengo que poner el created_at??
            try
            {
                $req = Database::getBdd()->prepare($sql);
                return $req->execute([
                    'id' => $id,
                    'user_id' => $user_id,
                    'post_id' => $post_id,
                    'body' => $body
                ]);
            } catch(PDOException $e)
            {
                print_r($e->getMessage());
            }
        }

        public function showComments($id)
        {
            $sql = "SELECT * FROM comments WHERE id =" . $id;
            try
            {
                $req = Database::getBdd()->prepare($sql);
                $req->execute();
                return $req->fetch();
            } catch(PDOException $e)
            {
                print_r($e->getMessage());
            }
        }

        public function showAllComments()
        {
            $sql = "SELECT * FROM comments";
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

        public function edit($id, $user_id, $post_id, $body) // o solo body??
        {
            $sql = "UPDATE comments SET user_id = :user_id, post_id = :post_id, body = :body WHERE id = :id";
            try
            {
                $req = Database::getBdd()->prepare($sql);
                return $req->execute([
                    'id' => $id,
                    'user_id' => $user_id,
                    'post_id' => $post_id,
                    'body' => $body//created_at????
                ]);
            } catch(PDOException $e)
            {
                print_r($e->getMessage());
            }
        }

        public function delete($id)
        {
            $sql = 'DELETE FROM comments WHERE id = ?';
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