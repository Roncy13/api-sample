<?php


define("POST", "POST");
define("GET", "GET");
define("DELETE", "DELETE");
define("PATCH", "PATCH");
define("PUT", "PUT");

function getServerMethod() {
	return $_SERVER['REQUEST_METHOD'];
}

function getData() {
  parse_str(file_get_contents("php://input"), $data);

  return $data;
}

$method = getServerMethod();