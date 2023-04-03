<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Add a Horse</title>
   </head>
   <body>
   <?PHP include('header.php'); ?>
   <div class="content"">
   <p><strong>Add Horse Information</strong></p>
   <p>Add horse information using the fields below.</p>
   <p>When finished, hit <b>Add Horse</b> at the bottom of this page.</p>
   <p>(<span style='font-size:x-small;'>*</span> denotes required information).</p>

         <form action="addHorseResponse.php" method="post">
             <h2>Add Horse</h2>
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
         
         <input type="submit" value="Add Horse">

         </form>
      </center>
   </div>

   </body>

</html>