<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@include file="secure.jsp" %>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status = false;
    if (request.getParameter("submit") != null) {
        String sql = "INSERT INTO `station`(`s_name`, `latitude`, `longitude`) VALUES ('" + request.getParameter("name") + "','" + request.getParameter("lat") + "','" + request.getParameter("lng") + "')";
        if (obj.InsertData(sql)) {
            status = true;
        } else {
            status = false;
        }
    }
    List<Map<String, String>> list = obj.fetchAllData("select * from station");
    String pages="station";

%>

<!Doctype html>
<html> 
    <head> 
        <title>Connection with mysql database</title>
        <!--====================================Script and StyleSheet=====================================-->
        <%@ include file="adminscript.jsp" %>  
        <!--====================================End Script and StyleSheet=====================================-->
    </head> 
    <body>
        <div class="container-fluid">
            <div class="row">
                <!--=====================================Header=======================================-->
                <%@ include file="adminnav.jsp" %>
                <!--=====================================Header End=======================================-->
            </div>
            <div class="row">
                <div class="col-lg-9">
                    <main>
                        <div class="homecontent">
                            <h3>Add Station</h3>
                            <form action="" method="post">
                                <div class="row form-group">
                                    <div class="col-lg-3 col-xs-12 padding-label">
                                        <label class="control-label">Station Name. : </label>
                                    </div>
                                    <div class="col-lg-3 col-xs-12">
                                        <input class="form-control" name="name" placeholder="Station Name" id="name" type="text" required>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-lg-3 col-xs-12 padding-label">
                                        <label class="control-label">Latitude :</label> 
                                    </div>
                                    <div class="col-lg-3 col-xs-12">
                                        <input class="form-control" id="lat" name="lat" placeholder="Latitude" type="text" required>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-lg-3 col-xs-12 padding-label">
                                        <label class="control-label">Longitude :</label> 
                                    </div>
                                    <div class="col-lg-3 col-xs-12">
                                        <input class="form-control" name="lng"  id="lng" placeholder="Longitude" type="text" required>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-lg-12">
                                        <input class="btn btn-success btn-block" type="submit" name="submit" value="Add Station">
                                    </div>

                                </div>
                                <div class="form-group">
                                    <%                        if (request.getParameter("submit") != null) {
                                            if (status) {
                                                out.println("<p class='alert alert-success'>Added Successfully.</p>");

                                            } else {
                                                out.println("<p class='alert alert-danger'>Error During Adding Station.</p>");

                                            }
                                        }
                                    %>
                                </div>
                            </form>
                        </div>
                        <div class="timingtable">
                            <h4>List Of Stations </h4>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-responsive">          
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Station Id</th>
                                                    <th>Station Name</th>
                                                    <th>Latitude</th>
                                                    <th>Longitude</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (int i = 0; i < list.size(); i++) {
                                                        Map hashmap = list.get(i);
                                                        out.println("<tr>"
                                                                + "<td data-name='id'>" + hashmap.get("id") + "</td>"
                                                                + "<td data-name='name'>" + hashmap.get("s_name") + "</td>"
                                                                + "<td data-name='lat'>" + hashmap.get("latitude") + "</td>"
                                                                + "<td data-name='lng'>" + hashmap.get("longitude") + "</td>"
                                                                + "<td data-name='ids'><button class='edit-station btn btn-warning'data-id='" + hashmap.get("id") + "'>Edit</button></td>"
                                                                + "</tr>");

                                                    }
                                                %>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>
                <div class="col-lg-3">
                    <%@ include file="adminsidebar.jsp" %>  
                </div>
            </div>


            <!--====================================Footer=====================================-->
            <div class="row">
                <%@ include file="adminfooter.jsp" %>  
            </div>
            <!--====================================Footer End=====================================-->
            <!--====================================Auto Complete Search==============================-->
            <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyBC5nTK6ceisjf7LHiSlKShdsH11fGsE2I"></script>
            <script>
                var autocomplete;
                function initialize() {
                    var input = document.getElementById('name');
                    autocomplete = new google.maps.places.Autocomplete(input);
                    autocomplete.addListener('place_changed', function () {
                        getGeo();
                    });

                }
                function getGeo() {
                    var place = autocomplete.getPlace();
                    var lat = place.geometry.location.lat();
                    var lng = place.geometry.location.lng();
                    document.getElementById("lat").value = lat;
                    document.getElementById("lng").value = lng;
                }

                google.maps.event.addDomListener(window, 'load', initialize);


            </script>
            <!--===================================End Auto Complete==================================-->
        </div>
    </body> 
</html>