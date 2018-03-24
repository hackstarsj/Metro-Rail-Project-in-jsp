<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status = false;
    if (request.getParameter("submit") != null) {
        String sql = "INSERT INTO `metro_card`(`u_name`, `u_address`, `age`, `gender`, `phone_num`, `email`, `password`, `card_status`) VALUES ('"+request.getParameter("name")+"','"+request.getParameter("address")+"','"+request.getParameter("age")+"','"+request.getParameter("gender")+"','"+request.getParameter("phone")+"','"+request.getParameter("email")+"','"+request.getParameter("password")+"','0')";
        if (obj.InsertData(sql)) {
            status = true;
        } else {
            status = false;
        }
    }
    

%>
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
<%! String spages="apply"; %>
<%@ include file="nav.jsp" %>
<!--=====================================Header End=======================================-->
    </div>
<div class="row">
    <div class="col-lg-9">
        <main>
            <div class="homecontent">
                <form action="" method="post">
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
                    <input type="submit" name="submit" class="btn btn-block btn-success" value="Apply">
                </div>
                </form>
                          <div class="form-group">
            <% if (request.getParameter("submit") != null) {
                    if (status) {
                           out.println("<p class='alert alert-success'>Request for Metro Card Has been Accepted Successfully.</p>");
                      } 
                      else
                      {
                          out.println("<p class='alert alert-danger'>Failed To Process your Request for Metro Card! Contact Administrator.</p>");
                       }
              }
            %>
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