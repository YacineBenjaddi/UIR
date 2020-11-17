<?php
include 'conn.php';
$id_loisir=isset($_POST['id_loisir']) ? $_POST['id_loisir'] : '';

$queryResult=$connect->query("SELECT photos.id_photo,photos.nom FROM photos  WHERE photos.id_loisir='".$id_loisir."' ");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);