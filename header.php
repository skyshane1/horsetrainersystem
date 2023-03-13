<?php
/*
 * Copyright 2013 by Allen Tucker. 
 * This program is part of RMHP-Homebase, which is free software.  It comes with 
 * absolutely no warranty. You can redistribute and/or modify it under the terms 
 * of the GNU General Public License as published by the Free Software Foundation
 * (see <http://www.gnu.org/licenses/ for more information).
 * 
 */
 
    echo('<form action="header.php" method="post">');
    	echo('<input type="submit" name="destroySession" value="Logout" />');
    echo('</form>');

    if($_SERVER['REQUEST_METHOD'] == "POST" AND ISSET($_POST['destroySession'])){
    	destroy_session();
    }



    if($_SESSION['access_level'] != 2 and $_SESSION['access_level'] != 1){
        header('Location: login_form.php');
    }

?>
<!-- Begin Header -->
<style type="text/css">
    h1 {padding-left: 0px; padding-right:165px;}
</style>
<div id="header">
<!--<br><br><img src="images/rmhHeader.gif" align="center"><br>
<h1><br><br>Homebase <br></h1>-->

</div>

<div align="center" id="navigationLinks">
    <?PHP    
        echo("<br><b>"."CVHR Horse Training Management System"."</b> ");
        echo('<br><br>');
        echo('<a href="' . $path . 'index.php">home</a>');
        echo(' | <a href="' . $path . 'about.php">about</a>');
        echo('</br>');
        //echo(' | <a href="' . $path . 'help.php?helpPage=' . $current_page . '" target="_BLANK">help</a>');
        //echo(' | calendars: <a href="' . $path . 'calendar.php?venue=portland'.''.'">Portland, </a>');
        //echo(' <a href="' . $path . 'calendar.php?venue=bangor'.''.'">Bangor</a>');
        //echo('<br>master schedules: <a href="' . $path . 'viewSchedule.php?venue=portland'."".'">Portland, </a>');
        //echo('<a href="' . $path . 'viewSchedule.php?venue=bangor'."".'">Bangor</a>');
        echo('<br>');
        echo('<strong>Horse Actions</strong>| 
                        <a href="horseActions.php?formAction=searchHorse"><u>Search Horse</u></a>,
                        <a href="horseActions.php?formAction=addHorse"><u>Add Horse</u></a>, 
                        <a href="horseActions.php?formAction=selectHorse"><u>Edit Horse</u></a>,
                        <a href="horseActions.php?formAction=removeHorse"><u>Remove Horse</u></a>');
        echo('<br><br>');
        echo('<strong>Behavior Actions</strong> | 
                        <a href="behaviorActions.php?formAction=searchBehavior"><u>Search Behaviors</u></a>, 
                        <a href="behaviorActions.php?formAction=addBehavior"><u>Add Behavior</u></a>, 
                        <a href="behaviorActions.php?formAction=selectBehavior"><u>Edit Behavior</u></a>,
                        <a href="behaviorActions.php?formAction=removeBehavior"><u>Remove Behavior</u></a>');
        echo('<br><br>');
        echo('<strong>Trainer Actions</strong> | 
                        <a href="personActions.php?formAction=searchPeople"><u>Search Trainers</u></a>, 
                        <a href="personActions.php?formAction=addPerson"><u>Add Trainer</u></a>, 
                        <a href="personActions.php?formAction=selectPerson"><u>Edit Trainer</u></a>,
                        <a href="personActions.php?formAction=removePerson"><u>Remove Trainer</u></a>');
        echo("<br><br>");

        echo("_______________________________________________________________________________________________________________________________________");
        echo("<br><br>");
        echo('<strong>Notes Actions</strong> (links later!) | 
                        <a><u>Search Training Notes</u></a>, 
                        <a><u>Add Training Notes</u></a>, 
                        <a><u>Edit Training Notes</u></a>,
                        <a><u>Remove Training Notes</u></a>');
        echo("<br><br>");
        echo('<strong>Management Actions</strong> (links later!) | 
                        <a><u>Assign Trainer</u></a>, 
                        <a><u>Unassign Trainer</u></a>, 
                        <a><u>Assign Behavior</u></a>,
                        <a><u>Unassign Behavior</u></a>');
    ?>
</div>
<!-- End Header -->
