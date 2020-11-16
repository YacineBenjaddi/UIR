<?php
include 'conn.php';
$id_user=isset($_POST['id_user']) ? $_POST['id_user'] : '';

$queryResult=$connect->query("SELECT * FROM reservation_foot INNER JOIN horraire ON reservation_foot.id_horaire=horraire.id_horaire WHERE id_user='".$id_user."' ");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);