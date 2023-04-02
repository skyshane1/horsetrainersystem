<?php
/*
 * Copyright 2015 by Allen Tucker. This program is part of RMHP-Homebase, which is free 
 * software.  It comes with absolutely no warranty. You can redistribute and/or 
 * modify it under the terms of the GNU General Public License as published by the 
 * Free Software Foundation (see <http://www.gnu.org/licenses/ for more information).
 */
session_start();
?>
<html>
    <head>
        <title>
            CVHR Horse Training Management System
        </title>
        <link rel="stylesheet" href="newstyle.css" type="text/css" />
        <style>
        	#appLink:visited {
        		color: gray; 
        	}
        </style> 
    </head>
    <body>
        <div>
            <?PHP include('header.php'); ?>
            <div class="content">
                <?PHP
                include_once('domain/Horse.php');
                include_once('database/dbinfo.php');
                include_once('database/trainertohorsedb.php');

                $horse = retrieve_trainer_horse($_SESSION['ID']);

                echo($horse->get_horseName());
                date_default_timezone_set('America/New_York');
                ?>
            </div>
                    <?PHP //include('footer.inc'); ?>
        </div>
    </body>
</html>