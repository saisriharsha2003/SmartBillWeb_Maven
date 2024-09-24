package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.ComplaintsLogic;

/**
 * Servlet implementation class ComplaintStatusServlet
 * Handles fetching and displaying the complaint status for the logged-in consumer.
 * This servlet retrieves all complaints for a consumer based on their ID.
 */
@WebServlet("/ComplaintStatus")
public class ComplaintStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public ComplaintStatusServlet() {
        super();
    }

    /**
     * Processes HTTP GET requests to fetch and display all complaints for the logged-in consumer.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Get the consumer ID from the session
        long conid = Long.parseLong(session.getAttribute("consumer_lgid").toString());
        System.out.println(conid); // Logging the consumer ID for debugging
        
        try {
            // Fetch all complaints for the consumer and store them in a list
            List<HashMap<String, String>> l1 = ComplaintsLogic.fetchAllComplaints(conid);
            
            // Set the list of complaints in the session
            session.setAttribute("view_all_comp", l1);
            
            // Redirect to the view all complaints page
            response.sendRedirect("source/view_all_complaints.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
