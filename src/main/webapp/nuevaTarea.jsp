<%-- 
    Document   : nuevaTarea
    Created on : 24/04/2025, 7:53:04 a. m.
    Author     : SENA
--%>               
    <%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nueva Tarea</title>
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
        
        .contenedor {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12);
        }
        
        form {
            display: flex;
            flex-direction: column;
        }
        
        label {
            margin-bottom: 10px;
            font-weight: bold;
        }
        
        input[type="text"] {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        
        .volver-btn {
            display: inline-block;
            margin-top: 20px;
            color: #2196F3;
            text-decoration: none;
        }
        
        .volver-btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="contenedor">
        <h1>Nueva Tarea</h1>
        <form action="${pageContext.request.contextPath}/tareas/guardar" method="post">
            <label for="descripcion">Descripción:</label>
            <input type="text" id="descripcion" name="descripcion" required>
            <input type="submit" value="Guardar">
        </form>
        <a href="${pageContext.request.contextPath}/tareas" class="volver-btn">Volver a la lista</a>
    </div>
</body>
</html>
