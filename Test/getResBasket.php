<?php
include 'conn.php';
$id_user=isset($_POST['id_user']) ? $_POST['id_user'] : '';

$queryResult=$connect->query("SELECT * FROM horraire INNER JOIN reservation_basket ON horraire.id_horaire=reservation_basket.id_horaire WHERE reservation_basket.id_user='".$id_user."' UNION ALLSELECT * FROM horraire INNER JOIN reservation_foot ON horraire.id_horaire=reservation_foot.id_horaire WHERE reservation_foot.id_user='".$id_user."' ");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);