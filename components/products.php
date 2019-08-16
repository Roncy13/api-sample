<?php 
require_once(ROOT_DIRECTORY."components/require.php");

function retrieve() {
  try {
    $conn = getConnection(); 

    $stmt = $conn->prepare("SELECT * FROM products");
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC); 

    $result = $stmt->fetchAll();
    
    response($result, "Products List Retrieved Successfully");

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function retrieveByID($id, $bool = true) {
 try {
    $conn = getConnection(); 

    $stmt = $conn->prepare("SELECT * FROM products where id = :id");
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC); 

    $result = $stmt->fetch();

    if($bool) {
      response($result, "Products With ID: {$id} Retrieved Successfully");
    }

    return $result;

  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function create($create) {
  try {
    $conn = getConnection(); 
    $type = explode(".", $create["picture"]['name']);
    $type = end($type);
    $file_name = sha1($create["picture"]['name'].uniqid()).".".$type;
    $file_size = $create["picture"]['size'];
    $file_tmp = $create["picture"]['tmp_name'];
    $file_type = $_FILES['picture']['type'];
    $directory = ROOT_DIRECTORY."uploads/".$file_name;
    $create["picture"] = $directory;

    if ($file_size > 2097152) {
      response(
          array(),
          "File Size must be 2mb or below...!",
          500
      );
    }

    if (move_uploaded_file($file_tmp, $directory)) {
        $stmt = $conn->prepare("INSERT into products (name, description, category_id, image) values (:name, :description, :category_id, :image)");
        $stmt->bindParam(':name', $create["name"]);
        $stmt->bindParam(':description', $create["description"]);
        $stmt->bindParam(':category_id', $create["category_id"]);
        $directory = PROJECT_HOST."uploads/".$file_name;
        $stmt->bindParam(':image', $directory);
        $stmt->execute();

        $id = $conn->lastInsertId();
        
        $result = retrieveByID($id, false);
        
        response($result, "Product With Name: {$create['name']} Created Successfully");
    } else {
        $this->send(
            array(),
            "File Unsuccessfully Uploaded",
            500
        );
    }
  } catch(Exception $err) {
    serverError($err->getMessage());
  }
}

function update($update, $files = array(), $id) {
  try {
   
    $conn = getConnection(); 

    $bool = false;
    $file_name = "";

    if (!empty($files)) {
      $type = explode(".", $files["picture"]['name']);
      $type = end($type);
      $file_name = sha1($files["picture"]['name'].uniqid()).".".$type;
      $file_size = $files["picture"]['size'];
      $file_tmp = $files["picture"]['tmp_name'];
      $file_type = $_FILES['picture']['type'];
      $directory = ROOT_DIRECTORY."uploads/".$file_name;
      $update["picture"] = $directory;

      if ($file_size > 2097152) {
        response(
            array(),
            "File Size must be 2mb or below...!",
            500
        );
      }

      $bool = move_uploaded_file($file_tmp, $directory);
    }
   
    if ($bool) {
      $stmt = $conn->prepare("
            UPDATE PRODUCTS
              SET name = :name,
              description = :description,
              category_id = :category_id,
              image = :image
            WHERE id = :id
      ");
      $stmt->bindParam(':name', $update["name"]);
      $stmt->bindParam(':description', $update["description"]);
      $stmt->bindParam(':category_id', $update["category_id"]);
      $directory = PROJECT_HOST."uploads/".$file_name;
      $stmt->bindParam(':image', $directory);
      $stmt->bindParam(':id', $id);
      $stmt->execute();
      
    } else {
      $stmt = $conn->prepare("
            UPDATE PRODUCTS
              SET name = :name,
              description = :description,
              category_id = :category_id
            WHERE id= :id
      ");
      $stmt->bindParam(':name', $update["name"]);
      $stmt->bindParam(':description', $update["description"]);
      $stmt->bindParam(':category_id', $update["category_id"]);
      $stmt->bindParam(':id', $id);
      $stmt->execute();
    }

    $result = retrieveByID($id, false);
        
    response($result, "Product With Name: {$update['name']} Updated Successfully");
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