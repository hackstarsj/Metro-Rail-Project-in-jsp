<%-- 
    Document   : rechargecardpay
    Created on : 24 Mar, 2018, 8:50:43 PM
    Author     : sanjeev
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Objects"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  if(request.getParameter("cardno")==null || request.getParameter("password")==null || request.getParameter("amount")==null){
    String redirectURL = "index.jsp";
    response.sendRedirect(redirectURL);
  }
  
  
%>
<jsp:useBean id="obj1" class="com.metrorail.DataBaseSource"/>  
<%
    Map<String,String> Card=new HashMap<String, String>();
    List<Map<String,String>> Card_detail=obj1.fetchAllData("select * from metro_card where card_num='"+request.getParameter("cardno")+"' and password='"+request.getParameter("password")+"'");
    if(Card_detail.size()==0){
            response.sendRedirect("rechargecard.jsp?invalid=true");
    }
    else{
    out.print(Card_detail.get(0).toString());
     Card=Card_detail.get(0);
    }

%>
<jsp:useBean id="obj2" class="com.metrorail.PayMentApi"/>  
<%
    
    JSONObject json=obj2.sendPOST(request.getParameter("amount"),Card.get("phone_num"),Card.get("u_name"),Card.get("email"));
    if(Objects.equals(json.get("success").toString(),"false")){
        response.sendRedirect("rechargecard.jsp?failed=true");
    }
    JSONObject payment=(JSONObject)json.get("payment_request");
     obj1.InsertData("INSERT INTO `card_recharges`(`card_num`, `status`, `amount`,`txn_id`) VALUES ('"+request.getParameter("cardno")+"','"+payment.get("status").toString()+"','"+request.getParameter("amount").toString()+"','"+payment.get("id").toString()+"')");
  
      response.sendRedirect(payment.get("longurl").toString());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Request</title>
    </head>
    <body>
        
     </body>
</html>
