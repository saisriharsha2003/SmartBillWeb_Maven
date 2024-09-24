package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.AdminLogic;

/**
 * Servlet implementation class AdminEditProfileServlet
 * Handles requests for editing the admin's profile details such as username and password.
 */
@WebServlet("/EditProfileAdmin")
public class AdminEditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public AdminEditProfileServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests for updating the admin profile details.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extracting form data for username and password
        String uname = request.getParameter("edit-aname");
        String pwd = request.getParameter("edit-apassword");

        // Get the session object
        HttpSession session = request.getSession();
        
        try {
            // Call the logic layer to update the password
            int res = AdminLogic.updatePassword(uname, pwd);
            
            // Create a HashMap to store updated admin details
            HashMap<String, String> mp = new HashMap<>();
            mp.put("username", uname); // Store updated username
            mp.put("password", pwd);   // Store updated password
            
            // Set the updated details in the session
            session.setAttribute("admin_details", mp);
            
            // Redirect to the admin home page after successful update
            response.sendRedirect("source/admin_home.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
