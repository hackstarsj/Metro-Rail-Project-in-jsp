<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@include file="secure.jsp" %>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status = false;
    if (request.getParameter("submit") != null) {
        String sql = "INSERT INTO `fair`(`amt`, `min_distances`, `max_distances`) VALUES ('"+request.getParameter("chargeunit")+"','"+request.getParameter("min_dis")+"','"+request.getParameter("max_dis")+"')";
        if (obj.InsertData(sql)) {
            status = true;
        } else {
            status = false;
        }
    }
    List<Map<String, String>> list = obj.fetchAllData("select * from fair");
    String pages="fair";

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
                <form  action="" method="post">
            <h3>Add Fair</h3>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Charges :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="chargeunit" placeholder="Charge Unit" type="text" required>
                </div>
            </div>
             <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Minimum Distance :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="min_dis" placeholder="Minimum Distance" type="text" required>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Maximum Distance :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="max_dis" placeholder="Maximum Distance" type="text" required>
                </div>
            </div>
           <div class="row form-group">
               <div class="col-lg-12">
                   <input type="submit" class="btn btn-success btn-block" value="Add Fair" name="submit">
                </div>

            </div>
           <div class="form-group">
            <% if (request.getParameter("submit") != null) {
                    if (status) {
                           out.println("<p class='alert alert-success'>Added Successfully.</p>");
                      } 
                      else
                      {
                          out.println("<p class='alert alert-danger'>Error During Adding Fair.</p>");
                       }
              }
            %>
            </div>

                </form>
            </div>
           <div class="timingtable">
            <h4>List Of All Fairs </h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">          
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Fair Id</th>
                                            <th>Charges</th>
                                            <th>Minimum Distance</th>
                                            <th>Maximum Distance</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(int i=0;i<list.size();i++) { %>
                                        <tr>
                                            <td data-id="<%=list.get(i).get("id") %>"><%=list.get(i).get("id") %></td>
                                            <td data-name="charge"><%=list.get(i).get("amt") %></td>
                                            <td data-name="min_distances"><%=list.get(i).get("min_distances") %></td>
                                            <td data-name="max_distances"><%=list.get(i).get("max_distances") %></td>
                                            <td><button class="edit-fair btn btn-warning" data-id="<%=list.get(i).get("id") %>">Edit</button></td>
                                        </tr>
                                        <% } %>
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