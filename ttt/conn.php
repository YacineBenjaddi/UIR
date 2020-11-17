<?php
$connect = new mysqli("localhost","root","","uir");
if ($connect) {
	# code...
} else {
	echo "connection failed";
	exit();
}