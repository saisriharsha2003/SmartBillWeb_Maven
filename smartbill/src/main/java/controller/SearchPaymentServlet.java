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

import logic.PaymentsLogic;

/**
 * Servlet implementation class SearchPaymentServlet
 * Handles search requests for payment details by transaction ID. Fetches the payment details and forwards the user to the appropriate view.
 */
@WebServlet("/SearchPayment")
public class SearchPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public SearchPaymentServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to search for payment details by transaction ID.
     * Validates the existence of the transaction and retrieves its details if available.
     * Forwards to the appropriate view or returns an error message if the transaction is not found.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve transaction ID from request parameter
        int tran_id = Integer.parseInt(request.getParameter("search_tranid"));
        HttpSession session = request.getSession();
        
        try {
            // Check if the transaction exists
            boolean isexist = PaymentsLogic.isTransactionFound(tran_id);
            System.out.println(isexist + "  " + tran_id);
            
            if (isexist) {
                // Fetch payment details if the transaction exists
                HashMap<String, String> m1 = PaymentsLogic.searchTransaction(tran_id);
                session.setAttribute("payment_details_id", m1);

                // Redirect to the payment details page
                response.sendRedirect("source/payment_details_id.jsp");
            } else {
                // Set error attributes and forward to the search payment page if the transaction is not found
                request.setAttribute("er_tranid", tran_id);
                request.setAttribute("error_msg", "Transaction Details for the above-mentioned transaction number not found.");
                request.getRequestDispatcher("source/search_payment.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
