package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.BillsLogic;

/**
 * Servlet implementation class SearchBillServlet
 * Handles search requests for bill details by bill ID. Fetches the bill details and forwards the user to the appropriate view.
 */
@WebServlet("/SearchBills")
public class SearchBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public SearchBillServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to search for bill details by bill ID.
     * Validates the existence of the bill and retrieves its details if available.
     * Forwards to the appropriate view or returns an error message if the bill is not found.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve bill ID from request parameter
        int bill_id = Integer.parseInt(request.getParameter("search_billid"));
        
        try {
            // Check if the bill exists
            boolean isbill = BillsLogic.isBillExist(bill_id);
            if (isbill) {
                // Fetch bill details if the bill exists
                HashMap<String, String> sbill = BillsLogic.fetchBillDetailsById(bill_id);
                HttpSession session = request.getSession();
                session.setAttribute("search_bill_id", sbill);

                // Redirect to the bill details page
                response.sendRedirect("source/bill_details_id.jsp");
            } else {
                // Set error attributes and forward to the search bill page if the bill is not found
                request.setAttribute("er_bill_id", bill_id);
                request.setAttribute("error_msg", "Bill Details for the above-mentioned bill number not found.");
                request.getRequestDispatcher("source/search_bill.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException | ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
