<%-- 
    Document   : sidebarcard
    Created on : 20 Feb, 2018, 6:08:05 PM
    Author     : sanjeev
--%>

<%@page import="java.util.Objects"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <div class="homeside card-side">
            <h3>Our Services!</h3>
            <img src="img/service.jpg" class="img-responsive">
            <ul style="padding-left: 0;">
                <li <% if(Objects.equals(spages, "apply")){ %>class="active"<% } %>><a href="applycard.jsp">Apply</a></li>
                <li <% if(Objects.equals(spages, "balance")){ %>class="active"<% } %>><a href="balancecard.jsp">Balance Enquiry</a></li>
                <li <% if(Objects.equals(spages, "recharge")){ %>class="active"<% } %>><a href="rechargecard.jsp">Recharge</a></li>
            </ul>
        </div>
