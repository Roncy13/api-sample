<?php
require_once(ROOT_DIRECTORY."components/require.php");

function retrieve() {
  try {
    $conn = getConnection(); 

    $stmt = $conn->prepare("SELECT * FROM categories");
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC); 

    $result = $stmt->fetchAll();
    
    response($result, "Categories List Retrieved Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function retrieveByID($id) {
 try {
    $conn = getConnection(); 

    $stmt = $conn->prepare("SELECT * FROM categories where id = :id");
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC); 

    $result = $stmt->fetch();

    response($result, "Categories With ID: {$id} Retrieved Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function create($name) {
  try {
    $conn = getConnection(); 
    $stmt = $conn->prepare("INSERT into categories (name) values (:name)");
    $stmt->bindParam(':name', $name);
    $stmt->execute();

    $id = $conn->lastInsertId();
    
    $result = retrieveByID($id);
    
    response($result, "Category With Name: {$name} Created Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function update($name, $id) {
  try {
    $conn = getConnection(); 

    $stmt = $conn->prepare("update categories set name = :name where id = :id");
    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
   
    $result = retrieveByID($id);
    
    response($result, "Category With Name: {$name} Updated Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function deactivate($id) {
  try {
    $conn = getConnection(); 

    $stmt = $conn->prepare("update categories set status = false where id = :id");
    $stmt->bindParam(':id', $id);
    $stmt->execute();
   
    $result = retrieveByID($id);
    
    response($result, "Category With Name: {$name} Deactivated Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function activate($id) {
  try {
    $conn = getConnection(); 

    $stmt = $conn->prepare("update categories set status = true where id = :id");
    $stmt->bindParam(':id', $id);
    $stmt->execute();
   
    $result = retrieveByID($id);
    
    response($result, "Category With Name: {$name} Activated Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}