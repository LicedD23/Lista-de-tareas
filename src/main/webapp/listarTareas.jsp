<%-- 
    Document   : listarTareas
    Created on : 24/04/2025, 7:52:51 a. m.
    Author     : SENA
--%>


<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Tarea" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Tareas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        
        .nuevo-btn {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        
        .nuevo-btn:hover {
            background-color: #45a049;
        }
        
        ul {
            list-style-type: none;
            padding: 0;
        }
        
        li {
            background-color: white;
            padding: 12px 15px;
            margin-bottom: 10px;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .acciones {
            display: flex;
            gap: 10px;
        }
        
        .completar-btn {
            background-color: #2196F3;
            color: white;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 3px;
        }
        
        .eliminar-btn {
            background-color: #f44336;
            color: white;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 3px;
        }
        
        .completada {
            text-decoration: line-through;
            color: gray;
        }
        
        .contenedor {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .mensaje {
            text-align: center;
            padding: 20px;
            background-color: white;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12);
        }
    </style>
</head>
<body>
    <div class="contenedor">
        <h1>Lista de Tareas</h1>
        <a href="${pageContext.request.contextPath}/tareas/nueva" class="nuevo-btn">Nueva Tarea</a>
        
        <% List<Tarea> tareas = (List<Tarea>) session.getAttribute("tareas"); %>
        <% if (tareas != null && !tareas.isEmpty()) { %>
            <ul>
                <% for (Tarea tarea : tareas) { %>
                    <li>
                        <span class="<%= tarea.isCompletada() ? "completada" : "" %>">
                            <%= tarea.getDescripcion() %>
                        </span>
                        <div class="acciones">
                            <% if (!tarea.isCompletada()) { %>
                                <a href="${pageContext.request.contextPath}/tareas/completar/<%= tarea.getId() %>" class="completar-btn">Completar</a>
                            <% } %>
                            <a href="${pageContext.request.contextPath}/tareas/eliminar/<%= tarea.getId() %>" class="eliminar-btn">Eliminar</a>
                        </div>
                    </li>
                <% } %>
            </ul>
        <% } else { %>
            <div class="mensaje">
                <p>No hay tareas pendientes.</p>
            </div>
        <% } %>
    </div>
</body>
</html>






