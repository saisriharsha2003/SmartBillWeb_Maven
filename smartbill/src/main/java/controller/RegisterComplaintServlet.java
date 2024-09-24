package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.ComplaintsLogic;
import model.ComplaintModel;

/**
 * Servlet implementation class RegisterComplaintServlet
 * Handles the registration of a new complaint and stores complaint details in the session.
 */
@WebServlet("/RegisterComplaintController")
public class RegisterComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public RegisterComplaintServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to register a new complaint.
     * Generates a random complaint number, creates a ComplaintModel object, and registers the complaint.
     * On successful registration, stores complaint details in the session and redirects to the success page.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract complaint details from request parameters
        long consno = Long.parseLong(request.getParameter("fcno"));
        String land = request.getParameter("land");
        String ser = request.getParameter("stype");
        String cat = request.getParameter("ccat");
        long mob = Long.parseLong(request.getParameter("fphno"));
        String conp = request.getParameter("cpname");
        String prb = request.getParameter("fprob");
        String addr = request.getParameter("faddr");

        // Generate a random complaint number
        Random random = new Random();
        int min = 10000000;
        int max = 99999999;
        int compno = min + (int) (random.nextDouble() * (max - min + 1));

        // Create a ComplaintModel object
        ComplaintModel comp = new ComplaintModel(compno, consno, land, ser, cat, mob, conp, prb, addr);

        try {
            // Register the complaint
            int res = ComplaintsLogic.registerComplaint(comp);
            if (res == 1) {
                HttpSession session = request.getSession();

                // Store complaint details in session
                HashMap<String, String> mp1 = new HashMap<>();
                mp1.put("comp_id", String.valueOf(comp.getComplaintId()));
                mp1.put("comp_per", comp.getContactPerson());
                mp1.put("comp_mobile", String.valueOf(comp.getMobile()));
                mp1.put("comp_problem", comp.getProblem());
                mp1.put("comp_address", comp.getAddress());
                session.setAttribute("complaint-details", mp1);

                // Redirect to success page
                response.sendRedirect("source/complaint_success.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
