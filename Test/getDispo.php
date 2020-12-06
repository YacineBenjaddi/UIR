<?php
include 'conn.php';
$date=$_POST['date_res'];
$type=$_POST['type'];
$hour=$_POST['hour'];
$capacite=$_POST['capacite'];
$reservation="reservation_$type";
$queryResult=$connect->query("SELECT horaire.id_horaire , horaire.creneau

 FROM horaire

 WHERE NOT horaire.id_horaire IN (SELECT $reservation.id_horaire from $reservation WHERE $reservation.date_res='".$date."' AND COUNT() ) AND horaire.id_horaire>'".(int)$hour."'");

$result=array();
if(mysqli_num_rows($queryResult)==0 || mysqli_num_rows($queryResult)<$capacite ){ 
    $queryResult=$connect->query("SELECT horaire.creneau,horaire.id_horaire FROM horaire WHERE  horaire.id_horaire>'".(int)$hour."'");
    $result=array();
}

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);