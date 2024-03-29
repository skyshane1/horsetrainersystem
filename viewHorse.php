<?php
session_start();
error_reporting(E_ERROR | E_PARSE);
function searchBy($in)
{
    $userSearch = '\'%' . $in . '%\'';
    $qry = 'select * from horsedb where horseName like ' . $userSearch . '';
    return $qry;
}

function orderBy($in)
{
    $userSearch = $in;
    if ($_SESSION['prev'] != $in) {
        $order = "ASC";
        $_SESSION['prev'] = $userSearch;
    } else {
        $order = "DESC";
        $_SESSION['prev'] = '';
    }
    $qry = 'select * from horsedb order by ' . $userSearch . ' ' . $order . ' ';
    return $qry;

}

function addNoteToDB($horseName, $note, $date, $time)
{
    $con = connect();

    $qry = "INSERT INTO `notesdb` (`horseName`, `noteDate`, `noteTimestamp`, `note`, `trainerId`) VALUES ('" . $horseName . "','" . $date . "', '" . $time . "', '" . $note . "', '" . $_SESSION['ID'] . "');";

    return mysqli_query($con, $qry);
}

function addBehaviorToDB($horseName, $behavior, $date)
{
    $con = connect();
    $qry = "INSERT INTO `horsetobehaviordb` (`horseName`, `behaviorTitle`, `startDate`) VALUES ('" . $horseName . "','" . $behavior . "','" . $date . "');";
    return mysqli_query($con, $qry);
}

function addDietaryRestrictionToDB($horseName, $dietaryRestriction)
{
    $con = connect();
    $qry = "INSERT INTO `dietaryrestrictionsdb` (`horseName`, `restriction`) VALUES ('" . $horseName . "','" . $dietaryRestriction . "');";
    return mysqli_query($con, $qry);
}

function removeBehaviorFromDB($horseName, $behavior, $date)
{
    $con = connect();
    $qry = "UPDATE `horsetobehaviordb` SET `endDate`= NULL,`completed`= 0 WHERE `behaviorTitle`='" . $behavior . "' and `horseName`='" . $horseName . "'; ";
    return mysqli_query($con, $qry);
}

$selectedHorse = $_GET["selectedHorse"];
?>


<script>
    function addDietaryRestriction() {
        document.getElementByID("addDietaryRestriction").style.display = "block";
    }

    function addNote() {
        document.getElementById("addNote").style.display = "block";
    }

    function addBehavior() {
        document.getElementById("addBehavior").style.display = "block";
    }

    function cancelBehavior() {
        document.getElementById("addBehavior").style.display = "none";
    }

    function cancelNote() {
        document.getElementById("addNote").style.display = "none";
    }

</script>


<html>
<head>
    <title>
        View Horse
    </title>
    <link rel="stylesheet" href="newstyle.css" type="text/css"/>
