<?php
require_once("require.php");
require_once(ROOT_DIRECTORY."components/category.php");

if ($method === "GET") {
  if (isset($_GET["id"])) {
    retrieveByID($_GET["id"]);
  } else {
    retrieve();
  }
} else if ($method === "POST") {
  if (isset($_POST["action"]) && $_POST["action"] === "activate") {
    activate($_POST["id"]);
  } else {
    create($_POST["name"]);
  }
} else if ($method === "DELETE") {
  $data = getData();

  deactivate($data["id"]);
} else if ($method === "PATCH") {
  parse_str(file_get_contents('php://input'), $data);

  update($data["name"], $data["id"]);
}