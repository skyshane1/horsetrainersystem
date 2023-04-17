<?php

/*
 * 	horseEdit.php: PHP file containig functionality for adding, editing, and removing horses. 
 */

//Some legacy code stuff that isn't being used.
session_cache_expire(30);
session_start();

//Include MySQL connection file, horse database functions, and horse class.
include_once('database/horsedb.php');
include_once('database/dbinfo.php');
include_once('domain/Horse.php');


//Declare global variables.
$formAction = $_GET["formAction"];
$horseToAdd;
$horseToEdit;
$oldName;
$oldBreed;
$oldColor;
$oldPastureNum;
$oldColorRank;


/*
 * Function name: process_form($name, $horse, $action)
 * Description: adds, edits, and removes horses from the database based on form input.
 * Parameters: 
 *      $name, the name of an existing horse in the database.
 *      $horse, a Horse object containing information to add to or edit the database with.
 *      $action, a string indicating what functions should be performed.
 * Return Values: None
 */
function process_form($name, $horse, $action) {

    //If the user used the form to add a horse, 
    if ($action == "add") {

        //try to add a new horse to the database.

        //Check if there's already an entry.
        $dup = retrieve_horse($name);

        //If there's already a horse with this name,
        if ($dup == true) {

            //print an error message.
            echo('<p class="error">Unable to alter the database. <br>Another horse named ' . $name . ' already exists.<br><br>'); 
            echo('<p>If you wish to add another horse, please click "Add Horse" after "Horse Actions."</p>');
        }

        //Else, this horse would be a new entry,
        else {            

            //so add it to the database.
            $result = add_horse($horse);

            //Another check to see if the horse to add already exists.
            if (!$result) 
                echo('<p class="error">Unable to add to the database. <br>Please report this error.');
            else 
                echo('<p>You have successfully added ' . $horse->get_horseName() . ' to the database! If you wish to add another horse, please click "Add Horse" after "Horse Actions."</p>');
        }
    }

    //Else, if the user used the form to edit a behavior,
    else if($action == "edit") {

        //edit the existing behavior in the database.
        $result = edit_horse($name, $horse);

        if (!$result) 
            echo('<p class="error">Unable to edit the database. <br>Please report this error.');
        else 
            echo('<p>You have successfully edited the database! If you wish to edit another horse, please click "Edit Horse" after "Horse Actions."</p>');
    }

    //Else, the user wants to remove a behavior (FOR LATER),
    else {

        //so remove a behavior from the database.
        $result = remove_horse($name); 
        if (!$result) 
            echo('<p class="error">Unable to remove from the database. <br>Please report this error.');
        else 
            echo('<p>You have successfully removed ' . $horse->get_horseName() . ' the database! If you wish to remove another horse, please click "Remove Horse" after "Horse Actions."</p>');
    }
}

