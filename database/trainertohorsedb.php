<?php
    include_once('dbinfo.php');
    include_once(dirname(__FILE__).'/../domain/Horse.php');
    include_once(dirname(__FILE__).'/../database/horsedb.php');
    function retrieve_trainer_horse($ID) {
        //Create a database connection and retrieve the horse from the database.
        $con=connect();
        $query = "SELECT * FROM trainertohorsedb WHERE trainerId='" . $ID . "';";
        $result = mysqli_query($con,$query);

        //If the horse does NOT exist in the database,
        if (mysqli_num_rows($result) != 1) {

            //close the connection and return false.
            mysqli_close($con);
            return false;
        }

        //Otherwise, create a Horse object from the query row and return the object.
        $result_row = mysqli_fetch_assoc($result);

        $query = "SELECT * FROM horsedb WHERE horseName='" . $result_row['horseName'] . "';";
        $result = mysqli_query($con,$query);

        //If the horse does NOT exist in the database,
        if (mysqli_num_rows($result) != 1) {

            //close the connection and return false.
            mysqli_close($con);
            return false;
        }
        $result_row = mysqli_fetch_assoc($result);
        $theHorse = make_a_horse($result_row);
        return $theHorse;
    }
?>
