<?php
require_once(ROOT_DIRECTORY."components/require.php");

function checkLogin($username, $password) {
  $conn = getConnection();
  $oldPass = $password;
  try {
    $stmt = $conn->prepare('
      SELECT 
        u.*, ul.name 
      FROM users as u
      INNER JOIN
        user_level as ul 
      ON ul.id = u.user_level_id
      WHERE u.username = :username AND u.password = :password LIMIT 1
    ');
    $password = sha1($password);

    $stmt->bindParam('username', $username);
    $stmt->bindParam('password', $password);

    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC); 

    $result = $stmt->fetch();

    if ($result) {
      unset($result["password"]);

      $token = generateToken($result["id"]);

      $result["authDetails"] = $token;
      response($result, "Login Succesfully");
    } else {
      unauthorizedError(array("username" => $username, "password" => $oldPass), "Username / Password Incorrect");
    }

  } catch(Exception $e) {
    serverError($e->getMessage());
  }
}

function generateToken($user_id) {
  $conn = getConnection();
  $token = sha1(uniqid());
  try {
    $stmt = $conn->prepare('
      INSERT INTO user_token 
      (
        token,
        user_id,
        date_expired
      )
      VALUES
      (
        :token,
        :user_id,
        DATE_ADD(NOW(), INTERVAL 1 DAY)
      )
    ');
    
    $stmt->bindParam('user_id', $user_id);
    $stmt->bindParam('token', $token);

    $stmt->execute();

    $insertID = $conn->lastInsertId();
   
    $stmtToken = $conn->prepare("
      SELECT date_expired, token From user_token where id = {$insertID}
    ");

    $stmtToken->execute();
    $stmtToken->setFetchMode(PDO::FETCH_ASSOC); 

    return $stmtToken->fetch();
  } catch(Exception $e) {
    serverError($e->getMessage());
  }
}