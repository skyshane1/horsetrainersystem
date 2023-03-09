<?php
function searchBy($in){
    $userSearch='\'%'.$in.'%\'';
    $qry='select * from horseDB where horseName like '.$userSearch.'';
    $qry='select * from horseDB order by horseName ASC';
    return $qry;
}
function orderBy($in){
    $userSearch='\'%'.$in.'%\'';
    $qry='select * from horseDB where horseName order by DESC';
    return $qry;
}

?>


<html>
<style>
table, tr, td{
        border: 2px solid black;
        border-radius: 10px;
    }
td:hover {
    background-color: #900C3F;
    color: #FFFFFF;
}
th:hover {
	background-color: #581845;
    color: #FFFFFF;
}
.trodd {
    background-color:#71F8A6;
    color: black;
}
.treven {
    background-color:#25663E;
    color: white;
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
                <form method='get'>
                    <input type="text" placeholder="Search." name="search">
                    <button type="submit" style="background-color: white; vertical-align:bottom"><img style="width: 17px; height: 15px;" src="https://i.stack.imgur.com/xXLCA.png"></button>
                </form>
            </div>
            <table class='sortable' style='text-align:center'>
                <tr> 
                    <th><button onclick="orderBy(horseName)" style="background-color:white;color:black;">Horse Name</button></th>
                    <th>Rank</th>
                    <th>Color</th>
                    <th>Breed</th>
                    <th>Pasture Number</th>
                </tr>
                <?php 
                include_once('database/dbinfo.php');
                $con=connect();
                if ($_GET['search']!=NULL){
                    $qry=searchBy($_GET['search']);
                } else {
                    $qry='select * from horseDB order by pastureNum ASC';
                }
                $fetched=mysqli_query($con,$qry);
                $indx=0;
                while($row=mysqli_fetch_array($fetched, MYSQLI_ASSOC)){
                    $horseName=$row['horseName'];
                    $horseRank=$row['colorRank'];
                    $horseColor=$row['color'];
                    $horseBreed=$row['breed'];
                    $horsePastureNum=$row['pastureNum'];

                    if (($indx % 2) == 1) {$rowClass = 'class="trodd"'; } else { $rowClass = 'class="treven"'; }
                    echo '<tr '.$rowClass.'>';
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
