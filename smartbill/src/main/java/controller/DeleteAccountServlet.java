package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.LoginLogic;

/**
 * Servlet implementation class DeleteAccountServlet
 * Handles the soft deletion of a consumer account.
 * This servlet processes the account deletion request and invalidates the session upon success.
 */
@WebServlet("/DeleteAccount")
public class DeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public DeleteAccountServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to handle the soft deletion of a consumer account.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Get the consumer ID from the session
        long conid = (long) session.getAttribute("consumer_lgid");
        
        try {
            // Attempt to soft delete the account using the consumer ID
            int res = LoginLogic.softDeleteAccount(conid);
            
            // If the deletion is successful, invalidate the session and redirect to the success page
            if (res == 1) {
                session.invalidate();
                response.sendRedirect("source/delete_success.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
