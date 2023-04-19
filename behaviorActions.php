<?php
/*
 * Copyright 2015 by Allen Tucker. This program is part of RMHC-Homebase, which is free 
 * software.  It comes with absolutely no warranty. You can redistribute and/or 
 * modify it under the terms of the GNU General Public License as published by the 
 * Free Software Foundation (see <http://www.gnu.org/licenses/ for more information).
 */
/*
 * 	behaviorEdit.php
 *  oversees the editing of a behavior to be added, edited, or deleted from the database
 */
session_cache_expire(30);
session_start();

include_once('database/behaviordb.php');
include_once('database/dbinfo.php');
include_once('domain/Behavior.php');

$formAction = $_GET["formAction"];
$behaviorToAdd;
$behaviorToEdit;
$oldTitle;

function process_form($title, $behavior, $action) {

    //If the user used the form to add a behavior, 
    if ($action == "add") {

        //try to add a new behavior to the database.

        //Check if there's already an entry.
        $dup = retrieve_behavior($title);

        //If there's already a behavior with this title,
        if ($dup == true) {

            //print an error message.
            echo('<p class="error">Unable to alter the database. <br>Another behavior named ' . $title . ' already exists.<br><br>'); 
            echo('<p>If you wish to add another behavior, please click "Add Behavior" after "Behavior Actions."</p>');
        }

        //Else, this behavior would be a new entry,
        else {            

            //so add it to the database.
            $result = add_behavior($behavior);

            //Another check to see if the behavior to add already exists.
            if (!$result) 
                echo('<p class="error">Unable to add to the database. <br>Please report this error.');
            else 
                echo('<p>You have successfully added ' . $behavior->get_title() . ' to the database! If you wish to add another behavior, please click "Add Behavior" after "Behavior Actions."</p>');
        }
    }

    //Else, if the user used the form to edit a behavior,
    else if($action == "edit") {

        //edit the existing behavior in the database.
        $result = edit_behavior($title, $behavior);

        if (!$result) 
            echo('<p class="error">Unable to edit the database. <br>Please report this error.');
        else 
            echo('<p>You have successfully edited the database! If you wish to edit another behavior, please click "Edit Behavior" after "Behavior Actions."</p>');
    }

    //Else, the user wants to remove a behavior (FOR LATER),
    else {

        //so remove a behavior from the database.
        $result = remove_behavior($title); 
        if (!$result) 
            echo('<p class="error">Unable to remove from the database. <br>Please report this error.');
        else 
            echo('<p>You have successfully removed ' . $title . ' the database! If you wish to remove another behavior, please click "Remove Behavior" after "Behavior Actions."</p>');
    }
}

