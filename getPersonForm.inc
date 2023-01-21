<?php

/*
 * getPersonForm.inc: shows a form for the user to select a person name from a dropdown menu.
 */

?>

<?php

    //Display the form instructions based on what the user wants to do.
    //Also, change the form's destination URL based on what the user wants to do.
    if($formAction == "selectPerson") {

        echo("<p><strong>Select Person to Edit</strong></p>");
        echo("<p>Please use the dropdown menu below to select the person you want to edit.</p>");
        echo("<p>When finished, hit <b>Select Person</b> at the bottom of this page.</p>");
        echo("<p>(<span style='font-size:x-small;color:FF0000'>*</span> denotes required information).</p>");
       
        echo("<form method='POST' action='/Horse/personActions.php?formAction=editPerson'>");
    }
    else {

        echo("<p><strong>Select Person to Remove</strong></p>");
        echo("<p>Please use the dropdown menu below to select the person you want to remove.</p>");
        echo("<p>When finished, hit <b>Remove Person</b> at the bottom of this page.</p>");
        echo("<p>(<span style='font-size:x-small;color:FF0000'>*</span> denotes required information).</p>");
       
        echo("<form method='POST' action='/Horse/personActions.php?formAction=confirmRemove'>");
    }
?>

<input type="hidden" name="old_name" value="new">
<input type="hidden" name="_form_submit" value="1">
<fieldset>
    <legend>Person Name:</legend>
    <p>Person Name<span style="font-size:x-small;color:FF0000"></span>: </p>
    <select name="personName" tabindex="1"> 
        <?PHP

        //Create an array to hold the full names of all the people in the database.
        $names = getall_person_names();

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
    if($formAction == "selectPerson") {
        echo("<input type='submit' value='Select Person'/>");
    }
    else {
        echo("<input type='submit' value='Remove Person'/>");
    }
?>
</form>