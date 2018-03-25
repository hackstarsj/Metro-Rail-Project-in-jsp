<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@include file="secure.jsp" %>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status = false;
    if (request.getParameter("submit") != null) {
        String sql = "INSERT INTO `trains`(`train_no`, `capacity`) VALUES ('" + request.getParameter("trainno") + "','" + request.getParameter("cap") + "')";
        if (obj.InsertData(sql)) {
            status = true;
        } else {
            status = false;
        }
    }
    List<Map<String, String>> list = obj.fetchAllData("select * from trains");
    String pages="train";

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
            <h3>Add Train</h3>
            <form action="" method="post">
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Train No. : </label>
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="trainno" placeholder="Train No." type="text" required>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Capacity :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="cap" placeholder="Capacity" type="text" required>
                </div>
            </div>
           <div class="row form-group">
               <div class="col-lg-12">
                   <input type="submit" value="Add Train" name="submit" class="btn btn-success btn-block">
                </div>

            </div>
            <div class="form-group">
            <% if (request.getParameter("submit") != null) {
                    if (status) {
                           out.println("<p class='alert alert-success'>Added Successfully.</p>");
                      } 
                      else
                      {
                          out.println("<p class='alert alert-danger'>Error During Adding Station.</p>");
                       }
              }
            %>
            </div>
            </form>
            </div>
           <div class="timingtable">
            <h4>List Of Trains </h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">          
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Train Id</th>
                                            <th>Train No.</th>
                                            <th>Capacity</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <%
                                            for (int i = 0; i < list.size(); i++) {
                                                        Map hashmap = list.get(i);
                                                        out.println("<tr>"
                                                                + "<td data-name='id'>" + hashmap.get("id") + "</td>"
                                                                + "<td data-name='train_no'>" + hashmap.get("train_no") + "</td>"
                                                                + "<td data-name='capacity'>" + hashmap.get("capacity") + "</td>"
                                                                + "<td data-name='ids'><button class='edit-train btn btn-warning'data-id='" + hashmap.get("id") + "'>Edit</button></td>"
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
</div>
</body> 
</html>