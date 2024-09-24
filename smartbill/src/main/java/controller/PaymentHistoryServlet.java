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

import logic.PaymentsLogic;

/**
 * Servlet implementation class PaymentHistoryServlet
 * Handles operations related to displaying payment history for a consumer.
 */
@WebServlet("/PaymentHistory")
public class PaymentHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public PaymentHistoryServlet() {
        super();
    }

    /**
     * Processes HTTP GET requests to display the payment history for a consumer.
     * Retrieves the consumer ID from the session, fetches all payments for the consumer,
     * and sets the payment details as a session attribute before redirecting to the payment history page.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        long conid = Long.parseLong(session.getAttribute("consumer_lgid").toString());
        try {
            // Fetch all payment details for the consumer
            List<HashMap<String, String>> mp1 = PaymentsLogic.fetchAllPayments(conid);
            // Set the payment details as a session attribute
            session.setAttribute("payment_details_con", mp1);
            // Redirect to the payment history JSP page
            response.sendRedirect("source/payment_history.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
