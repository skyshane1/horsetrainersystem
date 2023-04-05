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
    <div class="dropdown">
        <button class="dropbtn">Horse Actions</button>
        <div class="dropdown-content">
            <a href="viewHorse.php?selectedHorse= "><u>Search Horse</u></a>
            <a href="addHorseForm.php"><u>Add Horse</u></a>
            <a href="horseActions.php?formAction=selectHorse"><u>Update Horse</u></a>
            <a href="horseActions.php?formAction=removeHorse"><u>Remove Horse</u></a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn">Behavior Actions</button>
        <div class="dropdown-content">
            <a href="behaviorActions.php?formAction=searchBehavior"><u>Search Behaviors</u></a>
            <a href="addBehaviorForm.php"><u>Add Behavior</u></a>
            <a href="behaviorActions.php?formAction=selectBehavior"><u>Edit Behavior</u></a>
            <a href="behaviorActions.php?formAction=removeBehavior"><u>Remove Behavior</u></a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn">Trainer Actions</button>
        <div class="dropdown-content">
            <a href="personActions.php?formAction=searchPeople"><u>Search Trainers</u></a>
            <a href="personActions.php?formAction=addPerson"><u>Add Trainer</u></a>
            <?php if ($_SESSION['access_level'] == 2) {
                echo('<a href="personActions.php?formAction=selectPerson"><u>Edit Trainer</u></a>');
            } else if ($_SESSION['access_level'] == 1) {
                echo('<a href="personActions.php?formAction=editPerson"><u>Edit Account</u></a>');
            }
            if ($_SESSION['access_level'] == 2) {
                echo('<a href="personActions.php?formAction=removePerson"><u>Remove Trainer</u></a>');
            } ?>
        </div>
    </div>
    <a href="logout.php" class="hlink" style="float:right">Logout</a>
</div>
</html>

