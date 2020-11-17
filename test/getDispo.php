<?php
include 'conn.php';
$date=$_POST['date_res'];
$type=$_POST['type'];
$hour=$_POST['hour'];
$reservation="reservation_$type";
$queryResult=$connect->query("SELECT horaire.creneau,horaire.id_horaire FROM horaire JOIN $reservation WHERE NOT(
$reservation.id_horaire=horaire.id_horaire) AND date_res ='".$date."' AND horaire.id_horaire>'".(int)$hour."'");

$result=array();
if(mysqli_num_rows($queryResult)==0){ 
    $queryResult=$connect->query("SELECT horaire.creneau,horaire.id_horaire FROM horaire WHERE  horaire.id_horaire>'".(int)$hour."'");
    $result=array();
}

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);