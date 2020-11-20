<?php
include 'conn.php';
$hour=$_POST['hour'];
$hourmax=$_POST['hour_max'];
$hournot=$_POST['hour_not'];
$hournow=$_POST['hour_now'];
$queryResult=$connect->query("SELECT *  FROM horaire_piscine  WHERE horaire_piscine.id_horaire>='".(int)$hour."' AND horaire_piscine.id_horaire<'".(int)$hourmax."' AND NOT(horaire_piscine.id_horaire='".(int)$hournot."') AND horaire_piscine.id_horaire>'".(int)$hournow."'") ;


$result=array();
while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);