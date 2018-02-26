<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status=false;
    if(request.getParameter("submit")!=null)
    {
       String sql="INSERT INTO `complaints`(`u_name`, `u_address`, `phone_num`, `msg`, `email`, `age`, `status`) VALUES ('"+request.getParameter("name")+"','"+request.getParameter("address")+"','"+request.getParameter("phone")+"','"+request.getParameter("msg")+"','"+request.getParameter("email")+"','"+request.getParameter("age")+"','0')";
       if(obj.InsertData(sql)){
            status=true;           
       }else{
           status=false;
       }
       //out.println(status);
    }
%>
<!Doctype html>
<html> 
<head> 
<title>Connection with mysql database</title>
<!--====================================Script and StyleSheet=====================================-->
<%! String pages="complaint"; %>
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
                <h3>Please fill this form to Submit your Complaint</h3>
                <form action="" method="post">
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" required name="name" class="form-control">
                </div>
                 <div class="form-group">
                    <label>Email</label>
                    <input type="text" required name="email" class="form-control">
                </div>
                 <div class="form-group">
                    <label>Age</label>
                    <input type="text" required name="age" class="form-control">
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" required name="phone" class="form-control">
                </div>
                 <div class="form-group">
                    <label>Address</label>
                    <input type="text" required name="address" class="form-control">
                </div>
                <div class="form-group">
                    <label>Message</label>
                    <textarea  name="msg" rows="4" class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <input type="submit" name="submit" value="submit" class="btn btn-block btn-success">
                </div>
                <div class="form-group padding-label text-center" >
                    <%
                      if(request.getParameter("submit")!=null){
                          if(status){
                          
                          %>
                              <p class="alert alert-info ">Your Complaint Received Successfully!</p>
                           <%   }
                       else
                       {
                          %>
                             <p class="alert alert-danger">Error During Submitting Your Complaints!</p>
                    
                      <%
                              }
                            }
                       %>

                </div>
                </form>
            </div>            

        </main>
    </div>
    <div class="col-lg-3">
      <%@ include file="sidebar.jsp" %>  
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