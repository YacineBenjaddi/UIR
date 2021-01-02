<?php
include 'conn.php';
$id_loisir=isset($_POST['id_loisir']) ? $_POST['id_loisir'] : '';

$queryResult=$connect->query("SELECT * FROM loisir WHERE id_loisir='".$id_loisir."' ");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);