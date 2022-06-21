<?php
    class Task extends Model
    {
        public function create($title, $description)
        {
            $sql = "INSERT INTO tasks (title, description, created_at, updated_at) VALUES (:title, :description, :created_at, :updated_at)";
            try
            {
                $req = Database::getBdd()->prepare($sql);
                return $req->execute([
                    'title' => $title,
                    'description' => $description,
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s')
                ]);
            }
            catch(PDOException $e)
            {
                print_r($e->getMessage());
            }
        }

        public function showTask($id)
        {
            $sql = "SELECT * FROM tasks WHERE task_id =" . $id;
            try
            {
                $req = Database::getBdd()->prepare($sql);
                $req->execute();
                return $req->fetch();
            }
            catch(PDOException $e)
            {
                print_r($e->getMessage());
            }
        }

        public function showAllTasks()
        {
            $sql = "SELECT * FROM tasks";
            try
            {
                $req = Database::getBdd()->prepare($sql);
                $req->execute();
                return $req->fetchAll();
            }
            catch(PDOException $e)
            {
                print_r($e->getMessage());
            }
        }

        public function edit($id, $title, $description)
        {
            $sql = "UPDATE tasks SET title = :title, description = :description , updated_at = :updated_at WHERE task_id = :task_id";
            try{
                $req = Database::getBdd()->prepare($sql);
                return $req->execute([
                    'task_id' => $id,
                    'title' => $title,
                    'description' => $description,
                    'updated_at' => date('Y-m-d H:i:s')
                ]);
            }
            catch(PDOException $e)
            {
                print_r($e->getMessage());
            }
        }

        public function delete($id)
        {
            $sql = 'DELETE FROM tasks WHERE task_id = ?';
            try{   
                $req = Database::getBdd()->prepare($sql);
                return $req->execute([$id]);
            }
            catch(PDOException $e){
                print_r($e->getMessage());
            }
        }
    }
?>