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

import logic.LoginLogic;
import logic.RegisterLogic;

/**
 * Servlet implementation class EditProfileServlet
 * Handles updating the profile information for a consumer.
 * This servlet processes the profile update request and updates both registration and login details.
 */
@WebServlet("/EditProfile")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public EditProfileServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to update the consumer's profile information.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve profile information from request parameters
        String ucname = request.getParameter("edit-name");
        String email = request.getParameter("edit-email");
        Long mob = Long.parseLong(request.getParameter("edit-mobile"));
        String uuname = request.getParameter("edit-uname");
        String upwd = request.getParameter("edit-password");
        long cid = (long) session.getAttribute("consumer_lgid");
        String mno = (String) session.getAttribute("meter_number");

        try {
            // Update registration details and login details
            int res1 = RegisterLogic.updateRegisterDetails(cid, ucname, email, mob, uuname, upwd);
            int res2 = LoginLogic.updateLoginDetails(cid, uuname, upwd);
            
            if (res1 == 1 && res2 == 1) {
                // Create a map with updated user details
                HashMap<String, String> mp = new HashMap<>();
                mp.put("up-cname", ucname);
                mp.put("up-email", email);
                mp.put("up-mob", mob.toString());
                mp.put("up-uname", uuname);
                
                // Set updated user details in the session
                session.setAttribute("updated_user_details", mp);
                session.setAttribute("consumer_lgname", ucname);
                
                // Create another map with detailed user information
                HashMap<String, String> mp1 = new HashMap<>();
                mp1.put("name", ucname);
                mp1.put("email", email);
                mp1.put("mobile", mob.toString());
                mp1.put("username", uuname);
                mp1.put("password", upwd);
                mp1.put("consumer_id", String.valueOf(cid));
                mp1.put("meter_number", mno);
                
                // Set detailed user information in the session
                session.setAttribute("user-details", mp1);
                
                // Redirect to the update success page
                response.sendRedirect("source/update_success.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
