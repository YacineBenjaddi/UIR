<?php
$connect = new mysqli("localhost","root","","test");
if ($connect) {
	# code...
} else {
	echo "connection failed";
	exit();
}