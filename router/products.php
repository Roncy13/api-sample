<?php
require_once("require.php");
require_once(ROOT_DIRECTORY."components/products.php");

if ($method === "GET") {
  if (isset($_GET["id"])) {
    echo "Get Via ID";
  } else {
    retrieve();
  }
} else if ($method === "POST") {
  if (isset($_POST["action"]) && $_POST["action"] === "update") {
    update($_POST, $_FILES, $_POST["id"]);
  } else {
    create(array_merge($_POST, $_FILES));
  }
} else if ($method === "DELETE") {
  echo "DELETE STATUS";
}