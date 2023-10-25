<!DOCTYPE html>  
 <html>  
      <head>  
           <title>Display Page</title>  
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  
      </head>  
      <body>  
           <br /><br />  
           <div class="container">  
                <h3 align="center">Display Data</h3><br />  
                <div class="search">
                  <input type="text" name="search" id="search" placeholder="Search Here" style="font-family: poppins; font-size: 18px;">
                </div>
                <div class="table-responsive" id="pagination_data" style="margin-top: 30px;">  
                </div>  
           </div>  
      </body>  
 </html>  
 <script>  
 $(document).ready(function(){ 

    $('#search').keyup(function(){
      var input = $(this).val();
      if(input!="")
      {
        $.ajax({
          url:"search.php",
          method:"POST",
          data:{input:input},
          success:function(data)
          {
            $('#pagination_data').html(data);
          }
        });
      }
      else
      {
        load_data();
      }

    }); 
  
      function load_data(page)  
      {  
           $.ajax({  
                url:"pagination.php",  
                method:"POST",  
                data:{page:page},  
                success:function(data){  
                     $('#pagination_data').html(data);  
                }  
           })  
      } 
      load_data(); 
      $(document).on('click', '.pagination_link', function(){  
           var page = $(this).attr("id");  
           load_data(page);  
      });  
 });
</script>