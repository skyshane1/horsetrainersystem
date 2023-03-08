<html>
<style>
table, tr, td{
        border: 2px solid black;
        border-radius: 10px;
    }
.split {
  height: 100%;
  width: 50%;
  position: fixed;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
  padding-top: 60px;
}

/* Control the left side */
.left {
  left: 0;
}

/* Control the right side */
.right {
  right: 0;
}

/* If you want the content centered horizontally and vertically */
.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}


</style>    

    <header style='text-align:center'>
        <h1>View Horses</h1>
    </header>
    <body>
        <div class="split left">   
            <div class="search-container">
                <form>
                    <input type="text" placeholder="Search." name="search">
                    <button type="submit" style="background-color: white;"><i class="fa fa-search"><img style="width: 17px; height: 15px" src="https://i.stack.imgur.com/xXLCA.png"></i></button>
                </form>
            </div>
            <table style='text-align:center'>
                <tr> 
                    <th>Horse Name</th>
                    <th>Rank</th>
                    <th>Color</th>
                    <th>Breed</th>
                    <th>Pasture Number</th>
                </tr>
                <?php 
                include_once('database/dbinfo.php');
                $con=connect();
                $qry='select * from horseDB';
                $fetched=mysqli_query($con,$qry);
                $indx=0;
                while($row=mysqli_fetch_array($fetched, MYSQLI_ASSOC)){
                    $horseName=$row['horseName'];
                    $horseRank=$row['colorRank'];
                    $horseColor=$row['color'];
                    $horseBreed=$row['breed'];
                    $horsePastureNum=$row['pastureNum'];

                    //if (($indx % 2) == 1) {$rowClass = 'class="trOdd"'; } else { $rowClass = 'class="trEven"'; }
                    echo '<tr>';
                                //.$rowClass.^
                    echo '<td>'.$horseName.'&nbsp;</td>'; 
                    echo '<td>'.$horseRank.'&nbsp;</td>';
                    echo '<td>'.$horseColor.'&nbsp;</td>';
                    echo '<td>'.$horseBreed.'&nbsp;</td>';
                    echo '<td>'.$horsePastureNum.'&nbsp;</td>';

                    echo '</tr>';

                $indx++;

                }
                ?>
            </table>
        </div>
        <div class="split right">
            <p split>Viewing the behaviors and comments on horses here</p>
        </div>
    </body>
</html>
