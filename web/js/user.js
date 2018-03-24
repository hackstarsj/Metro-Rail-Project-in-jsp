$(document).ready(function(){
    $(document).on("keyup",".input_auto_station",function(){
        var data={};
        data['method']="getstation";
        data['station']=$(this).val();
        $.ajax({
            url: 'admin/apiservice.jsp',
            type: 'POST',
            data:data,
           })
            .done(function (data) {
                var Stations=JSON.parse(data);
                var ListData="";
                for(var key in Stations){
                    ListData+='<option value="'+Stations[key]+'">';
                }
                $("#station").html(ListData);        
            })
            .fail(function() {
                console.log("No Internet");
            })
      
    });
   
   

});