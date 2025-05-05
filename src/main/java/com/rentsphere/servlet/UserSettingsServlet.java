package com.rentsphere.servlet;

import com.rentsphere.model.User;
import com.rentsphere.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/settings")
public class UserSettingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);

        if (user != null) {
            request.setAttribute("user", user);
            request.setAttribute("isLoggedIn", true);
            request.setAttribute("name", session.getAttribute("name"));
            request.getRequestDispatcher("/client/settings.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String nicNumber = request.getParameter("nic_number");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        User user = new User();
        user.setUserId(userId);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setNicNumber(nicNumber);
        user.setAddress(address);
        user.setPassword(password);

        boolean updated = userService.updateUser(user);

        if (updated) {
            // Refresh session values if changed
            session.setAttribute("name", fullName);
            session.setAttribute("email", email);

            request.setAttribute("success", "Profile updated successfully.");
        } else {
            request.setAttribute("error", "Failed to update profile. Please try again.");
        }

        request.setAttribute("user", user);
        request.setAttribute("isLoggedIn", true);
        request.getRequestDispatcher("/client/settings.jsp").forward(request, response);
    }
}