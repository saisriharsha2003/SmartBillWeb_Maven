package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.PaymentsLogic;
import model.PaymentModel;

/**
 * Servlet implementation class PaymentSuccessServlet
 * Handles the processing of successful payments and updates payment details.
 */
@WebServlet("/PaymentSuccess")
public class PaymentSuccessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public PaymentSuccessServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to handle payment success.
     * Retrieves payment details from the session, generates a payment model,
     * updates the payment in the database, and redirects to a success page.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        long conid = Long.parseLong(session.getAttribute("consumer_lgid").toString());
        String mno = (String)session.getAttribute("meter_number");

        // Retrieve payment details from the session
        HashMap<String, String> mp = (HashMap<String, String>) session.getAttribute("payment_billdet");
        int bill_id = Integer.parseInt(mp.get("bill_id"));
        String pay_mode = (String) session.getAttribute("billdet_paymode");
        double paid_amt = Double.parseDouble((String) session.getAttribute("billdet_pamount"));

        // Get today's date in dd-MM-yyyy format
        Date today = new Date();
        SimpleDateFormat displayFormat = new SimpleDateFormat("dd-MM-yyyy");
        String formattedDisplayDate = displayFormat.format(today);

        // Generate a random payment ID
        Random random = new Random();
        int min = 100000000;
        int max = 999999999;
        int randomNumber = min + random.nextInt(max - min + 1);

        // Create a PaymentModel object
        PaymentModel pm = new PaymentModel(randomNumber, bill_id, paid_amt, pay_mode, formattedDisplayDate, conid, mno);

        try {
            // Make the payment and update the database
            int res = PaymentsLogic.makePayment(pm, conid);
            
            if (res == 1) {
                // Set payment details in the session
                HashMap<String, String> paymentDetails = new HashMap<>();
                paymentDetails.put("payment_id", String.valueOf(randomNumber));
                paymentDetails.put("payment_billid", String.valueOf(bill_id));
                paymentDetails.put("payment_paidamt", String.valueOf(paid_amt));
                paymentDetails.put("payment_mode", pay_mode);
                paymentDetails.put("payment_date", formattedDisplayDate);
                session.setAttribute("payment_details", paymentDetails);

                // Redirect to the payment success page
                response.sendRedirect("source/payment_success.jsp");
            }
        } catch (ClassNotFoundException | SQLException | ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
