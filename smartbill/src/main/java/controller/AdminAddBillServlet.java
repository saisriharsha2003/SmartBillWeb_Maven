package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Random;
import model.BillModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.AdminLogic;

/**
 * Servlet implementation class AdminAddBillServlet
 * Handles requests for adding a new bill in the system.
 * This servlet receives input data, processes it, and stores the bill details in the database.
 */
@WebServlet("/AdminAddBill")
public class AdminAddBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public AdminAddBillServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests for adding a new bill.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extracting form data from the request
        String mno = request.getParameter("adbillcn");
        double amt = Double.parseDouble(request.getParameter("adamt"));
        String date = request.getParameter("addd");
        String status = "Unpaid";
        double pamt = amt;
        double penalty = 0;

        // Generate random bill number
        Random random = new Random();
        int min = 1000000;
        int max = 9999999;
        int billno = min + (int) (random.nextDouble() * (max - min + 1));

        // Create a BillModel object with the gathered data
        BillModel bill = new model.BillModel(billno, amt, pamt, date, penalty, status, mno);

        try {
            // Call the logic layer to add the bill to the database
            int res = AdminLogic.adminAddBill(bill);
            if (res == 1) {
                // Store the bill details in the session and redirect to success page
                HttpSession session = request.getSession();
                HashMap<String, String> h1 = new HashMap<>();
                
                h1.put("addbill_bno", String.valueOf(bill.getBillNumber())); // Store bill number
                h1.put("addbill_mno", bill.getMeterNumber()); // Store meter number
                h1.put("adbill_amt", String.valueOf(bill.getBillAmount())); // Store bill amount
                h1.put("adbill_date", bill.getDueDate()); // Store due date
                
                session.setAttribute("admin_add_bills", h1);
                
                // Redirect to the success page
                response.sendRedirect("source/admin_addbill_success.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
