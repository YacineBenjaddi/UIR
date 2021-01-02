
<?php
include 'conn.php';
$date=$_POST['date'];
$id_horaire=$_POST['id_horaire'];
$id_loisir=$_POST['id_loisir'];
$id_user=$_POST['id_user'];
$capacite=$_POST['capacite'];
$test;

$queryResult=$connect->query("SELECT * FROM reservation WHERE date_res='".$date."' AND id_user='".$id_user."' AND id_loisir='".$id_loisir."'");
$queryResult1=$connect->query("SELECT * FROM reservation WHERE date_res='".$date."' AND id_horaire='".$id_horaire."'");

$result=array();
if(mysqli_num_rows($queryResult)==0 && mysqli_num_rows($queryResult1)<$capacite){ 
 $link = mysqli_connect("localhost", "root", "", "uir");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
// Attempt insert query execution
$sql = "INSERT INTO reservation (id_user,id_horaire,date_res,id_loisir) VALUES ('$id_user','$id_horaire','$date','$id_loisir')";
mysqli_query($link, $sql);
// Close connection
mysqli_close($link);
$test="success";
}else{
$test="fail";
}
echo json_encode($test);

//$result=array();
/*echo json_encode($result);
$connect->close();*/
/*$sql = "INSERT INTO '".$reservation."'(id_user,id_horaire,date_res,type) VALUES ('".$id_user."', '".$id_horaire."','".$date."','".$type."'";
        $result = $connect->query($sql);
        echo "success";
        $connect->close();
        return;
*/

?>