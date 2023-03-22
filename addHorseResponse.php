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
        /* $con = mysqli_connect("localhost", "root", "", "homebasedb");
        
        if($con === false){
            die("ERROR: Could not connect.");
        }
        */

        include_once('database/horsedb.php');
        include_once('database/dbinfo.php');
        include_once('domain/Horse.php');

        $horseName =  $_REQUEST['horseName'];
        $color = $_REQUEST['color'];
        $breed =  $_REQUEST['breed'];
        $pastureNum = $_REQUEST['pastureNum'];
        $colorRank = $_REQUEST['colorRank'];
        
        // Create a new Horse object.
        $horse = new Horse($horseName, $color, $breed, $pastureNum, $colorRank);

        // Add the horse to the database.
        $success = add_horse($horse);

        /*
        $sql = "INSERT INTO horsedb  VALUES ('$id', '$horseName',
            '$color','$breed','$pastureNum','$colorRank')";
        
        if(mysqli_query($con, $sql)){
            echo "<h3>Successful Entry!</h3>";
 
            echo nl2br("\n$id\n $horseName\n $color\n "
                . "$breed\n $pastureNum\n $colorRank");
        } else{
            echo "ERROR: Hush! Sorry $sql. "
                . mysqli_error($con);
        }
        mysqli_close($con);
        */

        if ($success) {
            echo "<h3>Successful Entry!</h3>";
            echo nl2br("\n $horseName\n $color\n "
                . "$breed\n $pastureNum\n $colorRank");
        } else {
            echo "ERROR: Hush! Sorry $sql. "
                . mysqli_error($con);
        }
    ?>
    </center>
</div>
</body>
</html>