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
           <div class="timingtable">
            <h4>List Of Metro Card </h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">          
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <td>Id</td>
                                            <td>Email</td>
                                            <td>Name</td>
                                            <td>Card No.</td>
                                            <td>Action</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Dhanbad</td>
                                            <td>23.55</td>
                                            <td>73.44</td>
                                            <td><button class="edit-cards btn btn-warning" data-id="1">Issue</button></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Dhanbad</td>
                                            <td>23.55</td>
                                            <td>73.44</td>
                                            <td><button class="edit-cards btn btn-warning" data-id="2">Issued</button></td>
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