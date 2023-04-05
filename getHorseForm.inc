<?php

/*
 * getHorseForm.inc: shows a form for the user to select a horse name from a dropdown menu.
 */

?>
<?php

    //Display the form instructions based on what the user wants to do.
    //Also, change the form's destination URL based on what the user wants to do.
    if($formAction == "selectHorse") {

        echo("<p><strong>Select Horse to Edit</strong></p>");
        echo("<p>Please use the dropdown menu below to select the horse you want to edit.</p>");
        echo("<p>When finished, hit <b>Select Name</b> at the bottom of this page.</p>");
        echo("<p>(<span style='font-size:x-small;color:FF0000'>*</span> denotes required information).</p>");
       
        echo("<form method='POST' action='horseActions.php?formAction=editHorse'>");
    }
    else {

        echo("<p><strong>Select Horse to Remove</strong></p>");
        echo("<p>Please use the dropdown menu below to select the horse you want to remove.</p>");
        echo("<p>When finished, hit <b>Remove Horse</b> at the bottom of this page.</p>");
        echo("<p>(<span style='font-size:x-small;color:FF0000'>*</span> denotes required information).</p>");
       
        echo("<form method='POST' action='horseActions.php?formAction=confirmRemove'>");
    }
?>

<input type="hidden" name="old_name" value="new">
<input type="hidden" name="_form_submit" value="1">
<fieldset>
    <legend>Horse Name:</legend>
    <p>Horse Name<span style="font-size:x-small;color:FF0000"></span>: </p>
    <select name="horseName" tabindex="1"> 
        <?PHP

        //Create an array of all of the existing behavior titles for the user to select from.
        $names = getall_horse_names();

        foreach ($names as $n) {
            echo("<option value='$n' >$n</option>");
        }
        ?>
    </select>
    <script src="lib/>jquery-1.9.1.js"></script>
    <script src="lib/>jquery-ui.js"></script>
</fieldset>
<br>
<?PHP

    //Display the appropriate submit button text based on what the user wants to do.
    if($formAction == "selectHorse") {
        echo("<input type='submit' value='Select Horse'/>");
    }
    else {
        echo("<input type='submit' value='Remove Horse'/>");
    }
?>
</form>