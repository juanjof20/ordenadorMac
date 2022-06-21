<?php
    class Dispatcher
    {
        private $request;

        public function dispatch()
        {
            $this->request = new Request();
            Router::parse($this->request->url, $this->request);

            $controllers = array(
                'users'=>['index','create','edit','delete','error'],
                'comments'=>['index','create','edit','delete','error'],
                'posts'=>['index','delete','error']
                );
            
            if (array_key_exists($this->request->controller, $controllers))
            {
                if (in_array($this->request->action, $controllers[$this->request->controller]))
                {
                    $controller = $this->loadController();
                    call_user_func_array([$controller, $this->request->action], $this->request->params);
                } else
                {
                    $this->request->controller = "tasks";//cambiar tasks por comments
                    $controller = $this->loadController();
                    call_user_func_array([$controller,"error"], array('<strong>ERROR:</strong> la acción no existe'));
                }
            } else
            {
                $this->request->controller = "tasks";
                $controller = $this->loadController();
                call_user_func_array([$controller,"error"], array('<strong>ERROR:</strong> el controlador no existe'));
            }        
        }

        public function loadController()
        {
            $name = $this->request->controller . "Controller";
            $file = ROOT . 'Controllers/' . $name . '.php';
            require($file);
            $controller = new $name();
            return $controller;
        }
    }
?>