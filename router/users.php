<?php
require_once("require.php");
require_once(ROOT_DIRECTORY."components/users.php");

if ($method === "GET") {
  if (isset($_GET["id"])) {
    retrieveByID($_GET["id"], $_GET["token"]);
  } else {
    retrieve($_GET["token"]);
  }
} else if ($method === "POST") {
  if (isset($_POST["action"]) && $_POST["action"] === "activate") {
    activate($_POST["id"], $_POST["token"]);
  } else {
    create($_POST, $_POST["token"]);
  }
} else if ($method === "DELETE") {
  $data = getData();

  deactivate($data["id"], $data["token"]);
} else if ($method === "PATCH") {
  $data = getData();

  update($data, $data["token"], $data["id"]);
}