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
                <form action="rechargecardpay.jsp" method="post">
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
                <% if(request.getParameter("invalid")!=null) { %>
                <div class="form-group">
                    <p class="alert alert-danger">Invalid Card Details! Try Again.</p>
                </div>
                <% } else if(request.getParameter("failed")!=null) {%>
                <div class="form-group">
                    <p class="alert alert-danger">Failed To Reach Payment Server! Try Again.</p>
                </div>
                <% } else if(request.getParameter("already")!=null) {%>
                <div class="form-group">
                    <p class="alert alert-danger">Your Metro Card Has Already Been Recharged.</p>
                </div>
                <% } else if(request.getParameter("success")!=null) {%>
                <div class="form-group">
                    <p class="alert alert-success">Your Metro Card Has Been Recharged Successfully.</p>
                </div>
                <% } else if(request.getParameter("something")!=null) {%>
                <div class="form-group">
                    <p class="alert alert-danger">Something Went Wrong Please Contact Admin.</p>
                </div>
                <% } else if(request.getParameter("admin")!=null) {%>
                <div class="form-group">
                    <p class="alert alert-info">Your payment has been Done.Please Contact Admin for Update Your Balance Manually!</p>
                </div>
                <% } %>
                </form>
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
