<%-- 
    Document   : logout
    Created on : 25 Feb, 2018, 11:05:55 AM
    Author     : sanjeev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("email");
    response.sendRedirect("index.jsp");
%>
