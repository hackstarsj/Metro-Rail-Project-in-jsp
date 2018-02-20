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
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Trip Code. : </label>
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="tripcode" placeholder="Train No." type="text">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Select Route :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <select class="form-control"><option>Select Route</option></select>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Select Train :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <select class="form-control"><option>Select Train</option></select>
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
                <tr>
                    <td><select class="form-control"><option>Station</option></select></td>
                    <td><input type="time" class="form-control" placeholder="Arrival"></td>
                    <td><input type="time" class="form-control" placeholder="Departure"></td>
                    <td><button class="btn btn-danger btn-block btn-delete-station-t">Delete </button></td>
                </tr>
            </table>
            </div>
           <div class="row form-group">
                <div class="col-lg-6">
                   <button class="btn btn-success btn-block btn-add-station-trip">Add Station</button>
                </div>
               <div class="col-lg-6">
                   <button class="btn btn-success btn-block">Add Trip</button>
                </div>

            </div>
            </div>
           <div class="timingtable">
            <h4>List Of Trips </h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">          
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <td>Trip Code</td>
                                            <td>Train No.</td>
                                            <td>Route</td>
                                            <td>No. of Station</td>
                                            <td>Action</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>1</td>
                                            <td>545</td>
                                            <td>7</td>
                                            <td><button class="edit-trip btn btn-warning" data-id="1">Edit</button></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>1</td>
                                            <td>545</td>
                                            <td>7</td>
                                            <td><button class="edit-trip btn btn-warning" data-id="1">Edit</button></td>
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