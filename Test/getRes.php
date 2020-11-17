<?php
include 'conn.php';
$id_user=isset($_POST['id_user']) ? $_POST['id_user'] : '';

$queryResult=$connect->query("SELECT  * FROM reservation_tennis t WHERE t.id_user='".$id_user."' UNION SELECT * FROM reservation_basket b WHERE b.id_user= '".$id_user."' UNION SELECT * FROM reservation_foot f WHERE f.id_user='".$id_user."' ");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);