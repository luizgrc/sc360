<%-- 
    Document   : logout
    Created on : 03/02/2019, 03:32:03 PM
    Author     : Elgar
--%>

<%
System.out.println(" ENTRO A SALIR ");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
