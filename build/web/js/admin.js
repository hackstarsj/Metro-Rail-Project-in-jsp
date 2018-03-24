$(document).ready(function(){
    $(document).on("click",".edit-station",function(){
        var id=$(this).data("id");
        var i=0;
        $(this).text("Save");
        $(this).removeClass("btn-warning");
        $(this).addClass("btn-success");
        $(this).removeClass("edit-station");
        $(this).addClass("save-station");        
        $(this).parents("tr").children("td").each(function(){
            var vals=$(this).text();
            if(i===4){
                
                return true;
            }
            i++;
            console.log($(this).text());
            $(this).html("<input type='text' value='"+vals+"' class='form-control'>");
            
        });    
    });
    
    $(document).on("click",".save-station",function(){
        var i=0;
        $(this).text("Edit");
        $(this).addClass("btn-warning");
        $(this).removeClass("btn-success");
        $(this).addClass("edit-station");
        $(this).removeClass("save-station");        
        var jsonobj={};
       $(this).parents("tr").children("td").each(function(){
           if(i===4)
           {
               return true;
           }
           i++;
           jsonobj[$(this).data("name")]=$(this).children("input").val();
           var vals=$(this).children("input").val();
           console.log($(this).children("input").val());
           $(this).html(vals);
       });
              jsonobj['id']=$(this).data('id');
       ApiService("station",jsonobj,"Error During Editing Station!","Successfully Updated!");

    });
    $(document).on("click",".edit-train",function(){
        var id=$(this).data("id");
        var i=0;
        $(this).text("Save");
        $(this).removeClass("btn-warning");
        $(this).addClass("btn-success");
        $(this).removeClass("edit-train");
        $(this).addClass("save-train");        
        $(this).parents("tr").children("td").each(function(){
            var vals=$(this).text();
            if(i===3){
                
                return true;
            }
            i++;
            console.log($(this).text());
            $(this).html("<input type='text' value='"+vals+"' class='form-control'>");
            
        });    
    });
    
    $(document).on("click",".save-train",function(){
        var i=0;
        $(this).text("Edit");
        $(this).addClass("btn-warning");
        $(this).removeClass("btn-success");
        $(this).addClass("edit-train");
        $(this).removeClass("save-train");        
        var jsonobj={};
       $(this).parents("tr").children("td").each(function(){
           if(i===3)
           {
               return true;
           }
           i++;
           jsonobj[$(this).data("name")]=$(this).children("input").val();
           var vals=$(this).children("input").val();
           console.log($(this).children("input").val());
           $(this).html(vals);
       });
       console.log(jsonobj);
       jsonobj['id']=$(this).data('id');
       ApiService("train",jsonobj,"Error During Editing Train!","Successfully Updated!")
    });
    
$(document).on("click",".edit-trip",function(){
        var id=$(this).data("id");
     location="edit_trip.jsp?id="+id;
    });
    

    $(document).on("click",".edit-fair",function(){
        var id=$(this).data("id");
        var i=0;
        $(this).text("Save");
        $(this).removeClass("btn-warning");
        $(this).addClass("btn-success");
        $(this).removeClass("edit-fair");
        $(this).addClass("save-fair");        
        $(this).parents("tr").children("td").each(function(){
            var vals=$(this).text();
            if(i===4){
                
                return true;
            }
            i++;
            console.log($(this).text());
            $(this).html("<input type='text' value='"+vals+"' class='form-control'>");
            
        });
    });
    
    $(document).on("click",".save-fair",function(){
        var i=0;
        $(this).text("Edit");
        $(this).addClass("btn-warning");
        $(this).removeClass("btn-success");
        $(this).addClass("edit-fair");
        $(this).removeClass("save-fair");        
        var jsonobj={};

       $(this).parents("tr").children("td").each(function(){
           if(i===4)
           {
               return true;
           }
           i++;
          jsonobj[$(this).data("name")]=$(this).children("input").val();

           var vals=$(this).children("input").val();
           console.log($(this).children("input").val());
           $(this).html(vals);
       });
              jsonobj['id']=$(this).data('id');
       ApiService("fair",jsonobj,"Error During Editing Fair!","Successfully Updated!");

     //  showSnackMessage("Successfully Edited");
    });
    
     $(document).on("click",".edit-reply",function(){
        var id=$(this).data("id");
        var i=0;
//        $(this).text("Replied");
//        $(this).removeClass("btn-warning");
//        $(this).addClass("btn-success");
//        $(this).removeClass("edit-reply");
//        $(this).addClass("save-reply");        
        $("#r_name").text($(this).parents('tr').children("td:eq(1)").text());
        $("#r_email").text($(this).parents('tr').children("td:eq(2)").text());
        $("#r_msg").text($(this).parents('tr').children("td:eq(3)").text());
        $("#in_remail").val($(this).parents('tr').children("td:eq(2)").text());
        $("#in_rid").val($(this).parents('tr').children("td:eq(0)").text());
     });
    
    $(document).on("click",".save-reply",function(){
        var i=0;
        $(this).text("Reply");
        $(this).addClass("btn-warning");
        $(this).removeClass("btn-success");
        $(this).addClass("edit-reply");
        $(this).removeClass("save-reply");        

       $(this).parents("tr").children("td").each(function(){
           if(i===4)
           {
               return true;
           }
           i++;
           var vals=$(this).children("input").val();
           console.log($(this).children("input").val());
           $(this).html(vals);
       });
       showSnackMessage("Successfully Edited");
    });
    
     $(document).on("click",".edit-cards",function(){
        var id=$(this).data("id");
        var i=0;
        $(this).text("Issue");
        $(this).removeClass("btn-warning");
        $(this).addClass("btn-success");
        $(this).removeClass("edit-cards");
        $(this).addClass("save-cards");        
        $("#r_email").text($(this).parents("tr").children("td:eq(1)").text());
        $("#in_rid").val($(this).parents("tr").children("td:eq(0)").text());
        $("#in_remail").val($(this).parents("tr").children("td:eq(1)").text());
    });
    
    $(document).on("click",".save-cards",function(){
        var i=0;
        $(this).text("Reply");
        $(this).addClass("btn-warning");
        $(this).removeClass("btn-success");
        $(this).addClass("edit-cards");
        $(this).removeClass("save-cards");        

       $(this).parents("tr").children("td").each(function(){
           if(i===4)
           {
               return true;
           }
           i++;
           var vals=$(this).children("input").val();
           console.log($(this).children("input").val());
           $(this).html(vals);
       });
       showSnackMessage("Successfully Edited");
    });
    
    $(document).on("click",".btn-add-station-routes",function(e){
       e.preventDefault(); 
       var htmls=$(".table-routes tr:eq(1)").html();
       htmls=htmls.replace("\value\g","");
       $(".table-routes").append("<tr>"+htmls+"</tr>");
    });
    
    
    
    $(document).on("click",".btn-delete-station",function(){
        var obj=$(".table-routes tr").length;
        if(obj===2){
            return true;
        }
        console.log(obj);
        $(this).parents("tr").remove();
    });
    $(document).on("click",".btn-add-station-trip",function(){
       var htmls=$(".table-trip tr:eq(1)").html();
       htmls=htmls.replace("\value\g","");
       $(".table-trip").append("<tr>"+htmls+"</tr>");
    });
    
    $(document).on("click",".btn-delete-station-t",function(){
        var obj=$(".table-trip tr").length;
        if(obj===2){
            return true;
        }
        console.log(obj);
        $(this).parents("tr").remove();
    });
    
    $(document).on("click",".btn-edit-routes",function(){
       location='editroutes.jsp?id='+$(this).data("id");
    });
    
    function showSnackMessage(msg){
       
        $(".snackbar").text(msg);
        $(".snackbar").slideToggle(200,function(){
            $(".snackbar").slideToggle(1000);
        });
   }
   function ApiService(method,data,error,success){
        data['method']=method;
        $.ajax({
            url: '../admin/apiservice.jsp',
            type: 'POST',
            data:data,
           })
            .done(function (data) {
             if(data.trim()==="true"){
               showSnackMessage(success);                 
             }else{
               showSnackMessage(error);                 
             }   
            })
            .fail(function() {
               showSnackMessage("Please Check Internet Connection.");                 
            })

   }
    
});
