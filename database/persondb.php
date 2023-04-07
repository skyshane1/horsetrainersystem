<?php

/* 
 * persondb.php: PHP file containing all functions to access and manipulate the persondb database.
 */

//Include the MySQL connection and Person class.
include_once('dbinfo.php');
include_once(dirname(__FILE__).'/../domain/Person.php');

/*
 * add a person to persondb table: if already there, return false
 */

/*
 * Function name: add_person($person)
 * Description: add a person to the database, IF the person doesn't exist already.
 * Parameters: 
 *      $person, a Person object with the information to add to the database.
 * Return Values:
 *      true, the person was added to the database.
 *      false, the person was NOT added to the database.
 */
function add_person($person) {
 
    //Legacy code check to ensure the parameter is a Person object.
    if (!$person instanceof Person) {
        die("Error: add_person userType mismatch");
    }
    
    //Create a database connection and check if the person to add already exists.
    $con=connect();
    $query = "SELECT * FROM persondb WHERE fullName='" . $person->get_fullName() . "';";
    $result = mysqli_query($con,$query);

    //If the person to add doesn't exist,
    if ($result == null || mysqli_num_rows($result) == 0) {
        
        //add the person to the database.
        mysqli_query($con,'INSERT INTO persondb (`firstName`, `lastName`, `fullName`, `phone`, `email`, `username`, `pass`, `userType`, `id`) VALUES("' .
                $person->get_firstName() . '","' .
                $person->get_lastName() . '","' .
                $person->get_fullName() . '","' .
                $person->get_phone() . '","' .
                $person->get_email() . '","' .
                $person->get_username() . '","' .
                $person->get_pass() . '","' .
                $person->get_usertype() . '","' .
                "NULL" . '");');
        
        //Close the connection and return true.
        mysqli_close($con);
        return true;
    }

    //Otherwise, close the connection and return false.
    mysqli_close($con);
    return false;
}


/*
 * Function name: edit_person($name, $person)
 * Description: edit a person in the database.
 *              By the time "edit_person($name, $person)" is called, it is certain that the database can be edited.
 * Parameters: 
 *      $name, the current name of the person in the database.
 *      $person, a Person object that holds the updated information to edit the database with.
 * Return Values:
 *      true, the existing person was edited.
 */
function edit_person($name, $person) {

    //Legacy code check to ensure the parameter is a Person object.
    if (!$person instanceof Person) {
        die("Errors: edit_person userType mismatch");
    }

    //Create a database connection and update the database.
    $con=connect();    
    $query = "UPDATE persondb SET firstName='" . $person->get_firstName() . "', 
                                  lastName='" . $person->get_lastName() . "', 
                                  fullName='" . $person->get_fullName() . "', 
                                  phone='" . $person->get_phone() . "', 
                                  email='" . $person->get_email() . "', 
                                  username='" . $person->get_username() . "', 
                                  pass='" . $person->get_pass() . "', 
                                  userType='" . $person->get_userType() . "'
                                  WHERE id='" . $person->get_id() . "';";
    $result = mysqli_query($con,$query);
    //Close the connection and return true.
    mysqli_close($con);
    return true;
}

/*
 * Function name: remove_person($personName)
 * Description: remove a person from the database.
 *              By the time "remove_person($personName)" is called, it is certain that the person can be removed.
 * Parameters: 
 *      $personName, the current name of the person in the database.
 * Return Values:
 *      true, the existing person was removed.
 */
function remove_person($personId) {

    //Create a database connection and delete the person.
    $con=connect();
    $query = 'SELECT * FROM persondb WHERE id = "' . $personId . '"';
    $query = 'DELETE FROM persondb WHERE id = "' . $personId . '"';
    $result = mysqli_query($con,$query);

    //Close the connection and return true.
    mysqli_close($con);
    return true;
}


/*
 * Function name: retrieve_person($personName)
 * Description: retrieve a person from the database based on its name.
 * Parameters: 
 *      $personName, the current name of the horse in the database.
 * Return Values:
 *      $thePerson, a Person object created using the person information from the database.
 *      false, a person with the name "$personName" doesn't exist.
 */
function retrieve_person($personName) {

    //Create a database connection and retrieve a person with the name.
    $con=connect();
    $query = "SELECT * FROM persondb WHERE username='" . $personName. "';";
    $result = mysqli_query($con,$query);

    //If the person does NOT exist in the database,
    if (mysqli_num_rows($result) != 1) {
        $query = "SELECT * FROM persondb WHERE fullName='" . $personName. "';";
        $result = mysqli_query($con,$query);
        if (mysqli_num_rows($result) != 1) {
            mysqli_close($con);

            //close the connection and return false.
            return false;
        }
    }

    //Otherwise, make a Person object using the query result.
    $result_row = mysqli_fetch_assoc($result);
    $thePerson = make_a_person($result_row);

    //Close the connection and return the Person object.
    mysqli_close($con);
    return $thePerson;
}
   

