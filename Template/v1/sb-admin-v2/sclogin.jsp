<%-- 
    Document   : menuDinamico
    Created on : 05/02/2019, 08:44:43 AM
    Author     : epuma
--%>

<%-- 
    Document   : success
    Created on : 25/01/2019, 10:13:21 PM
    Author     : Elgar Eduardo Puma Cruz
--%>

<%
    java.util.Vector menu = (java.util.Vector) session.getAttribute("menuPrincipal");
    System.out.println(" MENU " + menu);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        
        <!--<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.min.js"></script>-->
        <link href="<c:out value="${pageContext.request.contextPath}"/>/botstrap/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="<c:out value="${pageContext.request.contextPath}"/>/botstrap/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript"></script>
        <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/layout-default.css">
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="bg-orange">
            <img id="j_idt6:j_idt8"
                 src="<c:out value="${pageContext.request.contextPath}"/>/images/cabecera_2.png"
                 alt="" class="logo" />
            <a href="validateLogin.do"><img src='<c:out value="${pageContext.request.contextPath}"/>/images/inicio.gif' border=0 /> Inicio</a>&nbsp;&nbsp;|&nbsp;&nbsp; 
            <a href="logout.jsp"><img src='<c:out value="${pageContext.request.contextPath}"/>/images/signOut.gif' border=0 /> Cerrar Sesión</a>&nbsp;&nbsp;
        </div>


        <div class="col-sm-2 b-right">
            <div class="nav-side-menu">
                <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
                <div class="menu-list">
                    <ul id="menu-content" class="menu-content collapse out">
                        <li>
                            <input type="submit" onClick="window.location.href = 'CargaExcel.do?method=inicio'" value="Carga de Archivos" alt="Carga de Archivos" class="btn btn-custom t-12" style="font-size: 12px;">
                        </li>
                        <li>
                            <input type="submit" onClick="window.location.href = 'Asignacion.do?method=inicio'" value="Asignacion" alt="Asignacion" class="btn btn-custom t-12" style="font-size: 12px;">
                            
                        </li>
                        <li>
                            <input type="submit" onClick="window.location.href = 'Consulta.do?method=inicio'" value="Consulta de Trámites" alt="Consulta de Trámites" class="btn btn-custom t-12" style="font-size: 12px;">
                          
                        </li>
                        <li>
                            <input type="submit" onClick="window.location.href = '#'" value="Parámetros" alt="Parámetros" class="btn btn-custom t-12" style="font-size: 12px;">
                        </li>
                        <li>
                            <input type="submit" onClick="window.location.href = '#'" value="Reportes" alt="Reportes" class="btn btn-custom t-12" style="font-size: 12px;">
                        </li>
                        <li>
                            <input type="submit" onClick="window.location.href = '#'" value="Gestión de Cartas" alt="Gestión de Cartas" class="btn btn-custom t-12" style="font-size: 12px;">
                        </li>
                        <li>
                            <input type="submit" onClick="window.location.href = '#'" value="Autorización de Traslado" alt="Autorización de Traslado" class="btn btn-custom t-12" style="font-size: 12px;">
                        </li>
                        <li><input type="submit" onClick="window.location.href = '#'" value="Mantenimiento de Etapas" alt="Mantenimiento de Etapas (Reactivación)" class="btn btn-custom t-12" style="font-size: 12px;">
                            
                        </li>
                        <li>
                            <input type="submit" onClick="window.location.href = '#'" value="Indicadores" alt="Indicadores" class="btn btn-custom t-12" style="font-size: 12px;">
                        </li>
                    </ul>
                </div>
            </div>
        </div>

