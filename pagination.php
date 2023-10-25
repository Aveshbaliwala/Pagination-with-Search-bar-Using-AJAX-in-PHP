<?php  
 //pagination.php  
 include "config.php"; 
 $record_per_page = 5;  
 $page = '';  
 $output = '';  
 if(isset($_POST["page"]))  
 {  
      $page = $_POST["page"];  
 }  
 else  
 {  
      $page = 1;  
 }  
 $start_from = ($page - 1)*$record_per_page;  
 $query = "SELECT P.ID, P.performance_title, P.performance_event, P.sellable, P.date, M.meta_value as price 
        FROM performance P 
        JOIN performance_meta M ON P.ID = M.performance_id 
        WHERE M.meta_key = 'price' 
        ORDER BY P.date ASC, M.meta_value ASC 
        LIMIT $start_from, $record_per_page";  
 $result = mysqli_query($conn, $query);  
 $output .= "  
      <table class='table table-bordered' style='font-family: poppins;'>  
           <tr>
           <th style='background-color: black; color: white;'>Performance ID</th>
           <th style='background-color: black; color: white;'>Performance Title</th>
           <th style='background-color: black; color: white;'>Performance Event</th>
           <th style='background-color: black; color: white;'>Sellable</th>
           <th style='background-color: black; color: white;'>Date</th>
           <th style='background-color: black; color: white;'>Price</th>
           </tr>
 ";  
 while($row = mysqli_fetch_array($result))  
 {  
      $output .= "<tr><td>" . $row['ID'] . "</td><td>" . $row['performance_title'] . "</td><td>" . $row['performance_event'] . "</td><td>" . $row['sellable'] . "</td><td>" . $row['date'] . "</td><td>" . $row['price'] . "</td></tr>";
 }  
 $output .= '</table><br /><div align="center">';  
 $page_query = "SELECT P.ID, P.performance_title, P.performance_event, P.sellable, P.date, M.meta_value as price 
        FROM performance P 
        JOIN performance_meta M ON P.ID = M.performance_id";  
 $page_result = mysqli_query($conn, $page_query);  
 $total_records = mysqli_num_rows($page_result);  
 $total_pages = ceil($total_records/$record_per_page);  
 for($i=1; $i<=$total_pages; $i++)  
 {  
      $output .= "<span class='pagination_link' style='cursor:pointer; padding:6px; border:1px solid #ccc;' id='".$i."'>".$i."</span>";  
 }  
 $output .= '</div><br /><br />';  
 echo $output;
?>