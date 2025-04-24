/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "TareasServlet", urlPatterns = {"/tareas/*"})
public class TareasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Tarea> listaTareas = (List<Tarea>) session.getAttribute("tareas");
        if (listaTareas == null) {
            listaTareas = new ArrayList<>();
            session.setAttribute("tareas", listaTareas);
        }
        
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || "/".equals(pathInfo)) {
            // Listar tareas
            request.getRequestDispatcher("/WEB-INF/views/listarTareas.jsp").forward(request, response);
        } else if ("/nueva".equals(pathInfo)) {
            // Formulario nueva tarea
            request.getRequestDispatcher("/WEB-INF/views/nuevaTarea.jsp").forward(request, response);
        } else if (pathInfo.startsWith("/completar/")) {
            // Completar tarea
            try {
                int id = Integer.parseInt(pathInfo.substring("/completar/".length()));
                for (Tarea tarea : listaTareas) {
                    if (tarea.getId() == id) {
                        tarea.setCompletada(true);
                        break;
                    }
                }
            } catch (NumberFormatException e) {
                // Ignorar
            }
            response.sendRedirect(request.getContextPath() + "/tareas");
        } else if (pathInfo.startsWith("/eliminar/")) {
            // Eliminar tarea
            try {
                int id = Integer.parseInt(pathInfo.substring("/eliminar/".length()));
                listaTareas.removeIf(tarea -> tarea.getId() == id);
            } catch (NumberFormatException e) {
                // Ignorar
            }
            response.sendRedirect(request.getContextPath() + "/tareas");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Tarea> listaTareas = (List<Tarea>) session.getAttribute("tareas");
        if (listaTareas == null) {
            listaTareas = new ArrayList<>();
            session.setAttribute("tareas", listaTareas);
        }
        
        String pathInfo = request.getPathInfo();
        if ("/guardar".equals(pathInfo)) {
            String descripcion = request.getParameter("descripcion");
            if (descripcion != null && !descripcion.trim().isEmpty()) {
                int nuevoId = 1;
                if (!listaTareas.isEmpty()) {
                    nuevoId = listaTareas.get(listaTareas.size() - 1).getId() + 1;
                }
                Tarea nuevaTarea = new Tarea(nuevoId, descripcion);
                listaTareas.add(nuevaTarea);
            }
            response.sendRedirect(request.getContextPath() + "/tareas");
        }
    }
}
    

}
