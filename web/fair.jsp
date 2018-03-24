<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status = false;
    JSONObject TripDetails=new JSONObject();
    if (request.getParameter("submit") != null) {
       TripDetails=obj.getTripDetails(request.getParameter("start"),request.getParameter("end"));
    }
    
    String pages="fair";

%>
<!Doctype html>
<html> 
<head> 
<title>Connection with mysql database</title>
<!--====================================Script and StyleSheet=====================================-->
<%@ include file="scriptsstyle.jsp" %>  
<!--====================================End Script and StyleSheet=====================================-->
</head> 
<body>
<div class="container-fluid">
    <div class="row">
<!--=====================================Header=======================================-->

<%@ include file="nav.jsp" %>
<!--=====================================Header End=======================================-->
    </div>
<div class="row">
    <div class="col-lg-9">
        <main>
            <div class="homecontent">
                            <h3>Check Routes and Fairs of your Journey </h3>
             <form action="" method="post">
               <div class="row form-group">
               
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Source Station : </label>
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control input_auto_station" list="station" <% if(request.getParameter("start")!=null) { out.print("value='"+request.getParameter("start")+"'"); }%> name="start"  placeholder="Source Station" type="text" required="required">
                    <datalist id="station"></datalist>

                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Destination Station :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control input_auto_station" <% if(request.getParameter("end")!=null) { out.print("value='"+request.getParameter("end")+"'"); }%> list="station" name="end" placeholder="Destination Station" type="text" required="required">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-12 col-xs-12">
                    <input class="btn btn-block btn-success btn-block"   name="submit"  placeholder="Destination Station" type="submit" value="Submit">
                </div>
                
            </div>
             </form>            

           </div>
            
                    <% if(request.getParameter("submit")!=null){ 
                     if(TripDetails.size()>0) { %>
            <div class="timingtable">
                <div class="row">
                    <div class="col-lg-12">
                        <p class="alert alert-warning text-center"><b>Charges Detail</b> : Rs. <%=TripDetails.get("fair").toString() %>.00</p> 
                        <% if(request.getParameter("submit")!=null){ %> 
                        <p class="alert alert-success text-center"><b>Source : </b> : <%=request.getParameter("start") %> | <b>Destination : </b> <%=request.getParameter("end") %></p>
                        <% } %>
                    </div>
                </div>
                 <div class="row">
                    <div class="col-lg-12">
                        <h3 class="route-h3">Trip Routes</h3>
                    </div>
                </div>
                <div class="row">
                <div class="col-lg-12">
                    <div id="map" style="height: 400px;width: 100%;"></div>
                </div>
                </div>
            </div>
                    <% }  else {
%>
<p class="alert alert-danger">Sorry No Trip Found for Selected Station</p>
                    <%
} } %>
            

        </main>
    </div>
    <div class="col-lg-3">
      <%@ include file="sidebar.jsp" %>  
    </div>
</div>
    

<!--====================================Footer=====================================-->
<div class="row">
<%@ include file="footer.jsp" %>  
</div>
<!--====================================Footer End=====================================-->
<!--====================================Maps Script======================================-->
<% if(request.getParameter("submit")!=null){ 
   if(TripDetails.size()>0){ %>
    <script>
   
   function initMap() {
    var locations = [];
    
        <% 
            String allData="[";
            int loop=0;
      JSONArray jsons=(JSONArray)TripDetails.get("route");
      for(int i=0;i<jsons.size();i++) {
    JSONArray jsons2=(JSONArray)jsons.get(i);
      for(int k=0;k<jsons2.size();k++) { 
   JSONObject Stations=(JSONObject)jsons2.get(k); 
     allData+="[\""+Stations.get("s_name")+"\","+Stations.get("latitude")+","+Stations.get("longitude")+","+loop+"],";
     loop++;
     } }
      allData=allData.substring(0, allData.length()-1);
      allData+="]"; %>
             locations=<%=allData%>;
             
           
   

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: new google.maps.LatLng(23.3441,85.3096),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
      var marker2 = new google.maps.Marker({
        position: new google.maps.LatLng(<%=TripDetails.get("start_lat")%>,<%=TripDetails.get("start_lng")%>),
        map: map,
        icon:'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'
      });
      
       var marker3 = new google.maps.Marker({
        position: new google.maps.LatLng(<%=TripDetails.get("end_lat")%>,<%=TripDetails.get("end_lng")%>),
        map: map,
        icon:'http://maps.google.com/mapfiles/ms/icons/green-dot.png'

      });
                marker2.setAnimation(google.maps.Animation.BOUNCE);
                marker3.setAnimation(google.maps.Animation.BOUNCE);
     var infowindow2 = new google.maps.InfoWindow({
          content: "<p style='text-align:center;width: 78px;overflow: visible;'><b>Source : </b><br><%=request.getParameter("start") %></p>"
        });
   
      google.maps.event.addListener(marker2, 'click', (function() {
        infowindow2.open(map, marker2);
        
      }));
        var infowindow3 = new google.maps.InfoWindow({
          content: "<p style='text-align:center;width: 78px;overflow: visible;'><b>Destination : </b><br><%=request.getParameter("end") %></p>"
        });
    
          google.maps.event.addListener(marker3, 'click', (function() {
            infowindow3.open(map, marker3);
      }));
             infowindow3.open(map, marker3);
             infowindow2.open(map, marker2);
        var myTrip=new Array();
     for(var i=0;i<locations.length;i++){
       myTrip.push(new google.maps.LatLng(locations[i][1],locations[i][2]));
     }
    var flightPath=new google.maps.Polyline({
        path:myTrip,
        strokeColor:"#0000FF",
        strokeOpacity:1,
        strokeWeight:5
    });
    flightPath.setMap(map); 
    
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOXMZgliXGCdED6eey-Bh3FihccazcBvU&callback=initMap"></script>
<% } } %>
<!--===================================End Maps Script================================--->
</div>
</body> 
</html>