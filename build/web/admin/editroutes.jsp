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
        BigDecimal ids=obj.InsertDataWithId("UPDATE `route` SET `r_name`='"+r_name+"' WHERE id='"+request.getParameter("id")+"'");
        //out.println("Big id"+ids);
        obj.InsertData("DELETE from route_details where route_id='"+request.getParameter("id")+"'");
        for(int i=0;i<station.length;i++){
        String sql = "INSERT INTO `route_details`(`route_id`, `station_id`, `s_order_num`, `length_from_start`) VALUES ('"+request.getParameter("id")+"','"+station[i]+"','"+pos[i]+"','"+dis[i]+"')";
            if (obj.InsertData(sql)) {
                status = true;
            } else {
                status = false;
            }
        }
    }
    List<Map<String, String>> list = obj.fetchAllData("select * from station");
    String pages="route";
    List<Map<String,String>> allroutes=obj.fetchAllData("select * from route where id='"+request.getParameter("id")+"'");
    if(allroutes.size()<=0){
            response.sendRedirect("route.jsp");
    }
    List<Map<String,String>> allstations=obj.fetchAllData("select * from route_details where route_id='"+request.getParameter("id")+"'");  
        
%>
<!Doctype html>
<html> 
<head>
    <meta charset="utf-8">
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
                    <input type="hidden" name="ids" value="<%=request.getParameter("id") %>">
                    <input class="form-control" name="route" placeholder="Route Name." type="text" value="<%=allroutes.get(0).get("r_name") %>">
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
                <%
                    for(int k=0;k<allstations.size();k++){   
                        Map routemap=allstations.get(k);
                    %>
                <tr>
                    <td>
                        <select class="form-control" name="station[]">
                            
                            <% for(int i=0;i<list.size();i++){
                                Map hashmap=list.get(i);
                                     if(Objects.equals(hashmap.get("id"),routemap.get("station_id"))){
                                      out.println("<option value='"+hashmap.get("id")+"' selected>"+hashmap.get("s_name")+"</option>");   

                                     }else{
                                      out.println("<option value='"+hashmap.get("id")+"'>"+hashmap.get("s_name")+"</option>");   
   
                                     } 
                                         
                            }
                            %>
                        </select>
                    </td>
                    <td><input type="text" class="form-control" placeholder="Position" name="pos[]" value="<%=routemap.get("s_order_num") %>"></td>
                    <td><input type="text" class="form-control" placeholder="Distance" name="dis[]" value="<%=routemap.get("length_from_start") %>"></td>
                    <td><button class="btn btn-danger btn-block btn-delete-station">Delete </button></td>
                </tr>
                <%
                }
                %>
            </table>
            </div>
           <div class="row form-group">
                <div class="col-lg-6">
                    <button class="btn btn-success btn-block btn-add-station-routes" type="button">Add Station</button>
                </div>

               <div class="col-lg-6">
                   <input class="btn btn-success btn-block"  type="submit" value="Edit Route" name="submit"/>
                </div>
            </div>
            <div class="form-group">
               <%  if (request.getParameter("submit") != null) {
                                            if (status) {
                                                out.println("<p class='alert alert-success'>Updated Successfully.</p>");

                                            } else {
                                                out.println("<p class='alert alert-danger'>Error During Updating Routes.</p>");

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