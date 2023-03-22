<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Add a Behavior</title>
   </head>
   <body>
   <div id="container">
      <?PHP include('header.php'); ?>

      <center>
         <h1>Form to add a Behavior</h1>
         <form action="addBehaviorResponse.php" method="post">

         <p>
               <label for="title"> Title:</label>
               <input type="text" name="title" id="title">
         </p>
             
            <p>
               <label for="behaviorLevel">Behavior Level:</label>
               <input type="text" name="behaviorLevel" id="behaviorLevel">
            </p>       
            <input type="submit" value="Add a Behavior!">
         </form>
      </center>
   </div>
   </body>
</html>