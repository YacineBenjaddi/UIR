
<?php
include 'conn.php';
$id_res=$_POST['id_res'];
$type=$_POST['type'];
$reservation="reservation_$type";
$test;


        $sql = "DELETE FROM $reservation WHERE id_res = $id_res"; 
        if($connect->query($sql) === TRUE){
            $test="success";
        }else{
            $test="error";
        }
        $connect->close();
       echo json_encode($test);
 

?>