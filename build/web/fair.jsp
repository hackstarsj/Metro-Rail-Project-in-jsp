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
<%! String pages="fair"; %>
<%@ include file="nav.jsp" %>
<!--=====================================Header End=======================================-->
    </div>
<div class="row">
    <div class="col-lg-9">
        <main>
            <div class="homecontent">
                            <h3>Check Routes and Fairs of your Journey </h3>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Source Station : </label>
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="source" placeholder="Source Station" type="text">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Destination Station :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="destination" placeholder="Destination Station" type="text">
                </div>
            </div>

           </div>
            <div class="timingtable">
                <div class="row">
                    <div class="col-lg-12">
                        <p><b>Charges Datail</b> : Rs. 25.00</p>
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
    <script>
      function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOXMZgliXGCdED6eey-Bh3FihccazcBvU&callback=initMap"></script>

<!--===================================End Maps Script================================--->
</div>
</body> 
</html>