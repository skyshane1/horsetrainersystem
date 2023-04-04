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
    $errors = NULL;
    if ($_POST['horseName'] == null)
        $errors[] = 'Please enter a horse name';
    /*
    if ($_POST['color'] == null) 
        $errors[] = 'Please enter the color of the horse';
    if ($_POST['pastureNum'] == null)
        $errors[] = 'Please enter the pasture number';
    */
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
