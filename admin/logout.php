<?php

session_start();
unset($_SESSION['ADMIN_LOGIN']);
unset($_SESSION['ADMIN_USER']);
header('Location:login.php');
die();
?>