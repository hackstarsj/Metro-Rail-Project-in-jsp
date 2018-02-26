<%-- 
    Document   : secure
    Created on : 25 Feb, 2018, 10:57:21 AM
    Author     : sanjeev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  if(session.getAttribute("email")==null){
    String redirectURL = "index.jsp";
    response.sendRedirect(redirectURL);
  }  
%>