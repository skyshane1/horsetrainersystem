<?php

/*
 * editPersonForm.inc: shows a form for a person to be added or edited in the database.
 */
 
?>

    <?php

    //Display the form instructions based on what the user wants to do.
    //Also, change the form's destination URL based on what the user wants to do.
    if($formAction == "addPerson" || $formAction == "confirmAdd") {
        echo("<p><strong>Add Person Information</strong></p>");
        echo("<p>Add person information using the fields below.</p>");
        echo("<p>When finished, hit <b>Add Person</b> at the bottom of this page.</p>");
        echo("<p>(<span style='font-size:x-small;'>*</span> denotes required information).</p>");

        echo("<form method='POST' action='personActions.php?formAction=confirmAdd'>");
    }
    else { //$formAction = 'editPerson' or 'confirmEdit'

        echo("<p><strong>Edit " . $oldName . "'s Information</strong></p>");
        echo("<p>Edit " . $oldName . "'s information as you wish. If you do not wish to change any information, please leave the fields untouched.</p>");
        echo("<p>When finished, hit <b>Edit " . $oldName . "</b> at the bottom of this page.</p>");
        echo("<p>(<span style='font-size:x-small;'>*</span> denotes required information).</p>");

        echo("<form method='POST' action='personActions.php?formAction=confirmEdit'>");
    }
    ?>

    <input type="hidden" name="old_name" value="new">
    <input type="hidden" name="_form_submit" value="1">

    <?PHP
        //If the user is editing an existing person, pass the existing name in "oldName" back to "personEdit.php" for editing purposes.
        echo("<input type='hidden' name='oldName' value='$oldName'/>");

    ?>
    <h2>Edit Account</h2>
    <fieldset>
        <?php
            if($formAction == "addPerson" || $formAction == "confirmAdd"){
                //leave the fields blank
                echo("<p>First Name<span style='font-size:x-small;'>*</span>: <input type='text' name='firstName' tabindex='1' value=''></p>");
                echo("<p>Last Name<span style='font-size:x-small;'>*</span>: <input type='text' name='lastName' tabindex='1' value=''></p>");
                echo("<p>Phone Number (###-###-####): <input type='tel' name='phone' placeholder='123-456-7890' pattern='[0-9]{3}-[0-9]{3}-[0-9]{4}' tabindex='1' value=''></p>"); //Add "required" after "pattern" later!
                echo("<p>Email: <input type='email' name='email' tabindex='1' value=''></p>");
                echo("<p>Username<span style='font-size:x-small;'>*</span>: <input type='text' name='userName' tabindex='1' value=''></p>");
                echo("<p>Password<span style='font-size:x-small;'>*</span>: <input type='text' name='password' tabindex='1' value=''></p>");
                
            //editing a person
            } 
            else  { //$formAction = "editPerson" or "confirmEdit"
                //auto-populate the fields with the exisitng information
                $personToEdit = retrieve_person($oldName);
                $currentFirstName = $personToEdit->get_firstName();
                $currentLastName = $personToEdit->get_lastName();
                $currentPhone = $personToEdit->get_phone();
                $currentEmail = $personToEdit->get_email();
                $currentUsername = $personToEdit->get_username();
                $currentPassword = $personToEdit->get_pass();
                $currentId = $personToEdit->get_id();

                echo("<p>First Name<span style='font-size:x-small;color:'>*</span>: <input type='text' name='firstName' tabindex='1' value='$currentFirstName'></p>");
                echo("<p>Last Name<span style='font-size:x-small;color:'>*</span>: <input type='text' name='lastName' tabindex='1' value='$currentLastName'></p>");
                echo("<p>Phone Number (###-###-####): <input type='tel' name='phone' placeholder='123-456-7890' pattern='[0-9]{3}-[0-9]{3}-[0-9]{4}' tabindex='1' value='$currentPhone'></p>"); //Add "required" after "pattern" later!
                echo("<p>Email: <input type='email' name='email' tabindex='1' value='$currentEmail'></p>");
                echo("<p>Username: <input type='text' name='username' tabindex='1' value='$currentUsername'></p>");
                echo("<p>Password: <input type='text' name='password' tabindex='1' placeholder='New Password' value=''></p>");
            }
        ?>
        <p>Person Type<span style="font-size:x-small;"></span>:
            <select name="userType" tabindex="1">
                <?PHP
                
                //create an array of the user types.
                $userTypes = array("Volunteer", "Administrator");
                
                //If the user is adding a person,
                if($formAction == 'addPerson' || $formAction == "confirmAdd") {

                    //display the user types as they are.
                    foreach ($userTypes as $u) {
                        echo "<option value=" . $u . ">" . $u . "</option>";
                    }
                }
                //the user is editing a person
                else {
                    $currentUserType = retrieve_person($oldName)->get_userType();

                    echo "<option value=" . $currentUserType . ">" . $currentUserType . "</option>";

                    //display the other colors after
                    foreach($userTypes as $u) {
                        if(strcmp($u, $currentUserType) != 0) {
                            echo "<option value=" . $u . ">" . $u . "</option>";
                        }
                    }
                }

                ?>
            </select>
          
        

        <script src="lib/>jquery-1.9.1.js"></script>
        <script src="lib/>jquery-ui.js"></script>
    </fieldset>
    <?PHP

        //Display the appropriate submit button text based on what the user wants to do.
        if($formAction == "addPerson" || $formAction == "confirmAdd") {
            echo("<input type='submit' value='Add Person'/>");
        }
        else { //$formAction == 'editPerson' or 'confirmEdit'
            echo("<input type='submit' value='Edit " . $oldName . " '/>");
        }
    ?>
</form>