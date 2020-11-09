<?php
include 'conn.php';


if($_SERVER['REQUEST_METHOD']=="POST"){

	 $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "uir";
    
 
 $conn = new mysqli($servername, $username, $password, $dbname);
$response = array();
$email = $_POST['email'];
$password = $_POST['password'];




	$update = mysqli_query($conn, "UPDATE User SET password ='$password' WHERE email='$email' ");
	$response['value']=1;
	echo json_encode($response);

}


?>
