<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * editBehaviorForm.inc
 * shows a form for a behavior to be added or edited in the database
 * 
 */

?>


<?php

    //Display the form instructions based on what the user wants to do.
    //Also, change the form's destination URL based on what the user wants to do.
    if($formAction == "addBehavior" || $formAction == "confirmAdd") {

        echo("<p><strong>Add Behavior Information</strong></p>");
        echo("<p>Add behavior information using the fields below.</p>");
        echo('<p>When finished, hit <b>"Add Behavior"</b> at the bottom of this page.</p>');
        echo("<p>(<span style='font-size:x-small;color:FF0000'>*</span> denotes required information).</p>");
       
        echo("<form method='POST' action='/horsetrainersystem/behaviorActions.php?formAction=confirmAdd'>");
    }
    else { //$formAction == "editBehavior"

        echo("<p><strong>Edit " . $oldTitle . "'s Information</strong></p>");
        echo("<p>Edit the title and/or difficulty behavior information as you wish. If you do not wish to change the title, please leave it untouched.</p>");
        echo("<p>Please use the dropdown menu to select the behavior you want to edit.</p>");
        echo('<p>When finished, hit <b>"Edit ' . $oldTitle . '"</b> at the bottom of this page.</p>');
        echo("<p>(<span style='font-size:x-small;color:FF0000'>*</span> denotes required information).</p>");

        echo("<form method='POST' action='/horsetrainersystem/behaviorActions.php?formAction=confirmEdit'>");
    }
?>
    <input type="hidden" name="old_name" value="new">
    <input type="hidden" name="_form_submit" value="1">
    <?PHP
        //If the user is editing an existing behavior, pass the existing title in "oldTitle" back to "behaviorActions.php" for editing purposes.
        echo("<input type='hidden' name='oldTitle' value='$oldTitle'/>");
    ?>
    <fieldset>
        <legend>Behavior Title:</legend>
        <?php

            //Set the value of the behavior title input field as the old title. If the user is adding to the database, the field is blank, as there's no old title.
            echo("<p>Behavior Title<span style='font-size:x-small;color:FF0000'>*</span>: <input type='text' name='behaviorTitle' tabindex='1' value='$oldTitle'></p>");
        ?>
        <p>Level of Difficulty:
        <select name="behaviorLevel" tabindex="1"> 
            <?PHP

                //Create an array of the behavior levels to restrict the user to the three options.
                $levels = array("Beginner", "Intermediate", "Hard");

                //If the user is adding a behavior,
                if($formAction == 'addBehavior' || $formAction == "confirmAdd") {

                    //display the levels in order.
                    foreach ($levels as $L) {
                            echo "<option value=" . $L . ">" . $L . "</option>";
                    }
                }
                else { //$formAction == "editBehavior"

                    //For convenience, get the level of the behavior the user wants to edit.
                    $currentLevel = retrieve_behavior($oldTitle)->get_behaviorLevel();

                    //Then, display this level first in the dropdown menu.
                    echo "<option value=" . $currentLevel . ">" . $currentLevel . "</option>";

                    //Lastly, display the other levels afterwards.
                    foreach ($levels as $L) {
                        if(strcmp($L, $currentLevel) != 0) {
                            echo "<option value=" . $L . ">" . $L . "</option>";
                        }
                    }
                }
            ?>
        </select>

        <script src="lib/>jquery-1.9.1.js"></script>
        <script src="lib/>jquery-ui.js"></script>
    </fieldset>
    <br>
    <?PHP

        //Display the appropriate submit button text based on what the user wants to do.
        if($formAction == "addBehavior" || $formAction == "confirmAdd") {
            echo("<input type='submit' value='Add Behavior'/>");
        }
        else { //$formAction == "editBehavior" or "confirmEdit"
            echo("<input type='submit' value='Edit " . $oldTitle . "'/>");
        }
    ?>
</form>