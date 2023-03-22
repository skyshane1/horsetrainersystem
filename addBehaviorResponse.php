<?php
    session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Page page</title>
</head>

<body>
    <div id="container">
        <?PHP include('header.php'); ?>
        <center>
            <?php
                include_once('database/behaviordb.php');
                include_once('database/dbinfo.php');
                include_once('domain/Behavior.php');
                /*
                $con = mysqli_connect("localhost", "root", "", "homebasedb");
                
                if($con === false){
                    die("ERROR: Could not connect.");
                }
                */

                $title = $_REQUEST['title'];
                $behaviorLevel =  $_REQUEST['behaviorLevel'];

                // Create a new Behavior object.
                $behavior = new Behavior($title, $behaviorLevel);

                // Add the behavior to the database.
                $success = add_behavior($behavior);

                /*
                $sql = "INSERT INTO `behaviordb`(`title`, `behaviorLevel`) VALUES ('$title','$behaviorLevel')";
                
                if(mysqli_query($con, $sql)){
                    echo "<h3>Successful Entry!</h3>";
        
                    echo nl2br("\n$title\n $behaviorLevel\n");
                } else{
                    echo "ERROR: Hush! Sorry $sql. "
                        . mysqli_error($con);
                }
                mysqli_close($con);
                */

                if ($success) {
                    echo "<h3>Successful Entry!</h3>";
                    echo nl2br("\n$title\n $behaviorLevel\n");
                } else {
                    echo "ERROR: Hush! Sorry $sql. "
                        . mysqli_error($con);
                }
            ?>
        </center>
    </div>
</body>
</html>