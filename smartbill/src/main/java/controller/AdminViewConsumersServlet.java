package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.AdminLogic;

/**
 * Servlet implementation class AdminViewConsumersServlet
 * Handles viewing all consumers in the system for the admin.
 * This servlet fetches the list of all consumers and displays them on the admin view page.
 */
@WebServlet("/AdminViewConsumers")
public class AdminViewConsumersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public AdminViewConsumersServlet() {
        super();
    }

    /**
     * Processes HTTP GET requests to retrieve and display all consumers for the admin.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Fetch all consumers for admin and store them in a list
            List<HashMap<String, String>> h1 = AdminLogic.fetchAllConsumers();
            
            // Set the list of consumers in the session
            HttpSession session = request.getSession();
            session.setAttribute("admin_consumers", h1);
            
            // Redirect to the view consumers page
            response.sendRedirect("source/admin_view_consumers.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
