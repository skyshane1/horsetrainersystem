<?php

/* 
 * behaviordb.php: PHP file containing all functions to access and manipulate the "behaviordb" database.
 */

//Include the MySQL connection and Behavior class.
include_once('dbinfo.php');
include_once(dirname(__FILE__).'/../domain/Behavior.php');


/*
 * Function name: add_behavior($behavior)
 * Description: add a behavior to the database, IF the behavior doesn't exist already.
 * Parameters: 
 *      $behavior, a Behavior object with the information to add to the database.
 * Return Values:
 *      true, the behavior was added to the database.
 *      false, the behavior was NOT added to the database.
 */
function add_behavior($behavior) {

    //Legacy code check to ensure the parameter is a Behavior object.
    if (!$behavior instanceof Behavior) {
        die("Error: add_behavior type mismatch");
    }

    //Connect to the database and query for a duplicate row.
    $con=connect();
    $query = "SELECT * FROM behaviordb WHERE title='" . $behavior->get_title() . "';";
    $result = mysqli_query($con,$query);
    
    //If there isn't a behavior with this title, 
    if ($result == null || mysqli_num_rows($result) == 0) {

        //add "$behavior" it to the database.
        mysqli_query($con,'INSERT INTO behaviordb VALUES("' .
                $behavior->get_title() . '","' .
                $behavior->get_behaviorLevel() . '");');
        mysqli_close($con);
        return true;
    }

    //Otherwise, the behavior already exists, so return false.
    mysqli_close($con);
    return false;
    
}

/*
 * Function name: edit_behavior($title, $behavior)
 * Description: edit a behavior in the database.
 *              By the time "edit_behavior($title, $behavior)" is called, it is certain that the database can be edited.
 * Parameters: 
 *      $title, the current title of the behavior in the database.
 *      $behavior, a Behavior object that holds the updated information to edit the database with.
 * Return Values:
 *      true, the existing behavior was edited.
 */
function edit_behavior($title, $behavior) {

    //Legacy code check to ensure the parameter "$behavior" is a Behavior object.
    if (!$behavior instanceof Behavior) {
        die("Error: edit_behavior type mismatch");
    }

    //Connect to the database and update the existing behavior.
    $con=connect();
    $query = "UPDATE behaviordb SET title='" . $behavior->get_title() . "', behaviorLevel='" . $behavior->get_behaviorLevel() . "' WHERE title='" . $title . "';";
    $result = mysqli_query($con,$query);

    //Close the connection the return true.
    mysqli_close($con);
    return true;    
}


/*
 * Function name: remove_behavior($title)
 * Description: remove a behavior from the database.
 *              By the time "remove_behavior($title)" is called, it is certain that the behavior can be removed.
 * Parameters: 
 *      $title, the current title of the behavior in the database.
 * Return Values:
 *      true, the existing behavior was removed.
 */
function remove_behavior($title) {

    //Create a connection to the database and remove the behavior.
    $con=connect();
    $query = 'DELETE FROM behaviordb WHERE title = "' . $title . '"';
    $result = mysqli_query($con,$query);

    //Close the connection and return true;
    mysqli_close($con);
    return true;
}


/*
 * Function name: retrieve_behavior($behaviorTitle)
 * Description: retrieve a behavior from the database based on its title.
 * Parameters: 
 *      $behaviorTitle, the current title of the behavior in the database.
 * Return Values:
 *      $theBehavior, a Behavior object created using the behavior information from the database.
 *      false, a behavior with the title "$behaviorTitle" doesn't exist.
 */
function retrieve_behavior($behaviorTitle) {
   
    //Create a database connection and attempt to retrieve the behavior.
    $con=connect();
    $query = "SELECT * FROM behaviordb WHERE title='" . $behaviorTitle . "';";
    $result = mysqli_query($con,$query);

    //If the behavior does NOT exist in the database,
    if (mysqli_num_rows($result) != 1) {
        mysqli_close($con);

        //return false to indiciate the retrieval process "failed".
        return false;
    }
    
    //Otherwise, create a Behavior object based on the returned row and return said object.
    $result_row = mysqli_fetch_assoc($result);
    $theBehavior = make_a_behavior($result_row);
    return $theBehavior;   
}


/*
 * Function name: getall_behaviordb()
 * Description: retrieve all behaviors from the database into an array.
 * Parameters: None
 * Return Values:
 *      $theBehaviors, an array of Behavior objects created using the behavior information from the database.
 *      false, the behavior table is empty.
 */
function getall_behaviordb() {

    //Create a database connection and retrieve all entries in the behavior table.
    $con=connect();
    $query = "SELECT * FROM behaviordb ORDER BY title";
    $result = mysqli_query($con,$query);

    //If the query result is empty,
    if ($result == null || mysqli_num_rows($result) == 0) {

        //close the connection and return false.
        mysqli_close($con);
        return false;
    }
    
    //Otherwise, create an array and convert each MySQL row into a Behavior object.s
    $result = mysqli_query($con,$query); //This line might be redundant
    $theBehaviors = array();
    while ($result_row = mysqli_fetch_assoc($result)) {
        $theBehavior = make_a_behavior($result_row);
        $theBehaviors[] = $theBehavior;
    }

    //Close the connection and return the array of Behavior objects.
    mysqli_close($con);
    return $theBehaviors;
}


/*
 * Function name: getall_behavior_titles()
 * Description: retrieve all behavior titles from the database into an array.
 * Parameters: None
 * Return Values:
 *      $titles, an array of behavior titles (strings) using the behavior information from the database.
 *      false, the behavior table is empty.
 */
function getall_behavior_titles() {

    //Create a database connection and retrieve all the titles from the database.
    $con=connect();
    $query = "SELECT title FROM behaviordb ORDER BY title";
    $result = mysqli_query($con,$query);

    //If the query result was empty,
    if ($result == null || mysqli_num_rows($result) == 0) {

        //Close the connection and return false.
        mysqli_close($con);
        return false;
    }

    //Otherwise, create an array and add each behavior title to it.
    $result = mysqli_query($con,$query); //This line might be redundant.
    $titles = array();

    while ($result_row = mysqli_fetch_assoc($result)) {
        $titles[] = $result_row['title'];
    }
    
    //Close the connection and return the array.
    mysqli_close($con);
    return $titles;
}


/*
 * Function name: get_numBehaviors()
 * Description: retrieve the number of behaviors in the database.
 *              It can certainly be optimized to have a "SELECT COUNT(*)" SQL query to get the count, instead of calling "getall_behavior_titles()".
 * Parameters: None
 * Return Values:
 *      0, if "getall_behavior_titles()" yields no rows.
 *      count($numTitles), the number of behaviors in the database.
 */
function get_numBehaviors() {

    //If "getall_behavior_titles()" yields an empty query,
    if(getall_behavior_titles() == 0 ) {

        //return 0.
        return 0;
    }

    //Otherwise, save the returned array from "getall_behavior_titles()" and return the count of that array.
    $numTitles = getall_behavior_titles();
    return count($numTitles);
}
 

/*
 * Function name: make_a_behavior($result_row)
 * Description: Convert an individual behavior row into a Behavior object and return it.
 * Parameters: 
 *      $result_row, the MySQL row containing behavior information.
 * Return Values:
 *      $theBehavior, the Behavior object created from the MySQL row.
 */
function make_a_behavior($result_row) {
    $theBehavior = new Behavior(
                $result_row['title'],
                $result_row['behaviorLevel']);
    return $theBehavior;
}


?>
