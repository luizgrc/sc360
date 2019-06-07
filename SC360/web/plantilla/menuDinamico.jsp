<%-- 
    Document   : menuDinamico
    Created on : 05/02/2019, 08:44:43 AM
    Author     : epuma
--%>

<%-- 
    Document   : menuDinamico v2.0
    Created on : 17/05/2019
    Author     : Luis García
--%>

<%
    java.util.Vector menu = (java.util.Vector) session.getAttribute("menuPrincipal");
    System.out.println(" MENU " + menu);
    String usuario = (String) session.getAttribute("nickUsuario");
    System.out.println(" usuario " + usuario.toUpperCase());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>BIENVENIDO AL SISTEMA COORDINADOR 360</title>

    <!-- Core CSS - Include with every page -->
    <link href="<c:out value="${pageContext.request.contextPath}"/>/bootstrap-3.4.1/css/bootstrap.css" rel="stylesheet">
    <link href="<c:out value="${pageContext.request.contextPath}"/>/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="<c:out value="${pageContext.request.contextPath}"/>/css/sb-admin.css" rel="stylesheet">

</head>

<body>

    <div id="wrapper" style="background-color: #FF4C01;">
        <!-- /navbar-header -->
        <nav class="navbar navbar-default navbar-fixed-top nav-custom" role="navigation" >
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               
            </div>
            <!-- /.navbar-header -->
            <!-- /dropdown bars -->
            <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <span style="color: #fff"><%=usuario.toUpperCase()%></span>
                    </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bars fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="validateLogin.do"><i class="fa fa-home fa-fw"></i> Inicio</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Salir</a>
                        </li>
                    </ul>
                   
                </li>
            </ul>
             <!-- /.dropdown-bars -->
              <!-- /Menu -->
            <div class="navbar-default navbar-static-side" role="navigation"  >
                <div class="sidebar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="CargaExcel.do?method=inicio"><i class="fa fa-upload fa-fw"></i> Carga de Archivos</a>
                        </li>
                        <li>
                            <a href="Asignacion.do?method=inicio"><i class="fa fa-check-circle-o fa-fw"></i><!--<span class="fa arrow"></span>--> Asignacion</a>
                            <!-- /.nav-second-level -->
                            <!--<ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>-->
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="Consulta.do?method=inicio"><i class="fa fa-search fa-fw"></i> Consulta de Trámites</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i> Parámetros</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-book fa-fw"></i> Reportes</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-envelope fa-fw"></i> Gestión de Cartas<!--<span class="fa arrow"></span>--></a>
                            <!--
                              /nav-second-level comentario
                            
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                     /nav-third-level comentario
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    /.nav-third-level comentario
                                </li>
                                 
                            </ul>
                           
                            /.nav-second-level comentario -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-exclamation-triangle fa-fw"></i> Autorización de Traslado</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-cog fa-fw"></i> Mantenimiento de Etapas</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw" aria-hidden="true"></i> Indicadores</a>
                        </li>
                    </ul>
                    <!-- /#side-menu -->
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.Menu -->
        </nav>


           
           



