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
 * Servlet implementation class AdminUpdateComplaintServlet
 * Handles updating the status of a specific complaint in the system.
 * This servlet processes the update request and fetches the updated complaint details.
 */
@WebServlet("/UpdateComplaint")
public class AdminUpdateComplaintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public AdminUpdateComplaintServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to update the status of a complaint.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the session object
        HttpSession session = request.getSession();
        
        // Retrieve complaint ID from the request
        int cmpid = Integer.parseInt(request.getParameter("up_comp"));
        
        try {
            // Call the logic layer to update the complaint status
            int res = AdminLogic.updateComplaint(cmpid);
            
            if (res == 1) {
                // Fetch updated complaint details and store them in session
                HashMap<String, String> lh1 = AdminLogic.fetchUpdatedComplaint(cmpid);
                session.setAttribute("upd_comp_det", lh1);
            }
            
            // Redirect to the complaint update page after successful update
            response.sendRedirect("source/admin_complaint_update.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
