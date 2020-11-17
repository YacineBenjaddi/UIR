<?php
 include 'conn.php';
 
    $image = $_POST['image'];
    $name = $_POST['name'];
    $email = $_POST['email'];

 	$realImage = base64_decode($image);

 	$image =$email.".jpg";
	
	file_put_contents($image, $realImage);
	$destination ="images/";

	rename($image, $destination.$image);

	

	move_uploaded_file ( $realImage,$destination );

  
  $connect->query("UPDATE user SET photo='$image' WHERE email = '$email' "); 
 
    echo "Image Uploaded Successfully.";
 
?>