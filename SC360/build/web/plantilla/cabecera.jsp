<%-- 
    Document   : cabecera
    Created on : 05/02/2019, 08:41:33 AM
    Author     : epuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<div class="bg-orange">
            <img id="j_idt6:j_idt8"
                 src="<c:out value="${pageContext.request.contextPath}"/>/images/cabecera_2.png"
                 alt="" class="logo" />
            <a href="validateLogin.do"><img src='<c:out value="${pageContext.request.contextPath}"/>/images/inicio.gif' border=0 /> Inicio</a>&nbsp;&nbsp;|&nbsp;&nbsp; 
    <a href="logout.jsp"><img src='<c:out value="${pageContext.request.contextPath}"/>/images/signOut.gif' border=0 /> Cerrar Sesión</a>&nbsp;&nbsp;
</div>