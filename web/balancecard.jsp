<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status = false;
    Boolean block=false;
     List<Map<String,String>> lists=new ArrayList<Map<String, String>>();
    if (request.getParameter("submit") != null) {
        String sql = "SELECT * FROM `metro_card` WHERE `card_num`='"+request.getParameter("cardno")+"' and `password`='"+request.getParameter("password")+"'";
        lists=obj.fetchAllData(sql);
        if (lists.size()>0) {
            if(Objects.equals(lists.get(0).get("card_status"), "0")){
                block=true;
            }
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
<%! String spages="balance"; %>

<%@ include file="nav.jsp" %>
<!--=====================================Header End=======================================-->
    </div>
<div class="row">
    <div class="col-lg-9">
        <main>
            <div class="homecontent" style="min-height: 410px">
                <form action="" method="post">
                <h3>Check Your Current Metro Card Balance!</h3>
                <div class="form-group">
                    <label>Card No.</label>
                    <input type="text" name="cardno" class="form-control">
                </div>
                 <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <div class="form-group">
                    <input type="submit" name="submit"  class="btn btn-block btn-success" value="Balance Enquiry">
                </div>
                </form>
               
                
           <div class="form-group">
            <% if (request.getParameter("submit") != null) {
                    if (status) {
                        if(block){
                          out.println("<p class='alert alert-danger'>Your Metro Card Has Been Disabled! Contact Administrator</p>");                            
                        }
                        else{
                           out.println("<p class='alert alert-success'><b>Current Balance is </b> Rs."+lists.get(0).get("balance")+"</p>");
                           
                        }
                      } 
                      else
                      {
                          out.println("<p class='alert alert-danger'>Invalid Password Or Metro Card Does Not Exist</p>");
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
