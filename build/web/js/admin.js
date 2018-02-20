/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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

       $(this).parents("tr").children("td").each(function(){
           if(i===3)
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
    
    $(document).on("click",".edit-trip",function(){
        var id=$(this).data("id");
        var i=0;
        $(this).text("Save");
        $(this).removeClass("btn-warning");
        $(this).addClass("btn-success");
        $(this).removeClass("edit-trip");
        $(this).addClass("save-trip");        
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
    
    $(document).on("click",".save-trip",function(){
        var i=0;
        $(this).text("Edit");
        $(this).addClass("btn-warning");
        $(this).removeClass("btn-success");
        $(this).addClass("edit-trip");
        $(this).removeClass("save-trip");        

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
            if(i===5){
                
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

       $(this).parents("tr").children("td").each(function(){
           if(i===5)
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
    
     $(document).on("click",".edit-reply",function(){
        var id=$(this).data("id");
        var i=0;
        $(this).text("Replied");
        $(this).removeClass("btn-warning");
        $(this).addClass("btn-success");
        $(this).removeClass("edit-reply");
        $(this).addClass("save-reply");        
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
    
    $(document).on("click",".btn-add-station-routes",function(){
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
    function showSnackMessage(msg){
       
        $(".snackbar").text(msg);
        $(".snackbar").slideToggle(200,function(){
            $(".snackbar").slideToggle(1000);
        });
   }
    
});
