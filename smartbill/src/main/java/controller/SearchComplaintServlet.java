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

import logic.ComplaintsLogic;

/**
 * Servlet implementation class SearchComplaintServlet
 * Handles search requests for complaint details by complaint ID. Fetches the complaint details and forwards the user to the appropriate view.
 */
@WebServlet("/SearchComplaint")
public class SearchComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public SearchComplaintServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to search for complaint details by complaint ID.
     * Validates the existence of the complaint and retrieves its details if available.
     * Forwards to the appropriate view or returns an error message if the complaint is not found.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve complaint ID from request parameter
        int compid = Integer.parseInt(request.getParameter("search_compid"));
        
        try {
            // Check if the complaint exists
            boolean iscomp = ComplaintsLogic.isComplaintExist(compid);
            if (iscomp) {
                // Fetch complaint details if the complaint exists
                HashMap<String, String> scomp = ComplaintsLogic.fetchComplaintDetailsById(compid);
                HttpSession session = request.getSession();
                session.setAttribute("search_complaint_id", scomp);

                // Redirect to the complaint details page
                response.sendRedirect("source/complaint_details_id.jsp");
            } else {
                // Set error attributes and forward to the search complaint page if the complaint is not found
                request.setAttribute("er_comp_id", compid);
                request.setAttribute("error_msg", "Complaint Details for the above-mentioned complaint ID not found.");
                request.getRequestDispatcher("source/search_complaint.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
