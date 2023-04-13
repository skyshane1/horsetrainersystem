<?php
session_start();
error_reporting(E_ERROR | E_PARSE);
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

function addBehaviorToDB($horseName,$behavior){
    $con=connect();
    $qry="INSERT INTO `horsetobehaviordb` (`horseName`, `behaviorTitle`) VALUES ('".$horseName."','".$behavior."');";
    return mysqli_query($con,$qry); 
}

$selectedHorse = $_GET["selectedHorse"];
?>


<script>

function addNote(){
    document.getElementById("addNote").style.display="block";
}
function addBehavior(){
    document.getElementById("addBehavior").style.display="block";
}

function cancelBehavior(){
    document.getElementById("addBehavior").style.display="none";
}

function cancelNote(){
    document.getElementById("addNote").style.display="none";
}

</script>


<html>
    <head>
        <title>
            View Horse
        </title>
        <link rel="stylesheet" href="newstyle.css" type="text/css" />
    </head>
    <?PHP
        include_once('header.php');
        include_once('database/dbinfo.php');
        $con = connect();
    ?>
    <div class="content">
        <?PHP if ($selectedHorse == ''){ ?>
        <p><strong>Search For Horse</strong></p>
        <p>Enter a horses name and press enter or the submit button to submit</p>
        <p>Clicking on a horses name will open their profile</p>
        <p>Clicking the header tabs will reverse sort the table</p>
        <form method='post'>
            <h2>Search Horse</h2>
            <div class="flex-container">
                <input type="text" placeholder="Search" name="search">
                <button type="submit" style="background-color: white; vertical-align:bottom"><img style="width: 17px; height: 15px;" src="https://i.stack.imgur.com/xXLCA.png"></button>
            </div>
            <table>
                <form method='get'>
                    <tr>
                        <th><button type='submit' name='order' value='horseName'>Horse Name</button></th>
                        <th><button type='submit' name='order' value='colorRank'>Rank</button></th>
                        <th><button type='submit' name='order' value='color'>Color</button></th>
                        <th><button type='submit' name='order' value='breed'>Breed</button></th>
                        <th><button type='submit' name='order' value='pastureNum'>Pasture</button></th>
                    </tr>
                </form>
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
                echo "<form method='get'>";
                while($row=mysqli_fetch_array($fetched, MYSQLI_ASSOC)){
                    $horseName=$row['horseName'];
                    $horseRank=$row['colorRank'];
                    $horseColor=$row['color'];
                    $horseBreed=$row['breed'];
                    $horsePastureNum=$row['pastureNum'];

                    if (($indx % 2) == 1) {$rowClass = 'class="trodd"'; } else { $rowClass = 'class="treven"'; }
                    echo '<tr '.$rowClass.'>';
                    echo '<td><input type="submit" style="background-color: #313131;
    color: #f8f8f8; margin: 0; border-radius: 0;" name="selectedHorse" value='.$horseName.'></input&nbsp;</td>';
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
		if (isset($_POST['behavior'])){
                    $behavior=$_POST['behavior'];
                    addBehaviorToDB($_SESSION['curr_horse'],$behavior);
                    $_POST['behavior']=NULL;
                }
                ?>
            </table>
        </form>
        <?PHP } else if($selectedHorse != null){?>
                <!-- View Horse Info Table -->
                <?PHP
                    include_once('database/horsedb.php');
                    $horseFill = retrieve_horse($selectedHorse);
                ?>
                <table class="horseinfo">
                    <tr>
                        <th>Name</th>
                        <th>Color</th>
                        <th>Breed</th>
                        <th>Pasture</th>
                        <th>Rank</th>

                    </tr>
                    <tr>
                        <td><?PHP echo($horseFill->get_horseName()); ?></td>
                        <td><?PHP echo($horseFill->get_color()); ?></td>
                        <td><?PHP echo($horseFill->get_breed()); ?></td>
                        <td><?PHP echo($horseFill->get_pastureNum()); ?></td>
                        <td><?PHP echo($horseFill->get_colorRank()); ?></td>
                    </tr>
                </table>
                <!-- View Notes Table -->
        <div class="flex-container">
                <!-- New Notes -->
            <form>
                <h2>View Notes</h2>
                <div class="scroll">
                    <table>
                    <?PHP
                    if($_GET['searchNote'] != null){
                        $curr_horse_qry = "Select * from notesdb where note like '%" . $_GET['searchNote'] . "%' order by noteDate DESC;";
                    } else {
                        $curr_horse_qry = "Select * from notesdb where horseName = '" . $selectedHorse . "' order by noteDate DESC;";
                    }
                    $curr_fetched=mysqli_query($con,$curr_horse_qry);
                    while($row=mysqli_fetch_array($curr_fetched, MYSQLI_ASSOC)) {
                        $curr_trainer_qry = "Select * from persondb where id = '" . $row['trainerId'] . "';";
                        $curr_trainer = mysqli_query($con, $curr_trainer_qry);
                        $trainer_id = mysqli_fetch_array($curr_trainer, MYSQLI_ASSOC);
                        $hnote = $row['note'];
                        echo "<tr><td> " . $hnote . " ";
                        echo "<br>" . $trainer_id['fullName'] . " " . $row['noteDate'] . "</td></tr>";
                    }
                    ?>
                    </table>
                </div>
                <div class="flex-container">
                    <input type="text" placeholder="Search" name="searchNote">
                    <input type="hidden" name="selectedHorse" value="<?PHP echo"$selectedHorse" ?>">
                    <button type="submit" style="background-color: white; vertical-align:bottom"><img style="width: 17px; height: 15px;" src="https://i.stack.imgur.com/xXLCA.png"></button>
                </div>
            </form>

                <!-- View Behaviors Table -->
                <table class="behaviors">
                    <?php
                    echo '<tr><th>' .$selectedHorse.'\' Behaviors</th></tr>';
                    echo '<tr><td>Behavior</td><td>Start Date</td><td>Complete</td><td>Completed Date</td></tr>';
                    if (isset($_POST['behaviorChanges'])){
                        $curr_allbehaviorsqry="select * from behaviordb;";
                        $wipeBehaviors="delete from horsetobehaviordb where horsename='".$selectedHorse."';";
                        mysqli_query($con,$wipeBehaviors);
                        $curr_allbehaviors=mysqli_query($con,$curr_allbehaviorsqry);
                        while($row=mysqli_fetch_array($curr_allbehaviors, MYSQLI_ASSOC)){
                            if ($_POST[$row['title']]=="on"){
                                $addBehavior="INSERT INTO `horsetobehaviordb`(`horseName`, `behaviorTitle`) VALUES ('".$selectedHorse."' ,'".$row['title']."');";
                                mysqli_query($con,$addBehavior);
                            }
                        }
                    }
                    ?>
                    <form method="post">
                        <?php

                        $curr_allbehaviorsqry="select * from behaviordb;";
                        $curr_behaviorsqry="select * from horsetobehaviordb where horseName = '".$selectedHorse."';";
                        $curr_allbehaviors=mysqli_query($con,$curr_allbehaviorsqry);
                        $curr_behaviors=mysqli_query($con,$curr_behaviorsqry);
                        while($row=mysqli_fetch_array($curr_behaviors, MYSQLI_ASSOC)){
                            $behaviorHash[$row['behaviorTitle']]=1;
                        }
                        while($row=mysqli_fetch_array($curr_allbehaviors, MYSQLI_ASSOC)){
                            echo "<tr><td><label for='".$row['title']."'>".$row['title']."</label></td>";
                            echo "<td><label for='".$row['startDate']."'>".$row['startDate']."</label></td>";
                            if(isset($behaviorHash[$row['completed']])){
                                echo "<td><input type='checkbox' checked name='".$row['title']."'/>";
                                echo "</td>";
                            } else {
                                echo "<td><input type='checkbox' name='".$row['title']."'/>";
                                echo "</td>";
                            }
                            echo "<td><label for='".$row['endDate']."'>".$row['endDate']."</label></td></tr>";
                        }
                        echo "<tr><td ><input type='submit' name='behaviorChanges' value='Confirm Changes'/></td></tr>"
                        ?>
                    </form>
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
            <div class="form-popup" id="addBehavior">
                <?php
                echo "<form method='post' action='' class='form-container'>";
                echo "<h1>Add Behavior</h1>";
                echo "<label for='Behavior'><b>Behavior</b></label>";
                echo "<input type='text' placeholder='Enter Behavior' name='behavior' required>";
                echo "<button type='submit' class='btn'>Add</button>";
                echo "<button type='button' class='btn cancel' onclick='cancelBehavior()'>Close</button>";
                ?>
                </form>
            </div>
        </div>
        <?PHP } ?>
    </div>
</html>
