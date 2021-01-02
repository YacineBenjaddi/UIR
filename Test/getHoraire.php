<?php
include 'conn.php';
$type=$_POST['type'];
$horaire="reservation_$type";

$queryResult=$connect->query("SELECT * FROM  $horaire JOIN horaire ON horaire.id_horaire=$horaire.id_horaire");
$result=array();
while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);