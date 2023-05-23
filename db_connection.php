<?php
$servername = "localhost";
$username = "root"; //replace root with your db username
$password = "password"; //replace password with your db password

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$db_name = 'email_management';

if (!$conn->select_db($db_name)) {
    die("Failed to select database: " . $conn->error);
}