/*
 * Function name: getall_persondb()
 * Description: retrieve all people from the database into an array.
 * Parameters: None
 * Return Values:
 *      $thePerson, an array of Person objects created using the person information from the database.
 *      false, the person table is empty.
 */
function getall_persondb() {

    //Create a connection and retrieve all the people information.
    $con=connect();
    $query = "SELECT * FROM persondb ORDER BY lastName, firstName";
    $result = mysqli_query($con,$query);
    

    //If the person table is empty,
    if ($result == null || mysqli_num_rows($result) == 0) {

        //close the connection and return false.
        mysqli_close($con);
        return false;
    }

    //Otherwise, create an array, create a Person object for each query row, and add it to the array.
    $result = mysqli_query($con,$query); //This line might be redundant.
    $thePersons = array();

    while ($result_row = mysqli_fetch_assoc($result)) {
        $thePerson = make_a_person($result_row);
        $thePersons[] = $thePerson;
    }

    //Close the connection and return the array.
    mysqli_close($con);
    return $thePersons;
}

function filter_persondb($name) {

    //Create a connection and retrieve all the people information.
    $con=connect();
    $query = "SELECT * FROM persondb WHERE (lower(lastName) LIKE '%" . $name ."%') ORDER BY lastName, firstName;";
    $result = mysqli_query($con,$query);
    

    //If the person table is empty,
    if ($result == null || mysqli_num_rows($result) == 0) {

        //close the connection and return false.
        mysqli_close($con);
        return false;
    }

    //Otherwise, create an array, create a Person object for each query row, and add it to the array.
    $result = mysqli_query($con,$query); //This line might be redundant.
    $thePersons = array();

    while ($result_row = mysqli_fetch_assoc($result)) {
        $thePerson = make_a_person($result_row);
        $thePersons[] = $thePerson;
    }

    //Close the connection and return the array.
    mysqli_close($con);
    return $thePersons;
}

/*
 * Function name: getall_person_names()
 * Description: retrieve all person names from the database into an array.
 * Parameters: None
 * Return Values:
 *      $names, an array of person names (strings) using the person information from the database.
 *      false, the person table is empty.
 */
function getall_person_names() {

    //Create a database connection and retrieve all of the full names.
    $con=connect();
    $query = "SELECT fullName FROM persondb ORDER BY fullName";
    $result = mysqli_query($con,$query);

    //If the person table is empty,
    if ($result == null || mysqli_num_rows($result) == 0) {

        //close the connection and return false.
        mysqli_close($con);
        return false;
    }

    //Otherwise, create an array, and add each full name to the array.
    $result = mysqli_query($con,$query); //This line might be redundant.
    $names = array();
    while ($result_row = mysqli_fetch_assoc($result)) {
        $names[] = $result_row['fullName'];
    }

    //Close the connection and return the array.
    mysqli_close($con);
    return $names;
}
  

/*
 * Function name: make_a_person($result_row)
 * Description: makes a Person object from the query row parameter
 * Parameters: 
 *      $result_row, a row from a MySQL query containing person information.
 * Return Values:
 *      $thePerson, a Person object created using the parameter information.
 */
function make_a_person($result_row) {
    $thePerson = new Person(
                $result_row['firstName'],
                $result_row['lastName'],
                $result_row['fullName'],
                $result_row['phone'],
                $result_row['email'],
                $result_row['username'],
                $result_row['pass'],
                $result_row['userType'],
                $result_row['id']);
    return $thePerson;
}

/*
 * Function name: get_numPersons()
 * Description: retrieve the number of people in the database.
 *              It can certainly be optimized to have a "SELECT COUNT(*)" SQL query to get the count, instead of calling "getall_horse_names()".
 * Parameters: None
 * Return Values:
 *      0, if "getall_person_names()" yields no rows.
 *      count($numNames), the number of people in the database.
 */
function get_numPersons() {

    //If "getall_behavior_titles()" yields an empty query,
    if (getall_person_names() == 0) {

        //return 0.
        return 0;
    }

    //Otherwise, save the returned array from "getall_person_names()" and return the count of that array.
    $numNames = getall_person_names();
    return count($numNames);
}