?>
<html>
    <head>
        <title>
            <?PHP
            
                //Set the page title based on what the user wants to do.
                if($formAction == 'searchHorse') {
                    echo("Search Horses");
                }
                else if($formAction == 'addHorse')  {
                    echo('Add Horse Information');
                }
                else if($formAction == 'confirmAdd') {
                    echo('Add Horse');
                }
                else if($formAction == 'selectHorse') {
                    echo("Select Horse to Edit");
                }
                else if($formAction == 'editBehavior') {
                    echo("Edit Horse Information");
                }
                else if($formAction == 'confirmEdit') {
                    echo("Edit Horse");
                }
                else if($formAction == 'removeHorse') {
                    echo("Select Horse to Remove");
                }
                else { //$formAction == 'confirmRemove'
                    echo("Remove Horse");
                }
            ?>
        </title>
        <style>
            th, tr, td 
            {
                border-left: 1px solid black;
                border-right: 1px solid black;
                border-top: 1px solid black;
                border-bottom: 1px solid black;
            }
        </style>
        <link rel="stylesheet" href="lib/jquery-ui.css" />
        <link rel="stylesheet" href="newstyle.css" type="text/css" />
        <script src="lib/jquery-1.9.1.js"></script>
        <script src="lib/jquery-ui.js"></script>      
    </head>
    <body>
        <div>
            <?PHP include('header.php'); ?>
            <div class="content">
                <?PHP 

                //If the user wanted to search all horses,
                if($formAction == 'searchHorse') {

                    //check if there are horses in the database to edit.
                    $numHorses = get_numHorses();

                    //If there aren't any horses in the database, 
                    if($numHorses == 0) {
                        echo("<p><strong>There are no horses to search.</strong></p>");
                        echo('<p>Please add horses using the "Add Horse" link next to "Horse Actions".</p><br>');
                    }

                    //Else, there are horses in the database,
                    else {
                        //so retrieve and show all of the horses in a table.
                        $allHorses = getall_horsedb();

                        echo("<h2><strong>List of Horses</strong></h2>");
                        echo("<br>");
                        echo("<table>
                                <tr>
                                    <th>Name</th>
                                    <th>Color</th>
                                    <th>Breed</th>
                                    <th>Pasture Number</th>
                                    <th>Color Rank</th>
                                </tr>");
                        
                        for($x = 0; $x < count($allHorses); $x++) {
                            echo("<tr>
                                    <td> " . $allHorses[$x]->get_horseName() . " </td>
                                    <td style='border-left: 1px solid black'> " . $allHorses[$x]->get_color() . " </td>
                                    <td style='border-left: 1px solid black'> " . $allHorses[$x]->get_breed() . " </td>
                                    <td style='border-left: 1px solid black'> " . $allHorses[$x]->get_pastureNum() . " </td>
                                    <td style='border-left: 1px solid black'> " . $allHorses[$x]->get_colorRank() . " </td>
                                </tr>");
                        }
                        
                        echo("</table>");
                    }
                }
                //Else, if the user wants to add a behavior,
                else if($formAction == 'addHorse') {


                    //show the form to add/edit behavior information.
                    include('editHorseForm.inc');
                }

                //Else, if the user has submitted behavior information to add,
                else if($formAction == 'confirmAdd') {

                    //attempt to validate and process the form.
                    include('horseValidate.inc'); 

                    //If the form has not been submitted (somehow),
                    if ($_POST['_form_submit'] != 1) {

                        //show it again.
                        include('editHorseForm.inc');
                    }

                    //Else, the form has been submitted,
                    else {

                        //so retrieve the form answers and validate it.
                        $newName = $_POST['horseName'];
                        $newColor = $_POST['color'];
                        $newBreed = $_POST['breed'];
                        $newPastureNum = $_POST['pastureNum'];
                        $newColorRank = $_POST['colorRank'];
                        $newHorse = new Horse($newName, $newColor, $newBreed, $newPastureNum, $newColorRank);

                        $errors = validate_form($newHorse);
                        //errors array lists problems on the form submitted

                        //If the user left required fields blank,
                        if ($errors) {

                            //display the errors and the form to fix.
                            show_errors($errors);
                            include('editHorseForm.inc');
                        }

                        //Else, this was a successful form submission,
                        else {

                            //so process the form to add a behavior.
                            process_form($newName, $newHorse, "add");
                            echo ('</div>');
                       //include('footer.inc');
                            echo('</div></body></html>');
                            die();
                        }

                    }
                }

                //Else, if the user wants to edit a horse,
                else if($formAction == 'selectHorse') {

                    //check if there are horses in the database to edit.
                    $numHorses = get_numHorses();

                    //If there aren't any horses in the database, 
                    if($numHorses == 0) {
                        echo("<p><strong>There are no horses to edit.</strong></p>");
                        echo('<p>Please add horses using the "Add Horse" link next to "Horse Actions".</p><br>');
                    }

                    //Else, display the form for selecting a horse to edit.
                    else {
                        include('getHorseForm.inc');
                    }    
                }

                //Else, if the user has selected a horse to edit,
                else if($formAction == 'editHorse') {

                    //get the old title of the horse, in case the user edited the horse.
                    $oldName = $_POST['horseName'];

                    //Then, display the form for adding/editing behaviors.
                    include("editHorseForm.inc");
                }

                //Else, if the user has submitted behavior information to edit,
                else if($formAction == 'confirmEdit') {
                    
                    //attempt to validate and process the form.
                    include('horseValidate.inc'); 
                    
                    $oldName = $_POST['oldName'];
                    $newName = $_POST['horseName'];
                    $newColor = $_POST['color'];
                    $newBreed = $_POST['breed'];
                    $newPastureNum = $_POST['pastureNum'];
                    $newColorRank = $_POST['colorRank'];
                    
                    //If the form has not been submitted (somehow, cuz this code shouldn't run),
                    if ($_POST['_form_submit'] != 1) {

                        //show the form again.
                        include('editHorseForm.inc');
                    }

                    //Else, the form has been submitted,
                    else {
                        $horse = NULL;
                        //so validate it. BTW, the parameter doesn't matter, because "validate_form" uses the form's $_POST values, NOT the parameter.
                        $errors = validate_form($horse);

                        //errors array lists problems on the form submitted.

                        //If the user left required fields blank,
                        if ($errors) {

                            //display the errors and the form again.
                            show_errors($errors);
                            include('editHorseForm.inc');
                        }
                                
                        //Else, if the user changed the name of a horse to a name that already exists,
                            //Conditions: (1) The horse must exist, and (2) the user wants to change the name of the existing horse.
                            //If the user left the name the same, then the existing horse will be edited under the same name.
                        else if((retrieve_horse($newName)) && (strcmp($oldName, $newName) != 0)) {
                            
                            //print that the user cannot change a horse name to an existing name, and then show the form again.
                            echo("<h4 style='color:FF0000'>" . $newName . " is the name of an existing horse. Please enter another name.</h4><br>");
                            include("editHorseForm.inc");
                        }
                    
                        //Else, this was a successful form submission,
                        else {

                            //so create a Behavior object and process the form to edit a behavior.
                            $horseToEdit = new Horse($newName, $newColor, $newBreed, $newPastureNum, $newColorRank);
                            process_form($oldName, $horseToEdit, "edit");
                            echo ('</div>');
                            //include('footer.inc');
                            echo('</div></body></html>');
                            die();
                        }
                    } 
                }

                //Else, if the user wants to remove a horse
                else if ($formAction == 'removeHorse') { 
                    
                    //check if there are behaviors in the database to edit.
                    $numHorses = get_numHorses();

                    if($numHorses == 0) {
                        echo("<p><strong>There are no horses to remove.</strong></p>");
                        echo('<p>Please add horses using the "Add Horse" link next to "Horse Actions".</p><br>');
                    }
                    else {
                        include('getHorseForm.inc');
                    }
                    
                }

                else if($formAction == 'confirmRemove') {

                    //attempt to validate and process the form.
                    include('horseValidate.inc'); 
                    
                    $oldName = $_POST['horseName'];

                    //If the form has not been submitted (somehow).
                    if ($_POST['_form_submit'] != 1) {

                        //show the form again.
                        include('editHorseForm.inc');
                    }

                    //Else, the form has been submitted,
                    else {

                        //so validate it. BTW, the parameter doesn't matter, because "validate_form" uses the form's $_POST values, NOT the parameter.
                        //$errors = validate_form($behavior);
                        //errors array lists problems on the form submitted.

                        //If the user left required fields blank,
                        if ($errors) {

                            //display the errors and the form again.
                            show_errors($errors);
                            include('editHorseForm.inc');
                        }
                                                    
                        //Else, this was a successful form submission,
                        else {

                            //so create a Behavior object and process the form to remove a behavior.
                            //$horseToRemove = new Horse($Name, $Color, $Breed, $PastNum, $ColRank);
                           
                             $horseToRemove = retrieve_horse($oldName);
                           
                            process_form($oldName, $horseToRemove, "remove");
                            echo ('</div>');
                            echo('</div></body></html>');
                            die();
                        }
                    } 
                }

                ?>
            </div>
        </div>
    </body>
</html>    