<?php
require_once(ROOT_DIRECTORY."components/require.php");

function retrieve($token) {
  try {
    $conn = getConnection(); 

    checkToken($token);

    $stmt = $conn->prepare("SELECT * FROM users");
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC); 

    $result = $stmt->fetchAll();
    
    response($result, "User List Retrieved Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function retrieveByID($id, $token, $bool = true) {
 try {
    $conn = getConnection();

    checkToken($token);
    
    $stmt = $conn->prepare("SELECT * FROM users where id = :id");
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC); 

    $result = $stmt->fetch();

    if ($bool) {
      response($result, "User With ID: {$id} Retrieved Successfully");
    }

    return $result;

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function create($data, $token) {
  try {
    $conn = getConnection();
    $data["password"] = sha1($data["password"]);

    checkSuperUser($token);

    $stmt = $conn->prepare("INSERT into users (full_name, username, password, user_level_id) values (:full_name, :username, :password, :user_level_id)");
    $stmt->bindParam(':full_name', $data["full_name"]);
    $stmt->bindParam(':username', $data["username"]);
    $stmt->bindParam(':password', $data["password"]);
    $stmt->bindParam(':user_level_id', $data["user_level_id"]);

    $stmt->execute();

    $id = $conn->lastInsertId();
    
    $result = retrieveByID($id, $token);
    
    response($result, "User With Name: {$name} Created Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function update($data, $token, $id) {
  try {
    $conn = getConnection();

    checkSuperUser($token);

    $data["password"] = sha1($data["password"]);

    $stmt = $conn->prepare("update users set full_name = :full_name, username = :username, password = :password, user_level_id= :user_level_id where id = :id");
    $stmt->bindParam(':full_name', $data["full_name"]);
    $stmt->bindParam(':username', $data["username"]);
    $stmt->bindParam(':password', $data["password"]);
    $stmt->bindParam(':user_level_id', $data["user_level_id"]);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
   
    $result = retrieveByID($id, $token, false);
    
    response($result, "User With Name: {$data['full_name']} Updated Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function deactivate($id, $token) {
  try {
    $conn = getConnection(); 
    checkSuperUser($token);

    $stmt = $conn->prepare("update users set status = false where id = :id");
    $stmt->bindParam(':id', $id);
    $stmt->execute();
   
    $result = retrieveByID($id, $token, false);
    
    response($result, "User With Name: {$result['username']} Deactivated Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function activate($id, $token) {
  try {
    $conn = getConnection();

    checkSuperUser($token);

    $stmt = $conn->prepare("update users set status = true where id = :id");
    $stmt->bindParam(':id', $id);
    $stmt->execute();
   
    $result = retrieveByID($id, $token, false);
    
    response($result, "User With Name: {$result['username']} Activated Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}