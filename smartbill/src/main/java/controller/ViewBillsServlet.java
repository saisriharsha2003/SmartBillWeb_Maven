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
import logic.ComplaintsLogic;

/**
 * Servlet implementation class ViewBillsServlet
 * Handles requests to view all bills for a specific meter number. Updates penalties and fetches bill details.
 */
@WebServlet("/ViewBills")
public class ViewBillsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public ViewBillsServlet() {
        super();
    }

    /**
     * Processes HTTP GET requests to fetch and display all bills for the meter number stored in the session.
     * Updates penalties and sets the bill details in the session.
     * Redirects to the view bills page to display the bills.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve meter number from session
        String meter_no = String.valueOf(session.getAttribute("meter_number"));
        try {
            // Update penalties and fetch all bills for the meter number
            int res = AdminLogic.updatePenalty();
            List<HashMap<String, String>> l1 = BillsLogic.fetchAllBills(meter_no);
            session.setAttribute("view_all_bills", l1);

            // Redirect to the view bills page
            response.sendRedirect("source/view_bills.jsp");
        } catch (ClassNotFoundException | SQLException | ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
