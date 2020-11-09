<?php
include 'conn.php';
$id_user=isset($_POST['id_user']) ? $_POST['id_user'] : '';

$queryResult=$connect->query("SELECT * FROM blacklist WHERE id_user='".$id_user."' ");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);