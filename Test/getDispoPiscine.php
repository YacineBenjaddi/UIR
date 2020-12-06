<?php
include 'conn.php';
$hour=$_POST['hour'];
$hourmax=$_POST['hour_max'];
$hournot=$_POST['hour_not'];
$hournow=$_POST['hour_now'];
$date_res=$_POST['date_res'];

$queryResult=$connect->query("SELECT * FROM horaire_piscine WHERE horaire_piscine.id_horaire>='".(int)$hour."'
AND horaire_piscine.id_horaire<'".(int)$hourmax."'
AND NOT(horaire_piscine.id_horaire='".(int)$hournot."')
AND horaire_piscine.id_horaire>'".(int)$hournow."'
AND NOT horaire_piscine.id_horaire IN (SELECT horaire_piscine.id_horaire FROM horaire_piscine WHERE (SELECT COUNT(reservation_piscine.id_horaire) FROM reservation_piscine WHERE reservation_piscine.id_horaire=horaire_piscine.id_horaire AND reservation_piscine.date_res='".$date_res."')=5)");

$result=array();
while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);



