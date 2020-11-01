<?php
include 'conn.php';
$email=isset($_POST['email']) ? $_POST['email'] : '';

$queryResult=$connect->query("SELECT * FROM test WHERE email='".$email."' ");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);