<?php
/*
 * editBehaviorForm.inc: shows a form for a behavior to be added or edited in the database.
 */
?>


<?php

    //Display the form instructions based on what the user wants to do.
    //Also, change the form's destination URL based on what the user wants to do.
    if($formAction == "addHorse" || $formAction == "confirmAdd") {

        echo("<p><strong>Add Horse Information</strong></p>");
        echo("<p>Add horse information using the fields below.</p>");
        echo('<p>When finished, hit <b>"Add Horse"</b> at the bottom of this page.</p>');
        echo("<p>(<span style='font-size:x-small;color:FF0000'>*</span> denotes required information).</p>");
       
        echo("<form method='POST' action='/horsetrainersystem/horseActions.php?formAction=confirmAdd'>");
    }
    else { //$formAction == "editHorse" or "confirmEdit"

        echo("<p><strong>Edit " . $oldName . "'s Information</strong></p>");
        echo("<p>Edit the name, breed, color, pasture number, and color rank horse information as you wish. If you do not wish to change any information, please leave it untouched.</p>");
        echo("<p>Please use the dropdown menu to select the horse you want to edit.</p>");
        echo('<p>When finished, hit <b>"Edit ' . $oldName . '"</b> at the bottom of this page.</p>');
        echo("<p>(<span style='font-size:x-small;color:FF0000'>*</span> denotes required information).</p>");

        echo("<form method='POST' action='/horsetrainersystem/horseActions.php?formAction=confirmEdit'>");
    }
?>
    <input type="hidden" name="old_name" value="new">
    <input type="hidden" name="_form_submit" value="1">

    <?PHP
        //If the user is editing an existing horse, pass the existing name in "oldName" back to "horseActions.php" for editing purposes.
        echo("<input type='hidden' name='oldName' value='$oldName'/>");
    ?>
    <fieldset>
        <legend>Horse Information:</legend>
        <?php
            if($formAction == "addHorse" || $formAction == "confirmAdd") {
                //leave the fields blank
                echo("<p>Horse Name<span style='font-size:x-small;color:FF0000'>*</span>: <input type='text' name='horseName' tabindex='1' value='$oldName'></p>");
                echo("<p>Breed: <input type='text' name='breed' tabindex='1' value='$currentBreed'></p>");
                echo("<p>Color: <input type='text' name='color' tabindex='1' value='$currentColor'></p>");
                echo("<p>Pasture Number: <input type='number' name='pastureNum' tabindex='1' min='1' max='11'></p>");
            } 
            else  { //$formAction == "editHorse" or "confirmEdit"
                //auto-populate the fields with the exisitng information
                $currentBreed = retrieve_horse($oldName)->get_breed();
                $currentColor = retrieve_horse($oldName)->get_color();
                $currentPastureNum = retrieve_horse($oldName)->get_pastureNum();
                echo("<p>Horse Name<span style='font-size:x-small;color:FF0000'>*</span>: <input type='text' name='horseName' tabindex='1' value='$oldName'></p>");
                echo("<p>Breed: <input type='text' name='breed' tabindex='1' value='$currentBreed'></p>");
                echo("<p>Color: <input type='text' name='color' tabindex='1' value='$currentColor'></p>");
                echo("<p>Pasture Number: <input type='number' name='pastureNum' tabindex='1' min='1' max='11' value='$currentPastureNum'></p>");
            }
        ?>
        <p>Color Rank<span style="font-size:x-small;color:FF0000"></span>:
            <select name="colorRank" tabindex="1">
                <?PHP
                
                //create an array of the color ranks
                $colorRanks = array("Green", "Yellow", "Red");
                
                //if the user is adding a horse
                if($formAction == 'addHorse' || $formAction == "confirmAdd") {
                    //display the colors
                    foreach ($colorRanks as $color) {
                        echo "<option value=" . $color . ">" . $color . "</option>";
                    }
                }
                //the user is editing a horse
                else { //$formAction == "editHorse" or "confirmEdit"
                    $currentColorRank = retrieve_horse($oldName)->get_colorRank();
                    echo "<option value=" . $currentColorRank . ">" . $currentColorRank . "</option>";
                    //display the other colors after
                    foreach($colorRanks as $colors) {
                        if(strcmp($colors, $currentColorRank) != 0) {
                            echo "<option value=" . $colors . ">" . $colors . "</option>";
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
        if($formAction == "addHorse" || $formAction == "confirmAdd") {
            echo("<input type='submit' value='Add Horse'/>");
        }
        else {  //$formAction == "editHorse" or "confirmEdit"
            echo("<input type='submit' value='Edit " . $oldName . "'/>");
        }
    ?>
</form>