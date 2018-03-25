<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@include file="secure.jsp" %>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status = false;
    if (request.getParameter("submit") != null) {
        
        String sql = "UPDATE `trip` SET `trip_code`='"+request.getParameter("tripcode")+"',`train_id`='"+request.getParameter("train")+"',`route_id`='"+request.getParameter("route")+"' WHERE id='"+request.getParameter("id")+"'";
        obj.InsertData(sql);
        String[] stations=request.getParameterValues("station[]");
        String[] arv=request.getParameterValues("arrival[]");
        String[] dept=request.getParameterValues("dept[]");
        obj.InsertData("DELETE FROM `trip_details` WHERE trip_num='"+request.getParameter("id")+"'");
        for(int k=0;k<stations.length;k++){
         if(obj.InsertData("INSERT INTO `trip_details`(`trip_num`, `station_id`, `arrival_time`, `departure_time`) VALUES ('"+request.getParameter("id")+"','"+stations[k]+"','"+arv[k]+"','"+dept[k]+"')")) {
            status = true;
         } else {
            status = false;
         }
        }
    }
    List<Map<String, String>> routes = obj.fetchAllData("select * from route");
    List<Map<String, String>> trains = obj.fetchAllData("select * from trains");
    List<Map<String, String>> station = obj.fetchAllData("select * from station");
    String pages="trip";
    
    List<Map<String,String>> alltrips=obj.fetchAllData("SELECT d.*,a.r_name as routename,b.train_no as trainname,count(c.trip_num) as totalcount  FROM  trip as d,route as a,trains as b,trip_details as c WHERE a.`id`=d.`route_id` and b.id=d.`train_id` and c.trip_num=d.`id` and d.id='"+request.getParameter("id")+"' GROUP by c.trip_num");
    if(alltrips.size()<=0){
            response.sendRedirect("route.jsp");
    }
    List<Map<String,String>> alltripsdetails=obj.fetchAllData("SELECT * FROM `trip_details` WHERE trip_num='"+request.getParameter("id")+"'");
    




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
            <h3>Add Trip</h3>
            <form action="" method="post">
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Trip Code. : </label>
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="tripcode" placeholder="Trip Code." type="text" value="<%=alltrips.get(0).get("trip_code") %>">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Select Route :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <select class="form-control" name="route">
                   <%
                        for(int i=0;i<routes.size();i++){
                            if(Objects.equals(routes.get(i).get("id"),alltrips.get(0).get("route_id")))
                            out.println("<option value='"+routes.get(i).get("id")+"' selected>"+routes.get(i).get("r_name")+"</option>");
                            else
                           out.println("<option value='"+routes.get(i).get("id")+"'>"+routes.get(i).get("r_name")+"</option>");
                        }
                    %>
                    </select>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Select Train :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <select class="form-control" name="train">
                     <%
                        for(int i=0;i<trains.size();i++){
                            if(Objects.equals(trains.get(i).get("id"),alltrips.get(0).get("train_id")))
                            out.println("<option value='"+trains.get(i).get("id")+"' selected>"+trains.get(i).get("train_no")+"</option>");
                            else
                            out.println("<option value='"+trains.get(i).get("id")+"'>"+trains.get(i).get("train_no")+"</option>");

                        }
                    %>
                    </select>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-trip">
                <tr>
                    <th>Station</th>
                    <th>Arrival</th>
                    <th>Departure</th>
                    <th>Action</th>
                </tr>
                <%
                    for(int k=0;k<alltripsdetails.size();k++){ 
                        %>
                <tr>
                    <td>
                        <select class="form-control" name="station[]">
                    <%
                        for(int i=0;i<station.size();i++){
                            if(Objects.equals(station.get(i).get("id"),alltripsdetails.get(k).get("station_id")))
                            out.println("<option value='"+station.get(i).get("id")+"' selected>"+station.get(i).get("s_name")+"</option>");
                            else
                            out.println("<option value='"+station.get(i).get("id")+"'>"+station.get(i).get("s_name")+"</option>");    
                        }
                    %>
                        </select>
                    </td>
                    <td><input type="time" class="form-control" placeholder="Arrival" name="arrival[]" value="<%=alltripsdetails.get(k).get("arrival_time") %>"></td>
                    <td><input type="time" class="form-control" placeholder="Departure" name="dept[]" value="<%=alltripsdetails.get(k).get("departure_time") %>"></td>
                    <td><button class="btn btn-danger btn-block btn-delete-station-t">Delete </button></td>
                </tr>
                <% } %>
            </table>
            </div>
           <div class="row form-group">
                <div class="col-lg-6">
                   <button class="btn btn-success btn-block btn-add-station-trip" type="button">Add Station</button>
                </div>
               <div class="col-lg-6">
                   <input class="btn btn-success btn-block" value="Update Trip" name="submit" type="submit">
                </div>

            </div>
             <div class="form-group">
                 <%   if (request.getParameter("submit") != null) {
                      if (status) {
                         out.println("<p class='alert alert-success'>Updated Successfully.</p>");
                       }
                       else 
                       {
                          out.println("<p class='alert alert-danger'>Error During Updating Trip.</p>");

                       }
                    }
                 %>
            </div>
            </form>
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
</div>
</body> 
</html>