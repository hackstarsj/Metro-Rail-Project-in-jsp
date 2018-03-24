<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Map<String, String> HomeData = obj.HomeDataCount();
    String pages="home";

%>
<%@include file="secure.jsp" %>
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
            <h3>Welcome Admin</h3>
            <div class="row">
                <div class="col-lg-4">
                    <div class="admin-box red-bg"><h4 class="home-box-h4">Total Station</h4><span class="home-box-span"><%=HomeData.get("station") %></span></div>
                </div>
                <div class="col-lg-4">
                    <div class="admin-box green-bg"><h4 class="home-box-h4">Total Routes</h4><span class="home-box-span"><%=HomeData.get("route") %></span></div>
                </div>
                <div class="col-lg-4">
                    <div class="admin-box pink-bg"><h4 class="home-box-h4">Total Train</h4><span class="home-box-span"><%=HomeData.get("trains") %></span></div>                        
                </div>
                <div class="col-lg-4">
                    <div class="admin-box orange-bg"><h4 class="home-box-h4">Total Complaints</h4><span class="home-box-span"><%=HomeData.get("complaints") %></span></div>
                </div>
                <div class="col-lg-4">
                    <div class="admin-box blue-bg"><h4 class="home-box-h4">Total Card Issues</h4><span class="home-box-span"><%=HomeData.get("metro_card") %></span></div>
                </div>
                <div class="col-lg-4">
                    <div class="admin-box purple-bg"><h4 class="home-box-h4">Total Trips</h4><span class="home-box-span"><%=HomeData.get("trip") %></span></div>
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