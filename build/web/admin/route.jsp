<%@page import="java.util.ArrayList"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@include file="secure.jsp" %>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status = false;
    if (request.getParameter("submit")!= null) {
        String[] station=request.getParameterValues("station[]");
        String[] pos=request.getParameterValues("pos[]");
        String[] dis=request.getParameterValues("dis[]");
        String r_name=request.getParameter("route");
        BigDecimal ids=obj.InsertDataWithId("INSERT INTO `route`(`r_name`) VALUES ('"+r_name+"')");
        //out.println("Big id"+ids);
        for(int i=0;i<station.length;i++){
        String sql = "INSERT INTO `route_details`(`route_id`, `station_id`, `s_order_num`, `length_from_start`) VALUES ('"+ids+"','"+station[i]+"','"+pos[i]+"','"+dis[i]+"')";
            if (obj.InsertData(sql)) {
                status = true;
            } else {
                status = false;
            }
        }
    }
    List<Map<String, String>> list = obj.fetchAllData("select * from station");
    String pages="route";
    List<Map<String,String>> allroutes=obj.fetchAllData("select * from route");
    List<Map<String,String>> newRoutes=new ArrayList<Map<String,String>>();
    for(int  i=0;i<allroutes.size();i++){
        Map hashmap1=allroutes.get(i);
        List<Map<String,String>> allstations=obj.fetchAllData("select * from route_details where route_id='"+hashmap1.get("id")+"'");  
        //out.println("Size"+allstations.size());
        hashmap1.put("count",allstations.size());
        //allroutes.add(i,hashmap1);
        newRoutes.add(hashmap1);
    }

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
             <form action="" method="post">
            <h3>Add Route</h3>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-6 padding-label">
                    <label class="control-label">Route Name. : </label>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <input class="form-control" name="route" placeholder="Route Name." type="text">
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-routes">
                <tr>
                    <th>Station</th>
                    <th>Position</th>
                    <th>Distance</th>
                    <th>Action</th>
                </tr>
                <tr>
                    <td>
                        <select class="form-control" name="station[]">
                            <% for(int i=0;i<list.size();i++){
                                Map hashmap=list.get(i);
                             out.println("<option value='"+hashmap.get("id")+"'>"+hashmap.get("s_name")+"</option>");   
                            }
                            %>
                        </select>
                    </td>
                    <td><input type="text" class="form-control" placeholder="Position" name="pos[]"></td>
                    <td><input type="text" class="form-control" placeholder="Distance" name="dis[]"></td>
                    <td><button class="btn btn-danger btn-block btn-delete-station">Delete </button></td>
                </tr>
            </table>
            </div>
           <div class="row form-group">
                <div class="col-lg-6">
                    <button class="btn btn-success btn-block btn-add-station-routes" type="button">Add Station</button>
                </div>

               <div class="col-lg-6">
                   <input class="btn btn-success btn-block"  type="submit" value="Add Route" name="submit"/>
                </div>
            </div>
            <div class="form-group">
               <%  if (request.getParameter("submit") != null) {
                                            if (status) {
                                                out.println("<p class='alert alert-success'>Added Successfully.</p>");

                                            } else {
                                                out.println("<p class='alert alert-danger'>Error During Adding Routes.</p>");

                                            }
                                        }
               %>
           </div>

             </form>
            </div>
           <div class="timingtable">
            <h4>List Of All Routes </h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">          
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Route Id</th>
                                            <th>Routes Name</th>
                                            <th>No. of Station</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                         for(int i=0;i<newRoutes.size();i++){
                                           Map hashmaps=newRoutes.get(i);
                                          
                                       out.println("<tr>"+
                                            "<td>"+hashmaps.get("id")+"</td>"+
                                            "<td>"+hashmaps.get("r_name")+"</td>"+
                                            "<td>"+hashmaps.get("count")+"</td>"+
                                            "<td><button class='btn-edit-routes btn btn-warning' data-id='"+hashmaps.get("id")+"'>Edit</button></td>"+
                                            "</tr>");
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
</div>
</body> 
</html>