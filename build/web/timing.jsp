<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status = false;
    List<Map<String,String>> Trips=new ArrayList<Map<String, String>>();
    if (request.getParameter("submit") != null) {
        Trips=obj.fetchTrains(request.getParameter("source"),request.getParameter("destination"));
    }

    String pages="timing";

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
<%! String pages="timing"; %>
<%@ include file="nav.jsp" %>
<!--=====================================Header End=======================================-->
    </div>
<div class="row">
    <div class="col-lg-9">
        <main>
            <div class="homecontent">
            <h3>Time Table For Journey </h3>
            <form  action="" method="post">
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Source Station : </label>
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control input_auto_station" <% if (request.getParameter("source")!=null) { out.print("value='"+request.getParameter("source")+"'"); }%> required="required" list="station" name="source" placeholder="Source Station" type="text">
                    <datalist id="station"></datalist>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Destination Station :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control input_auto_station" <% if (request.getParameter("destination")!=null) { out.print("value='"+request.getParameter("destination")+"'"); }%> required="required" name="destination" list="station" placeholder="Destination Station" type="text">
                </div>
            </div>
           <div class="row form-group">
                <div class="col-lg-12 col-xs-12">
                    <input type="submit" value="Find Trains" name="submit" class="btn-success btn-block btn">
                </div>
            </div>
            </form>
            </div>
            
            <% if(request.getParameter("submit")!=null) { if(Trips.size()>0) { %>
           <div class="timingtable">
            <h4>List Of Trains </h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">          
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th rowspan="2" style="text-align: center;vertical-align: middle;">Train No.</th>
                                            <th colspan="2">Source </th>
                                            <th colspan="2">Destination </th>
                                        </tr>
                                        <tr>
                                            <th>Arrival</th>
                                            <th>Departure</th>
                                            <th>Arrival</th>
                                            <th>Departure</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(int i=0;i<Trips.size();i++) { Map<String,String> data=Trips.get(i); %> 
                                        <tr>
                                            <td><%=data.get("train") %></td>
                                            <td><%=data.get("sa_time") %></td>
                                            <td><%=data.get("sd_time") %></td>
                                            <td><%=data.get("ea_time") %></td>
                                            <td><%=data.get("ed_time") %></td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                    
                                </table>
                        </div>
                    </div>
                </div>
            </div>
            <% }else { %>
            <p class="alert-danger alert">No Direct Trains Found</p>
            <%} } %>
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
</div>
</body> 
</html>