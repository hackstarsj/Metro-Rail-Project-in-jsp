<%
  if(session.getAttribute("email")!=null){
    String redirectURL = "adminhome.jsp";
    response.sendRedirect(redirectURL);
  }  
%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status=false;
   if(request.getParameter("submit")!=null){
       
     List<Map<String,String>> list= obj.fetchAllData("SELECT * FROM `admin` where email='"+request.getParameter("email")+"' and password='"+request.getParameter("password")+"'");
     if(list.size()>0){
         status=true;
         session.setAttribute("email",request.getParameter("email")); 
         session.setAttribute("id",list.get(0).get("id"));
     }else{
         status=false;
     }
   
   }
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
    <div class="col-lg-12">
        <main>
            <div class="homecontent" style="min-height: 410px">
                <div class="col-lg-6 col-lg-offset-3 admin-form">
                <form action="" method="post">
                <h3>Admin Login</h3>
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" name="email" class="form-control" required>
                </div>
                 <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div class="form-group">
                    <input type="submit" name="submit" class="btn btn-block btn-warning" value="Login">
                </div>
                <div class="form-group">
                    <%
                           if(request.getParameter("submit")!=null){
                               if(status){
                                   out.println("<p class='alert alert-success'>Login Successfully! Redirecting...</p>");
                                   out.println("<script>setTimeout(function(){ location='adminhome.jsp';  },1000)</script>");
                                   
                               }else{
                                   out.println("<p class='alert alert-danger'>Invalid Login Details!</p>");

                               }
                            }
                    %>
                </div>
                </form>
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
