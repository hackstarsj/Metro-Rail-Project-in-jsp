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
<%@ include file="nav.jsp" %>
<!--=====================================Header End=======================================-->
    </div>
<div class="row">
    <div class="col-lg-9">
        <main>
            <div class="homecontent">
                <h3>Apply Metro Card</h3>
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" name="name" class="form-control">
                </div>
                 <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control">
                </div>
                 <div class="form-group">
                    <label>Age</label>
                    <input type="text" name="age" class="form-control">
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" name="phone" class="form-control">
                </div>
                 <div class="form-group">
                    <label>Email</label>
                    <input type="text" name="email" class="form-control">
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <textarea  name="address" rows="4" class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <input type="submit" name="name" class="btn btn-block btn-success" value="Apply">
                </div>
           </div>            

        </main>
    </div>
    <div class="col-lg-3">
      <%@ include file="sidebarcard.jsp" %>  
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