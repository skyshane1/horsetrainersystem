<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * validate_form validates the form data, checking all legality.
 * it returns are array of the errors with the form (string warnings)
 * this array is null (aka false) if there are no errors
 */
function validate_form($horse) {
    if ($_POST['firstName'] == null)
        $errors[] = 'Please enter a first name';
    if ($_POST['lastName'] == null) 
        $errors[] = 'Please enter a last name';
    return $errors;
}
function show_errors($e) {
    //this function should display all of the errors
    echo('<div class="warning">');
    echo('<ul>');
    foreach ($e as $error) {
        echo("<li><strong><font color=\"red\">" . $error . "</font></string></li>\n");
    }
    echo("</ul></div></p>");
}
?>
