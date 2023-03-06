<html>
<style>
table, tr, td{
        border: 1px solid black;
        border-radius: 10px;
    }
</style>    

    <header>
        <p>View Horses</p>
    </header>
    <body>
        <div>   
            <table>
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
    </body>
</html>
