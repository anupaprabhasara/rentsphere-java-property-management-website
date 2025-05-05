package com.rentsphere.servlet;

import com.rentsphere.model.Admin;
import com.rentsphere.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/admin")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminService adminService;

    @Override
    public void init() throws ServletException {
        adminService = new AdminService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session and Role Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String role = (String) session.getAttribute("role");
        if (!"Admin".equals(role)) {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('You do not have permission to access this page.');");
            response.getWriter().println("window.location = '" + request.getContextPath() + "/admin/logout';</script>");
            return;
        }

        String action = request.getParameter("action");

        try {
            if (action == null) {
                request.setAttribute("admins", adminService.getAllAdmins());
                request.getRequestDispatcher("/admin/admins/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                request.getRequestDispatcher("/admin/admins/create.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Admin admin = adminService.getAdminById(id);
                if (admin != null) {
                    request.setAttribute("admin", admin);
                    request.getRequestDispatcher("/admin/admins/update.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Admin not found.");
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                adminService.deleteAdmin(id);
                response.sendRedirect(request.getContextPath() + "/admin/admin");

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session and Role Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String role = (String) session.getAttribute("role");
        if (!"Admin".equals(role)) {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('You do not have permission to perform this action.');");
            response.getWriter().println("window.location = '" + request.getContextPath() + "/logout';</script>");
            return;
        }

        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                String fullName = request.getParameter("full_name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String phone = request.getParameter("phone");
                String roleInput = request.getParameter("role");

                Admin admin = new Admin();
                admin.setFullName(fullName);
                admin.setEmail(email);
                admin.setPassword(password);
                admin.setPhone(phone);
                admin.setRole(roleInput);

                if (adminService.createAdmin(admin)) {
                    response.sendRedirect(request.getContextPath() + "/admin/admin");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create admin.");
                }

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String fullName = request.getParameter("full_name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String phone = request.getParameter("phone");
                String roleInput = request.getParameter("role");

                Admin admin = new Admin();
                admin.setAdminId(id);
                admin.setFullName(fullName);
                admin.setEmail(email);
                admin.setPassword(password);
                admin.setPhone(phone);
                admin.setRole(roleInput);

                if (adminService.updateAdmin(admin)) {
                    response.sendRedirect(request.getContextPath() + "/admin/admin");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update admin.");
                }

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }
}