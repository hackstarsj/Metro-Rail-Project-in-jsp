<%-- 
    Document   : apiservice
    Created on : 25 Feb, 2018, 12:13:14 PM
    Author     : sanjeev
--%>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Objects"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="secure.jsp" %>
<jsp:useBean id="obj" class="com.metrorail.DataBaseSource"/>  
<%
     String method=request.getParameter("method");
    if(session.getAttribute("email")!=null){
     if(Objects.equals(method, "station")){
         if(obj.InsertData("UPDATE `station` SET `s_name`='"+request.getParameter("name") +"',`latitude`='"+request.getParameter("lat") +"',`longitude`='"+request.getParameter("lng") +"' WHERE id='"+request.getParameter("id") +"'")){
           out.print("true");  
         }else{
             out.print("false");
         }
     }
     else if(Objects.equals(method, "train")){
         if(obj.InsertData("UPDATE `trains` SET `train_no`='"+request.getParameter("train_no") +"',`capacity`='"+request.getParameter("capacity") +"' WHERE id='"+request.getParameter("id") +"'")){
           out.print("true");  
         }else{
             out.print("false");
         }
     }
     else if(Objects.equals(method, "fair")){
         if(obj.InsertData("UPDATE `fair` SET `amt`='"+request.getParameter("charge") +"',`min_distances`='"+request.getParameter("min_distances") +"',`max_distances`='"+request.getParameter("max_distances") +"' WHERE id='"+request.getParameter("id") +"'")){
           out.print("true");  
         }else{
             out.print("false");
         }
       }
    }
     if(Objects.equals(method,"getstation")){
       JSONArray StationList=obj.GetStation(request.getParameter("station"));
         out.print(StationList);
        }
     else{
         out.print("Method Not Found");
     }
     
%>