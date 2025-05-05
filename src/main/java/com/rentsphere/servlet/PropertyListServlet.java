package com.rentsphere.servlet;

import com.rentsphere.model.Property;
import com.rentsphere.service.PropertyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/properties")
public class PropertyListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private PropertyService propertyService;

    @Override
    public void init() throws ServletException {
        propertyService = new PropertyService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch property list from service
        List<Property> properties = propertyService.getAllProperties();
        request.setAttribute("properties", properties);

        // Check login status and set session attributes
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            request.setAttribute("isLoggedIn", true);
            request.setAttribute("userFullName", session.getAttribute("name"));
        } else {
            request.setAttribute("isLoggedIn", false);
        }

        // Forward to property listing page
        request.getRequestDispatcher("/client/properties.jsp").forward(request, response);
    }
}