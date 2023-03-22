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
.horsebutton:hover {
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
.horsebutton {
    border:none;
    background-color: transparent;
    color: #FFFFFF;
    font-size: 100%;

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
  width: 65%;
  position: fixed;
  z-index: 1;
  top: 0;
  overflow-x: lock;
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
                echo '<form method="get">';
                while($row=mysqli_fetch_array($fetched, MYSQLI_ASSOC)){
                    $horseName=$row['horseName'];
                    $horseRank=$row['colorRank'];
                    $horseColor=$row['color'];
                    $horseBreed=$row['breed'];
                    $horsePastureNum=$row['pastureNum'];

                    if (($indx % 2) == 1) {$rowClass = 'class="trodd"'; } else { $rowClass = 'class="treven"'; }
                    echo '<tr '.$rowClass.'>';
                    echo '<td><button type="submit" class="horsebutton" name="curr_horse_button" value='.$horseName.'>'.$horseName.'</button&nbsp;</td>'; 
                    echo '<td>'.$horseRank.'&nbsp;</td>';
                    echo '<td>'.$horseColor.'&nbsp;</td>';
                    echo '<td>'.$horseBreed.'&nbsp;</td>';
                    echo '<td>'.$horsePastureNum.'&nbsp;</td>';
                    echo '</tr>';

                $indx++;

                }
                echo '</form>';
                ?>
            </table>
        </div>
        <div class="split right">
            <table style="width: 90%; height:70%">
            <tr>
                <th style='width:20%; height:10%'>
                Notes
                </th>
                <th style='height:10%'>
                Behaviors
                </th>
            </tr>
            <tr><td style='border:none;vertical-align:top'>
            <!--add scrollbar here-->
                <table style='border:none;vertical-align:top;'>
                        <?php
                            if (isset($_GET['curr_horse_button']) && $_GET['curr_horse_button']!=$_SESSION['curr_horse']){
                                $_SESSION['curr_horse']=$_GET['curr_horse_button'];
                            }
	                    if (isset($_SESSION['curr_horse'])){
	                        echo '<tr style="width:30%;border:none;"><th>Viewing notes of ' .$_SESSION['curr_horse']. '</th></tr>';

                                    $curr_horse_qry="Select * from notesDB where horseName = '" .($_SESSION['curr_horse']). "';";
                                    $curr_fetched=mysqli_query($con,$curr_horse_qry);
	                	while($row=mysqli_fetch_array($curr_fetched, MYSQLI_ASSOC)){
	                		$hnote = $row['note'];
	                		echo "<tr><td> ".$hnote. " ";
	                		echo "<br>- <font size='1'>" .$row['trainerName']." ".$row['noteDate']."</font></td></tr>";
	                	}
	                	} 
	                	else {
                    			echo '<p>No horse name selected yet lol</p>';
	                		}
	                	?>
                </table></td>
                    <td>behaviors here :/</td>
                </tr>
            </table>
         


         

            <p>Viewing the behaviors and comments on horses here</p>
        </div>
    </body>
</html>
