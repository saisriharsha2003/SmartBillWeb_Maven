package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PaymentScreenServlet
 * Handles the processing of payment details submitted by the user.
 */
@WebServlet("/PaymentScreen")
public class PaymentScreenServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public PaymentScreenServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to handle payment details.
     * Retrieves the payment amount and payment mode from the request,
     * sets them as session attributes, and redirects to the payment screen page.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve payment details from the request
        String pay_amount = (String)request.getParameter("billdet_pamt");
        String pay_mode = (String)request.getParameter("pay_mode");
        // Get the current session
        HttpSession session = request.getSession();
        // Set payment details as session attributes
        session.setAttribute("billdet_pamount", pay_amount);
        session.setAttribute("billdet_paymode", pay_mode);
        // Redirect to the payment screen JSP page
        response.sendRedirect("source/payment_screen.jsp");
    }
}
