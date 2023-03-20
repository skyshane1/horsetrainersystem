<?php
/*
 * Copyright 2015 by Allen Tucker. 
 * This program is part of RMHP-Homebase, which is free software.  It comes with 
 * absolutely no warranty. You can redistribute and/or modify it under the terms 
 * of the GNU General Public License as published by the Free Software Foundation
 * (see <http://www.gnu.org/licenses/ for more information).
 * 
 */

/*
 * This file is only the connection information for the database.
 * This file will be modified for every installation.
 * @author Max Palmer <mpalmer@bowdoin.edu>
 * @version updated 2/12/08
 */

//Create a connection to the database
    //If the directions are the same as the Fall 2022 semester, these credentials are correct.
function connect() {
    $host = "localhost"; 
    $username = "homebasedb";
    $password = "homebasedb";
    $database = "homebasedb";

    $con = mysqli_connect($host, $username, $password, $database);
    if (!$con) { 
        echo "not connected to server"; 
        return mysqli_error($con);
    }
    $selected = mysqli_select_db($con,$database);
    if (!$selected) { 
        echo "database not selected"; 
        return mysqli_error($con); 
    }
    else {
        return $con;
    } 
    
}

?>

<?php 
/*
<HTML>
    <HEAD>
        <TITLE>
            Database Info
        </TITLE>
    <HEAD>
    <BODY>
        <?php connect() ?>
    </BODY>
</HTML>
*/
?>

