<%-- 
    Document   : tabSeyci
    Created on : 06/04/2019, 10:36:58 PM
    Author     : Elgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
                ul {
		width: 750px;
		list-style: none;
		padding: 0;
		margin: 0;
		display: inline;
		float: left;
		border-bottom: 1px Solid Black;
		}


		ul li {
		width: 100px;
		display: block;
		float: left;
		text-align: center;
		margin-right: 10px;
		position: relative;
		top: 1px;
		}
                
                ul li a { 
		width: 100px;
		display: block;
		background: #3B9CCC;
		border: 1px Solid #000;
		text-decoration: none;
		}


		a.actual {
		width: 100px;
		display: block;
		background: #77BADB;
		border-top: 1px Solid #000;
		border-bottom: 1px Solid #77BADB;
		text-decoration: none;
		}
                
                #contenido {
		width: 750px;
		background: #77BADB;
		float: left;
		margin: 0;
		border-left: 1px Solid #000;
		border-bottom: 1px Solid #000;
		border-right: 1px Solid #000;
		}
        </style>
    </head>
    <body>
        <ul>
	<li><a href="1.html">Sección 1</a></li>
	<li><a href="2.html">Sección 2</a></li>
	<li><a href="3.html">Sección 3</a></li>
	<li><a href="4.html">Sección 4</a></li> 
        </ul>

    <div id="contenido"> 

            <!--Contenido--> 

    </div>
    </body>
</html>
