<?php
/*
 * Copyright 2013 by Allen Tucker. 
 * This program is part of RMHP-Homebase, which is free software.  It comes with 
 * absolutely no warranty. You can redistribute and/or modify it under the terms 
 * of the GNU General Public License as published by the Free Software Foundation
 * (see <http://www.gnu.org/licenses/ for more information).
 * 
 */
if ($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['destroySession'])) {
    session_destroy();
}
if ($_SESSION['access_level'] != 2 and $_SESSION['access_level'] != 1) {
    echo'<script> location.replace("login_form.php"); </script>';
}
?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="newstyle.css"/>
</head>
<div class="container">
    <a href="index.php" class="hlink">Home</a>
    <a href="about.php" class="hlink">About</a>
    <?php if ($_SESSION['access_level'] == 2) {
        echo('<div class="dropdown">');
        echo('<button class="dropbtn">Trainer Actions</button>');
        echo('<div class="dropdown-content">');
        echo('<a href="viewHorse.php?selectedHorse= "><u>Search Horse</u></a>');
        echo('<a href="horseActions.php?formAction=addHorse"><u>Add Horse</u></a>');
        echo('<a href="horseActions.php?formAction=selectHorse"><u>Update Horse</u></a>');
        echo('<a href="horseActions.php?formAction=removeHorse"><u>Remove Horse</u></a>');
        echo('</div>');
        echo('</div>');
    } else if ($_SESSION['access_level'] == 1) {
        echo('<a href="viewHorse.php?selectedHorse= " class="hlink">Search Horse</a>');
    }
    ?>
    <div class="dropdown">
        <button class="dropbtn">Behavior Actions</button>
        <div class="dropdown-content">
            <a href="behaviorActions.php?formAction=searchBehavior"><u>Search Behaviors</u></a>
            <a href="behaviorActions.php?formAction=addBehavior"><u>Add Behavior</u></a>
            <a href="behaviorActions.php?formAction=selectBehavior"><u>Edit Behavior</u></a>
            <a href="behaviorActions.php?formAction=removeBehavior"><u>Remove Behavior</u></a>
        </div>
    </div>
            <?php if ($_SESSION['access_level'] == 2) {
                echo('<div class="dropdown">');
                echo('<button class="dropbtn">Trainer Actions</button>');
                echo('<div class="dropdown-content">');
                echo('<a href="personActions.php?formAction=addPerson"><u>Add Trainer</u></a>');
                echo('<a href="personActions.php?formAction=selectPerson"><u>Edit Trainer</u></a>');
                echo('<a href="personActions.php?formAction=searchPeople"><u>Search Trainers</u></a>');
                echo('<a href="personActions.php?formAction=removePerson"><u>Remove Trainer</u></a>');
                echo('</div>');
                echo('</div>');
            } else if ($_SESSION['access_level'] == 1) {
                echo('<a href="personActions.php?formAction=editPerson" class="hlink">Edit Account</a>');
            }
            ?>
    <a href="logout.php" class="hlink" style="float:right">Logout</a>
</div>
</html>

