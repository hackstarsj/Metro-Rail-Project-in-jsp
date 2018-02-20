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
    <div class="col-lg-12">
        <main>
            <div class="homecontent" style="min-height: 410px">
                <div class="col-lg-6 col-lg-offset-3 admin-form">
                <h3>Admin Login</h3>
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" name="cardno" class="form-control">
                </div>
                 <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <div class="form-group">
                    <input type="submit" name="name" class="btn btn-block btn-warning" value="Login">
                </div>
                <div class="form-group">
                    <p class="alert alert-danger"><b>Your Current Balance is :</b> Rs.70.00</p>
                </div>
                </div>
           </div>            

        </main>
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