</head>
<?PHP
include_once('header.php');
include_once('database/dbinfo.php');
include_once('database/persondb.php');
include_once('domain/Person.php');
$con = connect();
?>
<div class="content">
    <?PHP if ($selectedHorse == '') { ?>
        <p><strong>Search For Horse</strong></p>
        <p>Enter a horses name and press enter or the submit button to submit</p>
        <p>Clicking on a horses name will open their profile</p>
        <p>Clicking the header tabs will reverse sort the table</p>
        <form method='post'>
            <h2>Search Horse</h2>
            <div class="flex-container">
                <input type="text" placeholder="Search" name="search">
                <button type="submit" style="background-color: white; vertical-align:bottom"><img
                            style="width: 17px; height: 15px;" src="https://i.stack.imgur.com/xXLCA.png"></button>
            </div>
            <table style="display: flex; justify-content: center">
                <form method='get'>
                    <tr>
                        <th>
                            <button type='submit' name='order' value='horseName'>Horse Name</button>
                        </th>
                        <th>
                            <button type='submit' name='order' value='colorRank'>Rank</button>
                        </th>
                        <th>
                            <button type='submit' name='order' value='color'>Color</button>
                        </th>
                        <th>
                            <button type='submit' name='order' value='breed'>Breed</button>
                        </th>
                        <th>
                            <button type='submit' name='order' value='pastureNum'>Pasture</button>
                        </th>
                        <th>
                            <button type='submit' name='order' value='trainer'>Trainer</button>
                        </th>
                    </tr>
                </form>
                <?php
                include_once('database/dbinfo.php');
                $con = connect();
                if (isset($_POST['search'])) {
                    $qry = searchBy($_POST['search']);
                } else {
                    $qry = 'select * from horsedb order by pastureNum ASC';
                }
                if (isset($_POST['order'])) {
                    $qry = orderBy($_POST['order']);
                }
                $fetched = mysqli_query($con, $qry);
                $indx = 0;
                echo "<form method='get'>";
                while ($row = mysqli_fetch_array($fetched, MYSQLI_ASSOC)) {
                    $horseName = $row['horseName'];
                    $horseRank = $row['colorRank'];
                    $horseColor = $row['color'];
                    $horseBreed = $row['breed'];
                    $horsePastureNum = $row['pastureNum'];
                    $trainerQry = 'SELECT fullName FROM `persondb` WHERE id = (select trainerId from trainertohorsedb where horseName = "' . $horseName . '" limit 1); ';
                    $trainerName = mysqli_query($con, $trainerQry);
                    $tName = mysqli_fetch_assoc($trainerName);
                    $tempname = str_replace(" ", "_", $horseName);
                    if (($indx % 2) == 1) {
                        $rowClass = 'class="trodd"';
                    } else {
                        $rowClass = 'class="treven"';
                    }
                    echo '<tr ' . $rowClass . '>';
                    echo '<td><input type="submit" style="background-color: #313131;
    color: #f8f8f8; margin: 0; border-radius: 0;" name="selectedHorse" value=' .$tempname. '></input&nbsp;</td>';
                    echo '<td>' . $horseRank . '&nbsp;</td>';
                    echo '<td>' . $horseColor . '&nbsp;</td>';
                    echo '<td>' . $horseBreed . '&nbsp;</td>';
                    echo '<td>' . $horsePastureNum . '&nbsp;</td>';
                    if (isset($tName['fullName'])) {
                        echo '<td>' . $tName['fullName'] . '&nbsp;</td>';
                    } else {
                        echo '<td>none &nbsp;</td>';
                    }
                    echo '</tr>';

                    $indx++;

                }
                echo '</form>';
                ?>
            </table>
        </form>
    <?PHP } else if ($selectedHorse != null) {
        $selectedHorse = str_replace("_", " ", $selectedHorse);
        echo '<p><strong>' . $selectedHorse . '\'s profile</strong></p>';
        echo '<p>This page contains all of ' . $selectedHorse . '\'s information</p>';
        echo '<p>The view notes tab contains all of ' . $selectedHorse . '\'s notes and can be filtered on content</p>';
        echo '<p>The behaviors tab shows all the behaviors ' . $selectedHorse . ' is currently learning or has learned</p>';
        echo '<p>And the trainers and dietary restrictions tab contains all of ' . $selectedHorse . '\'s trainers and dietary restrictions</p>';
        ?>
        <p><strong>How to use</strong></p>
        <p>To add information, simply scroll to the appropriate box below and fill out the form then submit</p>
        <p>To update behaviors, use the add behavior box to assign the behavior then check the box and hit confirm
            changes when the behavior is learned</p>
        <!-- View Horse Info Table -->
        <?PHP
        include_once('database/horsedb.php');
        if (isset($_POST['rank'])) {
            $qry = "UPDATE horsedb SET colorRank='" . $_POST['rank'] . "' WHERE horseName='" . $selectedHorse . "';";
            mysqli_query($con, $qry);
        }
        $horseFill = retrieve_horse($selectedHorse);
        if (isset($_POST['note'])) {
            $note = $_POST['note'];
            $date = date("Y-m-d");
            $time = date("Y-m-d H:i:s");
            addNoteToDB($selectedHorse, $note, $date, $time);
            $_POST['note'] = NULL;
        }
        if (isset($_POST['behavior'])) {
            $behavior = $_POST['behavior'];
            $date = date("Y-m-d");
            addBehaviorToDB($selectedHorse, $behavior, $date);
            $_POST['behavior'] = NULL;
        }
        if (isset($_POST['dbehavior'])) {
            $behavior = $_POST['dbehavior'];
            $date = date("null");
            removeBehaviorFromDB($selectedHorse, $behavior, $date);
            $_POST['behavior'] = NULL;
        }
        if (isset($_POST['dietary'])) {
            $dietaryRestriction = $_POST['dietary'];
            addDietaryRestrictionToDB($selectedHorse, $dietaryRestriction);
            $_POST['dietary'] = NULL;
        }
        if (isset($_POST['trainerToAdd'])) {
            try {
                $trainerToAdd = $_POST['trainerToAdd'];
                $todqry = "INSERT INTO trainertohorsedb (trainerId, horseName) VALUES ('" . $trainerToAdd . "','" . $selectedHorse . "');";
                mysqli_query($con, $todqry);
            } catch (Exception $e) {
                echo "<h2>WARNING: Can't add duplicate trainer</h2>";
            }
        }
        if (isset($_POST['removedTrainer'])) {
            $removeId = $_POST['removedTrainer'];
            $removeqry = "DELETE FROM trainertohorsedb where trainerId=" . $removeId . " and horseName='$selectedHorse'";
            $delete = mysqli_query($con, $removeqry);
        }
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
                        if ($_GET['searchNote'] != null) {
                            $curr_horse_qry = "Select * from notesdb where note like '%" . $_GET['searchNote'] . "%' and horseName = '".$selectedHorse."' order by noteDate DESC;";
                        } else {
                            $curr_horse_qry = "Select * from notesdb where horseName = '" . $selectedHorse . "' and horseName = '".$selectedHorse."' order by noteDate DESC;";
                        }
                        $curr_fetched = mysqli_query($con, $curr_horse_qry);
                        while ($row = mysqli_fetch_array($curr_fetched, MYSQLI_ASSOC)) {
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
                    <input type="hidden" name="selectedHorse" value="<?PHP echo "$selectedHorse" ?>">
                    <button type="submit" style="background-color: white; vertical-align:bottom"><img
                                style="width: 17px; height: 15px;" src="https://i.stack.imgur.com/xXLCA.png"></button>
                </div>
            </form>
            <!-- View Behaviors Table -->
            <form method="post">
                <table class="behaviors">
                    <?php
                    echo '<h2>' . $selectedHorse . '\'s Behaviors</h2>';
                    echo '<tr><th>Behavior</th><th>Start Date</th><th>Complete</th><th>Completed Date</th></tr>';
                    if (isset($_POST['behaviorChanges'])) {
                        $curr_allbehaviorsqry = "select * from horsetobehaviordb where horseName='" . $selectedHorse . "';";
                        $curr_allbehaviors = mysqli_query($con, $curr_allbehaviorsqry);
                        $date = date("Y-m-d");
                        while ($row = mysqli_fetch_array($curr_allbehaviors, MYSQLI_ASSOC)) {
                            $tempname = str_replace(" ", "_", $row['behaviorTitle']);
                            if ($_POST[$tempname] == "on") {
                                $addBehavior = "UPDATE `horsetobehaviordb` SET `endDate`='" . $date . "',`completed`= 1 WHERE `behaviorTitle`='" . $row['behaviorTitle'] . "' and `horseName`='" . $selectedHorse . "'; ";
                                mysqli_query($con, $addBehavior);
                            }
                        }
                    }
                    ?>

                    <?php
                    $curr_behaviorsqry = "select * from horsetobehaviordb where horseName = '" . $selectedHorse . "';";
                    $curr_behaviors = mysqli_query($con, $curr_behaviorsqry);
                    while ($row = mysqli_fetch_array($curr_behaviors, MYSQLI_ASSOC)) {
                        echo "<tr><td><label for='" . $row['behaviorTitle'] . "'>" . $row['behaviorTitle'] . "</label></td>";
                        echo "<td><label for='" . $row['startDate'] . "'>" . $row['startDate'] . "</label></td>";
                        $tempname = str_replace(" ", "_", $row['behaviorTitle']);
                        if ($row['completed'] == 1) {
                            echo "<td><input type='checkbox' checked name='" . $tempname . "'/>";
                        } else {
                            echo "<td><input type='checkbox' name='" . $tempname . "'/>";
                        }
                        echo "</td>";
                        echo "<td><label for='" . $row['endDate'] . "'>" . $row['endDate'] . "</label></td></tr>";
                    }
                    ?>
                </table>
                <input type='submit' name='behaviorChanges' value='Confirm Changes'/>
            </form>
            <!-- View Dietary Restrictions Table -->
            <form>
                <h2>Trainer(s)</h2>
                <div>
                    <table>
                        <?PHP
                        $qry = "SELECT fullName, id from persondb join trainertohorsedb on trainerId=id and horseName='" . $selectedHorse . "' order by lastName";
                        $trainersForHorse = mysqli_query($con, $qry);
                        while ($trainersRem = mysqli_fetch_array($trainersForHorse)) {
                            echo "<tr><td> " . $trainersRem['fullName'] . "</td></tr>";
                        }
                        ?>
                    </table>
                </div>
                <h2>Dietary Restrictions</h2>
                <div class="scroll">
                    <table>
                        <?PHP
                        $curr_horse_dietary_qry = "Select * from dietaryrestrictionsdb where horseName = '" . $selectedHorse . "';";
                        $curr_dietary_fetched = mysqli_query($con, $curr_horse_dietary_qry);
                        while ($row = mysqli_fetch_array($curr_dietary_fetched, MYSQLI_ASSOC)) {
                            $horse_dietary = $row['restriction'];
                            echo "<tr><td> " . $horse_dietary . "</td></tr>";
                        }
                        ?>
                    </table>
                </div>

            </form>
        </div>
        <!-- Add Note -->
        <div class="form-popup" id="addNote">
            <?php
            echo "<form method='post' action='' class='form-container'>";
            echo "<h1>Add Note</h1>";
            echo "<label for='Note'><b>Note</b></label>";
            echo "<input type='text' placeholder='Enter Note' name='note' required>";
            echo "<button type='submit' class='btn'>Add</button>";

            ?>
            </form>
        </div>
        <!-- Add Dietary Restriction -->
        <div class="form-popup" id="addDietaryRestriction">
            <?php
            echo "<form method='post' action='' class=form-container'>";
            echo "<h1> Add Dietary Restriction </h1>";
            echo "<label for='Dietary Restriction'><b>Dietary Restriction</b></label>";
            echo "<input type='text' placeholder='Enter Dietary Restriction' name='dietary' required>";
            echo "<button type='submit' class='btn'>Add</button>";

            ?>
            </form>
        </div>
        <!-- End Add Behavior -->
        <div class="form-popup" id="addBehavior">
            <?php
            echo "<form method='post' action='' class='form-container'>";
            echo "<h1>Add Behavior</h1>";
            echo "<label for='behavior'><b>Behavior</b></label>";
            echo "<select name='behavior' id='behavior'>";
            $curr_allbehaviorsqry = "select * from behaviordb where title not in (select behaviorTitle as title from horsetobehaviordb where horseName = '" . $selectedHorse . "');";
            $curr_allbehaviors = mysqli_query($con, $curr_allbehaviorsqry);
            while ($row = mysqli_fetch_array($curr_allbehaviors, MYSQLI_ASSOC)) {
                echo "<option value=\"" . $row['title'] . "\">" . $row['title'] . "</option>";
            }
            echo "</select>";
            echo "<button type='submit' class='btn'>Add</button>";

            ?>
            </form>
        </div>
        <!-- Remove Behavior -->
        <div class="form-popup" id="removeBehavior">
            <?php
            echo "<form method='post' action='' class='form-container'>";
            echo "<h1>Remove Behavior</h1>";
            echo "<label for='dbehavior'><b>Behavior</b></label>";
            echo "<select name='dbehavior' id='dbehavior'>";
            $curr_allbehaviorsqry = "select behaviorTitle from horsetobehaviordb where horseName = '" . $selectedHorse . "'and completed=1;";
            $curr_allbehaviors = mysqli_query($con, $curr_allbehaviorsqry);
            while ($row = mysqli_fetch_array($curr_allbehaviors, MYSQLI_ASSOC)) {
                echo "<option value=\"" . $row['behaviorTitle'] . "\">" . $row['behaviorTitle'] . "</option>";
            }
            echo "</select>";
            echo "<button type='submit' class='btn'>Uncheck</button>";
            echo "</form>"
            ?>
            </form>
        </div>
        <?PHP
            if($_SESSION['access_level'] == 2){
        ?>
        <div class="form-popup" id="addTrainer">
            <?php
            $qry = "SELECT firstName, lastName, id from persondb order by lastName";
            $allTrainers = mysqli_query($con, $qry);
            echo "<form method='post' action='' class='form-container'>";
            echo "<h1>Add Trainer to Horse</h1>";
            echo "<label for='addTrainer'><b>Add Trainer</b></label>";
            echo "<select name='trainerToAdd' id='trainerToAdd'>";
            echo "<option selected='true' disabled='disabled'>Select Trainer</option>";
            while ($trainers = mysqli_fetch_array($allTrainers)) {
                echo "<option value='" . $trainers['id'] . "'>" . $trainers['firstName'] . ' ' . $trainers['lastName'] . "</option>";
            }
            echo "</select>";
            echo "<button type='submit' class='btn'>Add</button>";
            echo "</form>";
            ?>
        </div>
        <div class="form-popup" id="removeTrainer">

            <?php
            $qry = "SELECT firstName, lastName, id from persondb join trainertohorsedb on trainerId=id and horseName='" . $selectedHorse . "' order by lastName";
            $trainersForHorse = mysqli_query($con, $qry);
            echo "<form method='post' action='' class='form-container'>";
            echo "<h1>Remove Trainer Assignment</h1>";
            echo "<label for='removeTrainer'><b>" . $selectedHorse . "'s Trainer(s)</b></label>";
            echo "<select name='removedTrainer' id='removedTrainer'>";
            echo "<option selected='true' disabled='disabled'>Select Trainer</option>";
            while ($trainersRem = mysqli_fetch_array($trainersForHorse)) {
                echo "<option value='" . $trainersRem['id'] . "'>" . $trainersRem['firstName'] . ' ' . $trainersRem['lastName'] . "</option>";
            }
            echo "</select>";
            echo "<button type='submit' class='btn'>Remove</button>";
            echo "</form>";
            ?>
        </div>
        <?PHP
            }
        ?>
        <!--here is the rank-->
        <div class="form-popup" id="changeRank">
            <?php

            echo "<form method='post' action='' class='form-container'>";
            echo "<h1>Change Rank</h1>";
            echo "<label for='rank'><b>Rank</b></label>";
            echo "<select name='rank' id='rank'>";
            $row = ["green", "yellow", "red"];
            for ($x = 0; $x < 3; $x++) {
                echo "<option value=\"" . $row[$x] . "\">" . $row[$x] . "</option>";
            }
            echo "</select>";
            echo "<button type='submit' class='btn'>Add</button>";

            ?>
            </form>
        </div>
    <?PHP } ?>
</div>
</html>
