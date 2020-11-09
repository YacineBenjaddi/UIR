<?php
include 'conn.php';


$queryResult=$connect->query("SELECT * FROM horraire_foot");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);