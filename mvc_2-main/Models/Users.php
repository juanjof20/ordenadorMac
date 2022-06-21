<?php
    class Users extends Model
    {
        public function create($name, $email, $password)
        {
            $sql = "INSERT INTO users (name, email, password) VALUES (:name, :email, :password)";
            try
            {
                $req = Database::getBdd()->prepare($sql);
                return $req->execute([
                    'name' => $name,
                    'email' => $email,
                    'password' => $password
                ]);
            } catch(PDOException $e)
            {
                print_r($e->getMessage());
            }
        }

        public function showUser($id)
        {
            $sql = "SELECT * FROM users WHERE user_id =" . $id;
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

        public function showAllUsers()
        {
            $sql = "SELECT * FROM users";
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

        public function edit($name, $email, $password)
        {
            $sql = "UPDATE users SET name = :name, email = :email , password = :password WHERE user_id = :user_id"; //estos user_id donde se han declarado?
            try
            {
                $req = Database::getBdd()->prepare($sql);
                return $req->execute([
                    'name' => $name,
                    'email' => $email,
                    'password' => $password
                ]);
            } catch(PDOException $e)
            {
                print_r($e->getMessage());
            }
        }

        public function delete($id)
        {
            $sql = 'DELETE FROM users WHERE user_id = ?';
            try
            {   
                $req = Database::getBdd()->prepare($sql);
                return $req->execute([$id]);
            } catch(PDOException $e){
                print_r($e->getMessage());
            }
        }
    }
?>