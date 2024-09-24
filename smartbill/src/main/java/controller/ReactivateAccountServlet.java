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
 * Servlet implementation class ReactivateAccountServlet
 * Handles reactivation of consumer accounts.
 */
@WebServlet("/ReactivateAccount")
public class ReactivateAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public ReactivateAccountServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to reactivate a consumer account.
     * Authenticates the user and, if successful, reactivates the account.
     * Redirects to the success page or forwards to the login page with an error message.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String uname = request.getParameter("lname");
        String pwd = request.getParameter("lpwd");
        String ut = request.getParameter("uerType");

        try {
            // Authenticate user credentials
            boolean res1 = LoginLogic.reauthenticateConsumer(uname, pwd);
            if (res1) {
                // Reactivate the account if authentication is successful
                int res = LoginLogic.reactivateAccount(uname);
                if (res == 1) {
                    response.sendRedirect("reactivate_success.jsp");
                }
            } else {
                // Forward to the login page with an error message if authentication fails
                request.setAttribute("en_username", uname);
                request.setAttribute("user_type", ut);
                request.setAttribute("en_password", pwd);
                request.setAttribute("error_msg", "Invalid login credentials. Kindly Check Once.");
                request.getRequestDispatcher("reactivate_login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
