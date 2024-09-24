package controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReceiptServlet
 * Generates a random receipt number and forwards to the receipt view page.
 */
@WebServlet("/ReceiptController")
public class ReceiptServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public ReceiptServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to generate a receipt number.
     * Generates a random receipt number and stores it in the session.
     * Redirects the user to the receipt view page.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Generate a random receipt number between 10 billion and 100 billion
        Random random = new Random();
        long min = 10000000000L;
        long max = 99999999999L;
        long randomNumber = min + (long) (random.nextDouble() * (max - min + 1));
        
        // Store the receipt number in the session
        HttpSession session = request.getSession();
        session.setAttribute("receipt_number", randomNumber);

        // Redirect to the receipt view page
        response.sendRedirect("source/view_receipt.jsp");
    }
}
