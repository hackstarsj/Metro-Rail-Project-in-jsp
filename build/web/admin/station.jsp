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
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Station Name. : </label>
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="trainno" placeholder="Train No." type="text">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Latitude :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="lat" placeholder="Latitude" type="text">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Latitude :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="lng" placeholder="Longitude" type="text">
                </div>
            </div>
           <div class="row form-group">
               <div class="col-lg-12">
                   <button class="btn btn-success btn-block">Add Station</button>
                </div>

            </div>
            </div>
           <div class="timingtable">
            <h4>List Of Stations </h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">          
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <td>Station Id</td>
                                            <td>Station Name</td>
                                            <td>Latitude</td>
                                            <td>Longitude</td>
                                            <td>Action</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Dhanbad</td>
                                            <td>23.55</td>
                                            <td>73.44</td>
                                            <td><button class="edit-station btn btn-warning" data-id="1">Edit</button></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Dhanbad</td>
                                            <td>23.55</td>
                                            <td>73.44</td>
                                            <td><button class="edit-station btn btn-warning" data-id="2">Edit</button></td>
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