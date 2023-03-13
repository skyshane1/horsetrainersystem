<?php
session_start();
function searchBy($in){
    $userSearch='\'%'.$in.'%\'';
    $qry='select * from horseDB where horseName like '.$userSearch.'';
    return $qry;
}
function orderBy($in){
    $userSearch=$in;
    if ($_SESSION['prev']!=$in){
        $order="ASC";
        $_SESSION['prev']=$userSearch;
    } else {
        $order="DESC";
        $_SESSION['prev']='';
    }
    $qry='select * from horseDB order by '.$userSearch.' '.$order.' ';
    return $qry; }

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
button {    
    background-color:white;
    color:black; 
    border:none;
}
.headerbutton:hover {
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
  width: 75%;
  position: fixed;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
  padding-top: 60px;
}

/* Control the left side */
.left {
  left: 25;
}

/* Control the right side */
.right {
  right: 35;
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
                    <form method='get'>
                    <th><button type='submit' class='headerbutton' name='order' value='horseName' ><b>Horse Name</b></button></th>
                    <th><button type='submit' class='headerbutton' name='order' value='colorRank' ><b>Rank</b></button></th>
                    <th><button type='submit' class='headerbutton' name='order' value='color' ><b>Color</b></button></th>
                    <th><button type='submit' class='headerbutton' name='order' value='breed' ><b>Breed</b></button></th>
                    <th><button type='submit' class='headerbutton' name='order' value='pastureNum' ><b>Pasture</b></button></th>
                    </form> 
                </tr>
                <?php 
                include_once('database/dbinfo.php');
                $con=connect();
                if (isset($_GET['search'])){
                    $qry=searchBy($_GET['search']);
                } else {
                    $qry='select * from horseDB order by pastureNum ASC';
                }
                if (isset($_GET['order'])){
                    $qry=orderBy($_GET['order']);
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
                    echo '<td><form method="get"><button type="submit" class="headerbutton" name="curr_horse" value='.$horseName.' ></form>'.$horseName.'</button>&nbsp;</td>'; 
                    echo '<td>'.$horseRank.'</button>&nbsp;</td>';
                    echo '<td>'.$horseColor.'</button>&nbsp;</td>';
                    echo '<td>'.$horseBreed.'</button>&nbsp;</td>';
                    echo '<td>'.$horsePastureNum.'</button>&nbsp;</td>';

                    echo '</tr>';

                $indx++;

                }
                ?>
            </table>
        </div>
        <div class="split right">
            <table style="width: 90%; height:70%">
                <th style='width:20%; height:10%'>
                    <p>notes</p>
                </th>
                <th style='height:10%'>
				<?php
			if (isset($_GET['curr_horse'])){
				echo '<p>Viewing notes of ' .$_GET['curr_horse']. ' need to do sql</p>';
				//Select note, trainername, date from notesdb where horseName = $_GET['curr_horse'].
				//if notes:
				//else:
				//horse has no notes
   			} else {
        			echo '<p>No horse name selected yet lol</p>';
    			}
                    //<p>horsename via _session['curr_horse']</p>
			?>
                </th>
                <tr style='width:20%'>
                    <div>
                </tr>
                <tr>

                </tr>
            </table>
         


         

            <p>Viewing the behaviors and comments on horses here</p>
        </div>
    </body>
</html>