?>
<html>
    <head>
        <title>
            <?PHP
            
                //Set the page title based on what the user wants to do.
                if($formAction == 'searchBehavior') {
                    echo("Search Behaviors");
                }
                else if($formAction == 'addBehavior')  {
                    echo('Add Behavior information');
                }
                else if($formAction == 'confirmAdd') {
                    echo('Add Behavior');
                }
                else if($formAction == 'selectBehavior') {
                    echo("Select Behavior to Edit");
                }
                else if($formAction == 'editBehavior') {
                    echo("Edit Behavior Information");
                }
                else if($formAction == 'confirmEdit') {
                    echo("Edit Behavior");
                }
                else if($formAction == 'removeBehavior') {
                    echo("Select Behavior to Remove");
                }
                else { //$formAction == 'confirmRemove'
                    echo("Remove Behavior");
                }
            ?>
        </title>
        <link rel="stylesheet" href="lib/jquery-ui.css"/>
        <link rel="stylesheet" href="newstyle.css" type="text/css"/>
        <script src="lib/jquery-1.9.1.js"></script>
        <script src="lib/jquery-ui.js"></script>
    </head>
    <body>
        <div>
            <?PHP include('header.php'); ?>
            <div class="content">
                <?PHP 

                //If the user wanted to search all behaviors,
                if($formAction == 'searchBehavior') {

                    //check if there are behaviors in the database to search.
                    $numBehaviors = get_numBehaviors();

                    //If there aren't any behaviors in the database, 
                    if($numBehaviors== 0) {

                        //display an error messsage.
                        echo("<p><strong>There are no behaviors to search.</strong></p>");
                        echo('<p>Please add behaviors using the "Add Behavior" link next to "Behavior Actions".</p><br>');
                    }

                    //Else, there are behaviors in the database,
		    else {
			echo "<form action='behaviorActions.php'>";
                        echo("<input type='hidden' name='formAction' value='searchBehavior'>");
			//so retrieve and show all of the behaviors in a table.
			    if (isset($_GET['searchoption'])){
			    	$searchValue = $_GET['searchoption'];
			    }    
			    if (empty($searchValue)){
				$allBehaviors = getall_behaviordb();			 
			    }
			    else{
			    	$allBehaviors = filter_behaviordb($searchValue);
			    }
                        echo("<h2>List of behaviors</h2>");
			    echo("<br>");
			if($allBehaviors > 0){
                        echo("<table class='infoTable'>
                                <tr>
                                    <th>Title</th>
                                    <th>Level</th>
                                </tr>");
                        if($allBehaviors != 0){
                        	for($x = 0; $x < count($allBehaviors); $x++) {
	                            echo("<tr>
        	                            <td> " . $allBehaviors[$x]->get_title() . " </td>
                	                    <td> " . $allBehaviors[$x]->get_behaviorLevel() . " </td>
                        	    </tr>");
	                        }	
			}
			}
			else{
				echo "No Behaviors Match Your Search";
			}
                        echo("</table>");  
			
                        echo("<input type='hidden' name='formAction' value='searchBehavior'>");
                        echo("<input type='text' placeholder='Search for Behavior' name='searchoption'>");
                        echo("<button type='submit' class='btn'>Search</button>");
		    }
		    echo "</form>";
                }
                //Else, if the user wants to add a behavior,
                else if($formAction == 'addBehavior') {


                    //show the form to add/edit behavior information.
                    include('editBehaviorForm.inc');
                }

                //Else, if the user has submitted behavior information to add,
                else if($formAction == 'confirmAdd') {

                    //attempt to validate and process the form.
                    include('behaviorValidate.inc'); 

                    //If the form has not been submitted (somehow),
                    if ($_POST['_form_submit'] != 1) {

                        //show it again.
                        include('behaviorEditForm.inc');
                    }

                    //Else, the form has been submitted,
                    else {

                        //so retrieve the form answers and validate it.
                        $newTitle = $_POST['behaviorTitle'];
                        $newLevel = $_POST['behaviorLevel'];
                        $newBehavior = new Behavior($newTitle, $newLevel);

                        $errors = validate_form($newBehavior);
                        //errors array lists problems on the form submitted

                        //If the user left required fields blank,
                        if ($errors) {

                            //display the errors and the form to fix.
                            show_errors($errors);
                            include('editBehaviorForm.inc');
                        }

                        //Else, this was a successful form submission,
                        else {

                            //so process the form to add a behavior.
                            process_form($newTitle, $newBehavior, "add");
                            echo ('</div>');
                       //include('footer.inc');
                            echo('</div></body></html>');
                            die();
                        }

                    }
                }

                //Else, if the user wants to edit a behavior,
                else if($formAction == 'selectBehavior') {

                    //check if there are behaviors in the database to edit.
                    $numBehaviors = get_numBehaviors();

                    //If there aren't any behaviors in the database, 
                    if($numBehaviors == 0) {
                        echo("<p><strong>There are no behaviors to edit.</strong></p>");
                        echo('<p>Please add behaviors using the "Add Behavior" link next to "Behavior Actions".</p><br>');
                    }

                    //Else, display the form for selecting a behavior to edit.
                    else {
                        include('getBehaviorForm.inc');
                    }    
                }

                //Else, if the user has selected a behavior to edit,
                else if($formAction == 'editBehavior') {

                    //get the old title of the behavior, in case the user edited the title.
                    $oldTitle = $_POST['behaviorTitle'];

                    //Then, display the form for adding/editing behaviors.
                    include("editBehaviorForm.inc");
                }

                //Else, if the user has submitted behavior information to edit,
                else if($formAction == 'confirmEdit') {
                    
                    include('behaviorValidate.inc'); 
                    $oldTitle = $_POST['oldTitle'];
                    $newTitle = $_POST['behaviorTitle'];
                    $newLevel = $_POST['behaviorLevel'];

                    //attempt to validate and process the form.
                    //If the form has not been submitted (somehow, cuz this code shouldn't run),
                    if ($_POST['_form_submit'] != 1) {

                        //show the form again.
                        include('editBehaviorForm.inc');
                    }

                    //Else, the form has been submitted,
                    else {

                        //so validate it. BTW, the parameter doesn't matter, because "validate_form" uses the form's $_POST values, NOT the parameter.
                        $errors = validate_form($behavior);
                        //errors array lists problems on the form submitted.

                        //If the user left required fields blank,
                        if ($errors) {

                            //display the errors and the form again.
                            show_errors($errors);
                            include('editBehaviorForm.inc');
                        }
                                
                        //Else, if the user changed the title of a behavior to a title that already exists,
                            //Conditions: (1) The behavior must exist, and (2) the user wants to change the title of the existing behavior.
                            //If the user left the title the same, then the existing behavior will be edited under the same title.
                        else if((retrieve_behavior($newTitle)) && (strcmp($oldTitle, $newTitle) != 0)) {
                            
                            //print that the user cannot change a behavior name to an existing name, and then show the form again.
                            echo("<h4>" . $newTitle . " is the title of an existing behavior. Please enter another title.</h4><br>");
                            include("editBehaviorForm.inc");
                        }
                    
                        //Else, this was a successful form submission,
                        else {

                            //so create a Behavior object and process the form to edit a behavior.
                            $behaviorToEdit = new Behavior($newTitle, $newLevel);
                            process_form($oldTitle, $behaviorToEdit, "edit");
                            echo ('</div>');
                            //include('footer.inc');
                            echo('</div></body></html>');
                            die();
                        }
                    } 
                }

                //Else, if the user wants to remove a behavior,
                else if ($formAction == 'removeBehavior') { //For removing behaviors, will have "selectBehavior" and "removeBehavior" as "formAction" values.
                    
                    //check if there are behaviors in the database to edit.
                    $numBehaviors = get_numBehaviors();
                    
                    //If there aren't any behaviors in the database, 
                    if($numBehaviors == 0) {
                        echo("<p><strong>There are no behaviors to remove.</strong></p>");
                        echo('<p>Please add behaviors using the "Add Behavior" link next to "Behavior Actions".</p><br>');
                    }

                    //Else, display the form for selecting a behavior to edit.
                    else {
                        include('getBehaviorForm.inc');
                    }  
                }

                else if($formAction == 'confirmRemove') {

                    //attempt to validate and process the form.
                    include('behaviorValidate.inc'); 
                    $oldTitle = $_POST['behaviorTitle'];

                    //If the form has not been submitted (somehow).
                    if ($_POST['_form_submit'] != 1) {

                        //show the form again.
                        include('editBehaviorForm.inc');
                    }

                    //Else, the form has been submitted,
                    else {

                        //so validate it. BTW, the parameter doesn't matter, because "validate_form" uses the form's $_POST values, NOT the parameter.
                        $errors = validate_form($behavior);
                        //errors array lists problems on the form submitted.

                        //If the user left required fields blank,
                        if ($errors) {

                            //display the errors and the form again.
                            show_errors($errors);
                            include('editBehaviorForm.inc');
                        }
                                                    
                        //Else, this was a successful form submission,
                        else {

                            //so create a Behavior object and process the form to remove a behavior.
                            //Removing only requires the name, so this behavior is created JUST to have a valid parameter.
                            $behaviorToRemove = new Behavior($oldTitle, $newLevel);
                            process_form($oldTitle, $behaviorToRemove, "remove");
                            echo ('</div>');
                            //include('footer.inc');
                            echo('</div></body></html>');
                            die();
                        }
                    } 
                }

                ?>
            </div>
            <?PHP //include('footer.inc'); ?>
        </div>
    </body>
</html>    
