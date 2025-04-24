<%-- 
    Document   : listarTareas
    Created on : 24/04/2025, 7:52:51 a. m.
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Tarea"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Tareas</title>
        <style>
            .completada{
                text-decoration: line-through;
                color:gray;
            }
        </style>
    </head>
    <body>
        <h1>Lista de Tareas</h1>
        <a href="${pageContext.request.contextPath}/tareas/nueva">Nueva Tarea</a>
        <% List<Tarea> tarea =(List<Tarea>)
                session.getAttribute("tarea");%>
                <%if (tareas != null && !tareas.isEmpty()){%>
                <ul>
                    <% fr (Tarea tarea : tarea){</ul%>
                    <li class="<%=tarea.iisCompletada()?"completada":""%>">
                        <%=tarea.getDescripcion()%>
                        <% if (!tarea.isCompletada()){%>
                        <a
                            href="${pageContext.request.contextPath}/tareas/completar/<%=tarea.getId()%>">[Completar]</a>
                            <%}%>
                    </li>
                     <%}%>
                </ul>
                <%}else{%>
                <p>No hay tareas pendientes.</p>
                <%}%>
                







