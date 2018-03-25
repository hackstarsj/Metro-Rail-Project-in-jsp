<%@page import="java.util.Objects"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
    Map<String,String> process=obj.RechargeProcess(request.getParameter("payment_id"),request.getParameter("payment_request_id"));
    if(Objects.equals(process.get("status"),"failed")){
         response.sendRedirect("rechargecard.jsp?failed=true");
    }
    else if(Objects.equals(process.get("status"),"already")){
         response.sendRedirect("rechargecard.jsp?already=true");
    }
    else if(Objects.equals(process.get("status"),"admin")){
         response.sendRedirect("rechargecard.jsp?admin=true");
    }
    else if(Objects.equals(process.get("status"),"success")){
         response.sendRedirect("rechargecard.jsp?success=true");
    }
    else{
         response.sendRedirect("rechargecard.jsp?something=true");
    }
%>
    </body>
</html>
