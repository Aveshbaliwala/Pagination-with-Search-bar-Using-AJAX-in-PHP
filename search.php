<?php
	include "config.php";
	$output='';

	$input=$_POST['input'];

	$result = mysqli_query($conn,"SELECT P.ID, P.performance_title, P.performance_event, P.sellable, P.date, M.meta_value as price 
    FROM performance P 
    JOIN performance_meta M ON P.ID = M.performance_id 
    WHERE P.ID LIKE '$input%' OR P.performance_title LIKE '$input%' OR P.performance_event LIKE '$input%' OR P.sellable LIKE '$input%' OR P.date LIKE '$input%' OR M.meta_value LIKE '$input%'");

    $output .= "  
      <table class='table table-bordered' style='font-family: poppins;'>  
           <tr>
           <th style='background-color: black; color: white;'>Performance ID</th>
           <th style='background-color: black; color: white;'>Performance Title</th>
           <th style='background-color: black; color: white;'>Performance Event</th>
           <th style='background-color: black; color: white;'>Sellable</th>
           <th style='background-color: black; color: white;'>Date</th>
           <th style='background-color: black; color: white;'>Price</th>
           </tr>";  

   	while($row=mysqli_fetch_assoc($result))
    {
    	 $output .= "<tr><td>" . $row['ID'] . "</td><td>" . $row['performance_title'] . "</td><td>" . $row['performance_event'] . "</td><td>" . $row['sellable'] . "</td><td>" . $row['date'] . "</td><td>" . $row['price'] . "</td></tr>";
	}
	 $output .= '</table>';
	 echo $output; 

?>