package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.AdminLogic;
import logic.BillsLogic;

/**
 * Servlet implementation class PayBillServlet
 * Handles operations related to displaying bills for payment.
 */
@WebServlet("/PayBills")
public class PayBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public PayBillServlet() {
        super();
    }

    /**
     * Processes HTTP GET requests to display bills for payment.
     * Retrieves the meter number from the session, updates penalties, fetches all bills for the given meter number,
     * and sets the retrieved bills as a session attribute before redirecting to the pay bills page.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String meter_no = String.valueOf(session.getAttribute("meter_number"));
        try {
            // Update penalties for bills
            int res = AdminLogic.updatePenalty();
            // Fetch all bills associated with the meter number
            List<HashMap<String, String>> l1 = BillsLogic.fetchAllBillsPay(meter_no);
            // Set the bills as a session attribute
            session.setAttribute("view_all_bills", l1);
            // Redirect to the pay bills JSP page
            response.sendRedirect("source/pay_bills.jsp");
        } catch (ClassNotFoundException | SQLException | ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
