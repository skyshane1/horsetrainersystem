<?php
    session_start();

    include_once('database/horsedb.php');
    include_once('database/dbinfo.php');
    include_once('domain/Horse.php');

    if(isset($_POST['update']))
    {
        /*
        $hostname ="localhost";
        $username ="root";
        $password = "";
        $databaseName = "homebasedb";

        $connect = mysqli_connect($hostname, $username, $password, $databaseName);
        */

        //get values form input text and number

        $oldName = $_POST['oldName'];
        $horseName = $_POST['horseName'];
        $color = $_POST['color'];
        $breed = $_POST['breed'];
        $pastureNum = $_POST['pastureNum'];
        $colorRank = $_POST['colorRank'];

        // Create a new Horse object.
        $horse = new Horse($horseName, $color, $breed, $pastureNum, $colorRank);

        // Update the horse to the database.
        $success = edit_horse($oldName, $horse);

        /*
        //sql query to update data
        $query = "UPDATE `horsedb` SET `horseName`='$horseName',`color`='$color',`breed`='$breed',`pastureNum`='$pastureNum',`colorRank`='$colorRank' WHERE 'id'=$ID";

        $result = mysqli_query($connect, $query);

        if($result)
        {
            echo "Data Updated";
        }else{
            echo "Data Not Updated";
        }
        mysqli_close($connect);
        */

        if ($success) {
            echo "Data Updated";
        } else {
            echo "Data Not Updated";
        }
    }
?>

<!DOCTYPE html>

<head>

</head>

<body>
<?PHP include('header.php'); ?>
<div class="content">
    <?PHP
    echo("<p><strong>Edit " . $horseName . "'s Information</strong></p>");
    echo("<p>Edit " . $horseName . "'s information as you wish. If you do not wish to change any information, please leave the fields untouched.</p>");
    echo("<p>When finished, hit <b>Edit " . $horseName . "</b> at the bottom of this page.</p>");
    echo("<p>(<span style='font-size:x-small;'>*</span> denotes required information).</p>"); ?>
        <form action="updateHorse.php" method="post">
            <h2>Edit Horse</h2>
        Old Name: <input type="text" name="oldName" required> <br><br>

        New Name: <input type="text" name="horseName" required> <br><br>

        New Color: <input type="text" name="color" required> <br><br>

        New Breed: <input type="text" name="breed" required> <br><br>

        New Pasture Number: <input type="text" name="pastureNum" required> <br><br>

        New Color Rank: <input type="text" name="colorRank" required> <br><br>

        <input type="submit" name="update" value="Update Data">

        </form>
    
</div>
</body>
</html>