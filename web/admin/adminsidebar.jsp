<%-- 
    Document   : sidebarcard
    Created on : 20 Feb, 2018, 6:08:05 PM
    Author     : sanjeev
--%>

<%@page import="java.util.Objects"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <div class="homeside card-side">
            <h3>Manage System</h3>
            <img src="../img/admin.png" class="img-responsive">
            <ul style="padding-left: 0;">
                <li <% if(Objects.equals(pages, "home")){ %>class="active"<% } %>><a href="index.jsp">Dashboard</a></li>
                <li <% if(Objects.equals(pages, "station")){ %>class="active"<% } %>><a href="station.jsp">Manage Station</a></li>
                <li <% if(Objects.equals(pages, "route")){ %>class="active"<% } %>><a href="route.jsp">Manage Route</a></li>
                <li <% if(Objects.equals(pages, "train")){ %>class="active"<% } %>><a href="train.jsp">Manage Train</a></li>
                <li <% if(Objects.equals(pages, "fair")){ %>class="active"<% } %>><a href="fair.jsp">Manage Fair</a></li>
                <li <% if(Objects.equals(pages, "admin")){ %>class="active"<% } %>><a href="admin.jsp">Manage Admin</a></li>
                <li <% if(Objects.equals(pages, "trip")){ %>class="active"<% } %>><a href="trip.jsp">Manage Trip</a></li>
                <li <% if(Objects.equals(pages, "complaint")){ %>class="active"<% } %>><a href="complaint.jsp">Complaints</a></li>
                <li <% if(Objects.equals(pages, "card")){ %>class="active"<% } %>><a href="metrocard.jsp">Metro Card</a></li>
                <li <% if(Objects.equals(pages, "logout")){ %>class="active"<% } %>><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
