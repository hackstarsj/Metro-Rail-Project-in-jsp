<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@include file="secure.jsp" %>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Boolean status = false;
    Boolean checked=false;
    if (request.getParameter("submit") != null) {
        List<Map<String,String>> ch=obj.fetchAllData("select * from metro_card where card_num='"+request.getParameter("cardno")+"'");
        if(ch.size()==0){
        String sql = "UPDATE `metro_card` SET `card_num`='"+request.getParameter("cardno")+"',`card_status`='1',`balance`='0' WHERE `id`='"+request.getParameter("cid")+"'";
        if (obj.InsertData(sql)) {
                          final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
  // Get a Properties object
     Properties props = System.getProperties();
     props.setProperty("mail.smtp.host", "smtp.gmail.com");
     props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
     props.setProperty("mail.smtp.socketFactory.fallback", "false");
     props.setProperty("mail.smtp.port", "465");
     props.setProperty("mail.smtp.socketFactory.port", "465");
     props.put("mail.smtp.auth", "true");
     props.put("mail.debug", "true");
     props.put("mail.store.protocol", "pop3");
     props.put("mail.transport.protocol", "smtp");
     final String username = "sanjeevmetrorail@gmail.com";//
     final String password = "sanjeev@123";
     String result="";
     try{
     Session sessions = Session.getInstance(props, 
                          new Authenticator(){
                             protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(username, password);
                             }});

   // -- Create a new message --
       Message msg = new MimeMessage(sessions);

  // -- Set the FROM and TO fields --
       msg.setFrom(new InternetAddress("sanjeevmetrorail@gmail.com"));
       msg.setRecipients(Message.RecipientType.TO, 
                      InternetAddress.parse(request.getParameter("email"),false));
       msg.setSubject("Card Has Been Issued");
       msg.setText("your Metro Card has been Activated With card No. "+request.getParameter("cardno")+". Please visit neares Metro Station To Collect your Card");
        msg.setSentDate(new Date());
       Transport.send(msg);
       //System.out.println("Message sent.");
      }catch (MessagingException e){ System.out.println("Error " + e);}

            status = true;
            
        } else {
            status = false;
        }
        }
        else{
            checked=true;
        }
    }
    List<Map<String, String>> list = obj.fetchAllData("select * from metro_card");
    String pages="card";

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
           <div class="timingtable">
            <h4>List Of Metro Card </h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">          
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Email</th>
                                            <th>Name</th>
                                            <th>Card No.</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(int i=0;i<list.size();i++) { %>
                                        <tr>
                                            <td><%=list.get(i).get("id") %></td>
                                            <td><%=list.get(i).get("email") %></td>
                                            <td><%=list.get(i).get("u_name") %></td>
                                            <td><%=list.get(i).get("card_num") %></td>
                                            <% if(Objects.equals(list.get(i).get("card_status"),"1")) { %>
                                            <td><button class="btn btn-warning" data-id="<%=list.get(i).get("id") %>" disabled="disabled">Issued</button></td>
                                             <% } else { %>
                                             <td><button class="edit-cards btn btn-warning" data-id="<%=list.get(i).get("id") %>" data-toggle="modal" data-target="#myModal">Issue</button></td>
                                             <% } %>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                    
                                </table>
                        </div>
                    </div>
                                        <div class="col-lg-12">
            <div class="form-group">
            <% if (request.getParameter("submit") != null) {
                    if (status) {
                        
                           out.println("<p class='alert alert-success'>Issued Successfully.</p>");
                      } 
                    else if(checked){
                           out.println("<p class='alert alert-success'>Card no. Already Exist.</p>");
                    }
                      else
                      {
                          out.println("<p class='alert alert-danger'>Error During Issuing Card.</p>");
                       }
              }
            %>
            </div>
          </div>

                </div>
            </div>
                                    
        </main>
    </div>
    <div class="col-lg-3">
      <%@ include file="adminsidebar.jsp" %>  
    </div>
</div>
   <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Issue Metro Card</h4>
        </div>
        <div class="modal-body">
          <form action="" method="post">
          <p><b>Email : </b><span id="r_email">sanjeev</span></p>
            <input type="hidden" name="email" id="in_remail">
            <input type="hidden" name="cid" id="in_rid">
            <p>Card No.</p>
            <p><input id="r_reply" style="width: 100%;" name="cardno" placeholder="Card No" class="form-control"></p>
          <p><input name="submit" value="Activate Card" class="btn btn-success  btn-block" type="submit"></p>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
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