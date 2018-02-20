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
            <h3>Add Route</h3>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-6 padding-label">
                    <label class="control-label">Route Name. : </label>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <input class="form-control" name="trainno" placeholder="Train No." type="text">
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
                    <td><select class="form-control"><option>Station</option></select></td>
                    <td><input type="text" class="form-control" placeholder="Position"></td>
                    <td><input type="text" class="form-control" placeholder="Distance"></td>
                    <td><button class="btn btn-danger btn-block btn-delete-station">Delete </button></td>
                </tr>
            </table>
            </div>
           <div class="row form-group">
                <div class="col-lg-6">
                   <button class="btn btn-success btn-block btn-add-station-routes">Add Station</button>
                </div>

               <div class="col-lg-6">
                   <button class="btn btn-success btn-block">Add Train</button>
                </div>
            </div>
            </div>
           <div class="timingtable">
            <h4>List Of All Routes </h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">          
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <td>Route Id</td>
                                            <td>Routes Name</td>
                                            <td>No. of Station</td>
                                            <td>Action</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Dhanbad</td>
                                            <td>74</td>
                                            <td><button class="btn-edit-routes btn btn-warning" data-id="1">Edit</button></td>
                                        </tr>
                                        <tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Dhanbad</td>
                                            <td>74</td>
                                            <td><button class="btn-edit-routes btn btn-warning" data-id="1">Edit</button></td>
                                        </tr>
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