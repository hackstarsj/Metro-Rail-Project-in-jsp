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
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Train No. : </label>
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="trainno" placeholder="Train No." type="text">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Capacity :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="capacity" placeholder="Capacity" type="text">
                </div>
            </div>
           <div class="row form-group">
               <div class="col-lg-12">
                   <button class="btn btn-success btn-block">Add Train</button>
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
                                            <td>Train Id</td>
                                            <td>Train No.</td>
                                            <td>Capacity</td>
                                            <td>Action</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>545</td>
                                            <td>7</td>
                                            <td><button class="edit-train btn btn-warning" data-id="1">Edit</button></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>545</td>
                                            <td>7</td>
                                            <td><button class="edit-train btn btn-warning" data-id="1">Edit</button></td>
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