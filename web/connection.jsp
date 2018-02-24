<%-- 
    Document   : connection.js
    Created on : 17 Feb, 2018, 9:50:59 PM
    Author     : sanjeev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%
try {
            String connectionURL = "jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=convertToNull";
            Connection connection = null; 
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            connection = DriverManager.getConnection(connectionURL, "root", "");
            if(!connection.isClosed())
                 out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            connection.close();
        }
         catch(Exception ex)
         {
            out.println("Unable to connect to database"+ex);
         } 

%>
<%!
  void getCompaints(){
      
  }
   
%>
