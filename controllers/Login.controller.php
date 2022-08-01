<?php

    require_once('../views/component/footer.page.php');
    require_once('../views/component/header.page.php');
    require_once('../inc/Utilities/LoginManager.class.php');
    require_once('../inc/Utilities/PDOService.php');
    require_once('../inc/Utilities/UsersDAO.class.php');
    require_once('../views/Login.page.php');
    require_once('../inc/config.inc.php');
    require_once('../models/Users.class.php');

    if(!empty($_POST))
    {
        UsersDAO::initialize(USERS);

        if(isset($_POST['email'])){
            $user = UsersDAO::getUser($_POST['email']);
            if($user && LoginManager::verifyPassword($_POST['password'], $user->getPassword()))
            {
                session_start();
                $_SESSION['username'] = array('Email'=> $user->getEmail(), 'Name' => $user->getFname()." ". $user->getLname());
                $_SESSION['user_role'] = $user->getRole(); //for click on logo -> go back to home page purpose
                if($user->getRole() == ROLE_ADMIN){
                    header(LOCATION_ADMIN);
                    exit;
                }
                if($user->getRole() == ROLE_USER){
                    header(LOCATION_USER_ENTRANCE);
                    exit;
                }
                
            }
            else{
                // echo "Something wrong with Password or User Name !!!";
                PageLogin::$notification['loginError'] = "Email or password is invalid";
            }
        }
    }

    PageHeader::header();
    PageLogin::login();