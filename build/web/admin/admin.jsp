<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@include file="secure.jsp" %>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status = false;
    Boolean checked=false;
    if (request.getParameter("submit") != null) {
        List<Map<String,String>> l2=obj.fetchAllData("select * from admin where email='"+request.getParameter("email")+"'");
        if(l2.size()==0){
        String sql = "INSERT INTO `admin`(`a_name`, `a_address`, `phone_num`, `email`, `age`, `gender`, `permission`, `designation`, `password`) VALUES ('"+request.getParameter("name")+"','"+request.getParameter("a_address")+"','"+request.getParameter("phone_num")+"','"+request.getParameter("email")+"','"+request.getParameter("age")+"','"+request.getParameter("gender")+"','1','"+request.getParameter("designation")+"','"+request.getParameter("password")+"')";
        if (obj.InsertData(sql)) {
            status = true;
        } else {
            status = false;
        }
        }
        else{
            checked=true;
        }
    }
    String pages="admin";

%>
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
            <h3>Add Admin</h3>
            <form action="" method="post">
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Name : </label>
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="a_name" placeholder="Name" type="text" required>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Address :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="a_address" placeholder="Address" type="text" required>
                </div>
            </div>
                            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Phone :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="phone_num" placeholder="Phone" type="text" required>
                </div>
            </div>
                            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Email :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="email" placeholder="Email" type="text" required>
                </div>
            </div>
                            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Age :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="age" placeholder="Age" type="text" required>
                </div>
            </div>
                            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Gender :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <Select class="form-control" name="gender" required>
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                </div>
            </div>
                            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Designation :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="designation" placeholder="Designation" type="text" required>
                </div>
            </div>
                            <div class="row form-group">
                <div class="col-lg-3 col-xs-12 padding-label">
                    <label class="control-label">Password :</label> 
                </div>
                <div class="col-lg-3 col-xs-12">
                    <input class="form-control" name="password" placeholder="password" type="password" required>
                </div>
            </div>
                
           <div class="row form-group">
               <div class="col-lg-12">
                   <input type="submit" value="Add Admin" name="submit" class="btn btn-success btn-block">
                </div>

            </div>
            <div class="form-group">
            <% if (request.getParameter("submit") != null) {
                    if (status) {
                           out.println("<p class='alert alert-success'>Added Successfully.</p>");
                      } 
                    else if(checked){
                           out.println("<p class='alert alert-danger'>Sorry Email Already Exist.</p>");
                    }
                      else
                      {
                          out.println("<p class='alert alert-danger'>Error During Adding Admin.</p>");
                       }
              }
            %>
            </div>
            </form>
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