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
            <h4>List Of Trains </h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">          
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <td>Train No.</td>
                                            <td colspan="2">Source </td>
                                            <td colspan="2">Destination </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>Arrival</td>
                                            <td>Departure</td>
                                            <td>Arrival</td>
                                            <td>Departure</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                1211
                                            </td>
                                            <td>01:00</td>
                                            <td>01:05</td>
                                            <td>05:00</td>
                                            <td>05:08</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                1211
                                            </td>
                                            <td>01:00</td>
                                            <td>01:05</td>
                                            <td>05:00</td>
                                            <td>05:08</td>
                                        </tr>
                                    </tbody>
                                    
                                </table>
                        </div>
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
</div>
</body> 
</html>