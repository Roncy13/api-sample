<?php
require_once("require.php");
require_once(ROOT_DIRECTORY."components/login.php");

if ($method === "POST") {
  checkLogin($_POST["username"], $_POST["password"]);
}