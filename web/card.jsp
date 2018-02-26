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
<%! String spages="card"; %>
<%@ include file="nav.jsp" %>
<!--=====================================Header End=======================================-->
    </div>
<div class="row">
    <div class="col-lg-9">
        <main>
            <div class="homecontent" style="min-height: 405px;">
                <h3>We Provide the following Metro Card Services</h3>
                <ul class="card-content">
                    <li>Apply Metro Card</li>
                    <li>Recharge Your Metro Card</li>
                    <li>Balance Enquiry</li>
                </ul>
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