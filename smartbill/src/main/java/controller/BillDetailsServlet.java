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
import logic.BillsLogic;
import logic.PaymentsLogic;

/**
 * Servlet implementation class BillDetailsServlet
 * Handles fetching and displaying bill details for a specific bill ID.
 * This servlet retrieves the payment details and due amount for the requested bill.
 */
@WebServlet("/BillDetails")
public class BillDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public BillDetailsServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to fetch and display bill details.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Get the bill ID from the request
        int billid = Integer.parseInt(request.getParameter("up_bill"));
        HashMap<String, String> mp;
        
        try {
            // Fetch the due amount for the bill
            double due_amt = PaymentsLogic.fetchDueAmount(billid);

            // Fetch bill details and store them in a map
            mp = BillsLogic.fetchPaymentBillDetails(billid);
            
            // Set bill details and due amount in the session
            session.setAttribute("payment_billdet", mp);
            session.setAttribute("payment_due_amount", due_amt);
            
            // Redirect to the bill details page
            response.sendRedirect("source/bill_details.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
