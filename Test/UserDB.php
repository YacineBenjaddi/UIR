<?php
 
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "uir";
    $table = "User"; 
    $table1 = "reservation"; 
 
    $action = $_POST["action"];
     

    $conn = new mysqli($servername, $username, $password, $dbname);
   
    if($conn->connect_error){
        die("Connection Failed: " . $conn->connect_error);
        return;
    }
 
   

    if("GET_ALL" == $action){
        $db_data = array();
        $sql = "SELECT id_user,first_name,last_name,email,password,penalty,gender,profile from $table ORDER BY id_user DESC";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

   

    if("ADD_USER" == $action){
        $first_name = $_POST["first_name"];
        $last_name = $_POST["last_name"];
        $email = $_POST["email"];
        $password = $_POST["password"];
        $penalty = $_POST["penalty"];
        $gender = $_POST["gender"];
        $profile = $_POST["profile"];

        $sql = "INSERT INTO $table (first_name,last_name,email,password,penalty,gender,profile) VALUES ('$first_name','$last_name','$email','$password','$penalty','$gender',$profile')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }

 if("ADD_RESERVATION" == $action){
       
         $id_user = $_POST["id_user"];
        $id_restaurant = $_POST["id_restaurant"];
        $hour = $_POST["hour"];
        $date_res = $_POST["date_res"];
        

        $sql = "INSERT INTO $table1 (id_user,id_restaurant,hour,date_res) VALUES ('$id_user', '$id_restaurant','$hour','$date_res')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }

 
   
    if("UPDATE_USER" == $action){
        
        $id_user = $_POST['id_user'];
         $last_name = $_POST["last_name"];
        $first_name = $_POST["first_name"];
        $email = $_POST["email"];
        $password = $_POST["password"];
        $profile = $_POST["profile"];
        $sql = "UPDATE $table SET last_name = '$last_name', first_name = '$first_name' , email = '$email', password = '$password' , profile = '$profile' WHERE id_user = $id_user";
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

  
  
 
  
    if('DELETE_USER' == $action){
        $id_user = $_POST['id_user'];
        $sql = "DELETE FROM $table WHERE id_user = $id_user"; 
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
 
?>