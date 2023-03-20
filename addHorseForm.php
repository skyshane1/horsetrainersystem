<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Add a Horse</title>
   </head>
   <body>
   <div id="container">
      <?PHP include('header.php'); ?>
      <center>
         <h1>Form to add a Horse</h1>
         <form action="addHorseResponse.php" method="post">

            <p>
               <label for="horseName">Horse Name:</label>
               <input type="text" name="horseName" id="HorseName"> 
            </p>       
            <p>
               <label for="color">Color:</label>
               <input type="text" name="color" id="Color"> 
            </p>         
            <p>
               <label for="breed">Breed:</label>
               <input type="text" name="breed" id="Breed"> 
            </p>    
            <p>
               <label for="pastureNum">Pasture Number:</label>
               <input type="text" name="pastureNum" id="pastureNum"> 
            </p>    
            <p>
               <label for="colorRank">Color Rank:</label>
               <input type="text" name="colorRank" id="colorRank"> 
            </p>
         
         <input type="submit" value="Add a horse!">

         </form>
      </center>
   </div>

   </body>

</html>