<?php
session_start();
function searchBy($in){
    $userSearch='\'%'.$in.'%\'';
    $qry='select * from horsedb where horseName like '.$userSearch.'';
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
    $qry='select * from horsedb order by '.$userSearch.' '.$order.' ';
    return $qry; 

}

function addNoteToDB($horseName,$note,$date,$time){
    $con=connect();
    $qry="INSERT INTO `notesdb` (`horseName`, `noteDate`, `noteTimestamp`, `note`, `trainerName`) VALUES ('".$horseName."','".$date."', '".$time."', '".$note."', 'admin');";
    return mysqli_query($con,$qry); 
}
?>


<script>

function addNote(){
    document.getElementById("addNote").style.display="block";
}

function cancelNote(){
    document.getElementById("addNote").style.display="none";
}

</script>


<html>
<style>
html{
    height: 100%;
}
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

.addNote {
    text-align: center;
    border-radius: 13px;  /*remember this!! */
}

.addNote:hover{
    color:white;
    background-color: #25663E;
}

.form-popup {
    display:none;
    position: fixed;
    bottom: 0;
    right: 15px;
    border: 3px solid black;
    z-index: 9;
}

.form-container {
    max-width: 300px;
    padding: 10px;
    background-color: white;
}   

.noteswrapper{ 
    overflow-y:scroll; 
    position:relative;
    height: 500px;
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
                    $qry='select * from horsedb order by pastureNum ASC';
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


                if (isset($_POST['note'])){
                    $note=$_POST['note'];
                    $date=date("Y-m-d");
                    $time=date("Y-m-d H:i:s");
                    addNoteToDB($_SESSION['curr_horse'],$note,$date,$time);
                    $_POST['note']=NULL;
                }
                ?>
            </table>
        </div>
                
            <!-- Add Note -->
            <div class="form-popup" id="addNote">
                <?php
                echo "<form method='post' action='' class='form-container'>";
                echo "<h1>Add Note</h1>";
                echo "<label for='Note'><b>Note</b></label>";
                echo "<input type='text' placeholder='Enter Note' name='note' required>";
                echo "<button type='submit' class='btn'>Add</button>";
                echo "<button type='button' class='btn cancel' onclick='cancelNote()'>Close</button>";
                ?>
              </form>
            </div>
            <!-- End Add Note -->

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
             <div class='noteswrapper'>
                <table style='border:none;vertical-align:top;'>
                        <?php
                            if (isset($_GET['curr_horse_button']) && $_GET['curr_horse_button']!=$_SESSION['curr_horse']){
                                $_SESSION['curr_horse']=$_GET['curr_horse_button'];
                            }
	                    if (isset($_SESSION['curr_horse'])){
	                        echo '<tr style="width:30%;border:none;"><th>Viewing notes of ' .$_SESSION['curr_horse']. '</th></tr>';
                            $curr_horse_qry="Select * from notesdb where horseName = '" .($_SESSION['curr_horse']). "';";
                            $curr_fetched=mysqli_query($con,$curr_horse_qry);
	                	while($row=mysqli_fetch_array($curr_fetched, MYSQLI_ASSOC)){
	                		$hnote = $row['note'];
	                		echo "<tr><td> ".$hnote. " ";
	                		echo "<br>- <font size='1'>" .$row['trainerName']." ".$row['noteDate']."</font></td></tr></div>";
	                	}
	                	} 
	                	else {
                    			echo '<p>No horse name selected yet lol</p>';
	                		}
	                	?>
                        <tr><td><button class="addNote" onclick="addNote()">Add Notes</button></td></tr>
                </table></div></td>
                    <td>behaviors here :/</td>
                </tr>
            </table>
         


         

            <p>Viewing the behaviors and comments on horses here</p>
        </div>
    </body>
</html>
