<?php
include 'conn.php';
$hour=$_POST['hour'];
$hourmax=$_POST['hour_max'];
$hournot=$_POST['hour_not'];
$hournow=$_POST['hour_now'];
$date_res=$_POST['date_res'];
$id_loisir=$_POST['id_loisir'];
$capacite=$_POST['capacite'];


$queryResult=$connect->query("SELECT * FROM horaire WHERE horaire.id_horaire>='".(int)$hour."'
AND horaire.id_horaire<'".(int)$hourmax."'
AND NOT(horaire.id_horaire='".(int)$hournot."')
AND horaire.id_horaire>'".(int)$hournow."'
AND NOT horaire.id_horaire IN (SELECT horaire.id_horaire FROM horaire WHERE (SELECT COUNT(reservation.id_horaire) FROM reservation WHERE reservation.id_horaire=horaire.id_horaire AND reservation.date_res='".$date_res."' AND reservation.id_loisir='".$id_loisir."')='".(int)$capacite."')");

$result=array();
while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);



