<?php

if (!defined('ROOT_DIRECTORY')) {
  require_once("./constants.php");
}

if (!function_exists('response')) {
  require_once(ROOT_DIRECTORY."utilities/response.php");
}

function getConnection() {

    $servername = "localhost";
    $username = "root";
    $password = "";
    $db = "mini_ecomm";

    try {
        $conn = new PDO("mysql:host={$servername};dbname={$db}", $username, $password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        return $conn;
    } catch(Exception $e) {
        serverError($e->getMessage());
    }
}

function checkToken($token) {

  try {
    $conn = getConnection(); 

    $stmt = $conn->prepare("SELECT * FROM user_token where token = :token AND date_expired > NOW()");
    $stmt->bindParam(':token', $token);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC); 

    $result = $stmt->fetch();

    if (!$result) {
      unauthorizedError(array('token' => $token), "Token Not Authorized...!");
    }

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function checkSuperUser($token) {

  try {
    $conn = getConnection(); 

    $stmt = $conn->prepare("
      SELECT 
        us.* 
      FROM user_token as us
      INNER JOIN users as u
        ON u.id = us.user_id
      WHERE 
        us.token = :token AND us.date_expired > NOW() AND
        u.user_level_id = ".SUPER_USER."
    ");
    $stmt->bindParam(':token', $token);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC); 

    $result = $stmt->fetch();
    
    if (!$result) {
      unauthorizedError(array('token' => $token), "TOKEN IS Not Authorized / SuperUser...!");
    }

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}
?> 