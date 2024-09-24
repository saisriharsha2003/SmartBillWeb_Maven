package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 * Handles user logout operations by invalidating the current session and redirecting to the login page.
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public LogoutServlet() {
        super();
    }

    /**
     * Processes HTTP GET requests to handle user logout operations.
     * Invalidates the current session if it exists and redirects the user to the login page.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current session and invalidate it if it exists
        HttpSession session = request.getSession(false); 
        if (session != null) {
            session.invalidate();
        }
        // Redirect the user to the login page
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
