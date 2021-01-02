<?php
include 'conn.php';
$id_user=isset($_POST['id_user']) ? $_POST['id_user'] : '';
$date_res=isset($_POST['date_res']) ? $_POST['date_res'] : '';
$hour=isset($_POST['hour']) ? $_POST['hour'] : '';

$queryResult=$connect->query("SELECT  * FROM reservation  WHERE reservation.id_user='".$id_user."' AND reservation.date_res>='".$date_res."'");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);