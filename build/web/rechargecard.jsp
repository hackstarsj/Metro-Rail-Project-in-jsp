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
<%! String pages="card"; %>
<%! String spages="recharge"; %>
<%@ include file="nav.jsp" %>
<!--=====================================Header End=======================================-->
    </div>
<div class="row">
    <div class="col-lg-9">
        <main>
            <div class="homecontent" style="min-height: 410px">
                <h3>Recharge Your Metro Card Online!</h3>
                <div class="form-group">
                    <label>Card No.</label>
                    <input type="text" name="cardno" class="form-control">
                </div>
                 <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <div class="form-group">
                    <label>Recharge Amount</label>
                    <input type="text" name="amount" class="form-control">
                </div>
                <div class="form-group">
                    <input type="submit" name="name" class="btn btn-block btn-success" value="Recharge">
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
