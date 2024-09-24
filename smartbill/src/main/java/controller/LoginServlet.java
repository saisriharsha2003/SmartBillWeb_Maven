package controller;

import model.LoginModel;
import model.RegisterModel;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.AdminLogic;
import logic.LoginLogic;

/**
 * Servlet implementation class LoginServlet
 * Handles user login requests and performs authentication for both admin and consumer users.
 * Redirects to appropriate pages based on authentication status and user type.
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public LoginServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to handle login operations.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve login details from request parameters
        String uname = request.getParameter("lname");
        String pwd = request.getParameter("lpwd");
        String ut = request.getParameter("userType");
        
        if (ut.equalsIgnoreCase("Admin")) {
            // Handle admin login
            if (uname.equalsIgnoreCase("admin")) {
                try {
                    LoginModel lg = new LoginModel(uname, pwd);
                    boolean status = LoginLogic.authenticateAdmin(lg);
                    if (status) {
                        HttpSession session = request.getSession();
                        session.setAttribute("consumer_lgname", "Admin");
                        int count = AdminLogic.fetchCountConsumers();
                        session.setAttribute("cons_count", count);
                        HashMap<String, String> mp = new HashMap<>();
                        mp.put("username", uname);
                        mp.put("password", pwd);
                        session.setAttribute("admin_details", mp);
                        response.sendRedirect("source/admin_home.jsp");
                    } else {
                        // Invalid admin credentials
                        request.setAttribute("en_username", uname);
                        request.setAttribute("user_type", ut);
                        request.setAttribute("en_password", pwd);
                        request.setAttribute("error_msg", "Invalid Admin credentials.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
            } else {
                // Invalid admin username
                request.setAttribute("en_username", uname);
                request.setAttribute("user_type", ut);
                request.setAttribute("en_password", pwd);
                request.setAttribute("error_msg", "Invalid Admin username.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            // Handle consumer login
            try {
                boolean isExist = LoginLogic.isUserExist(uname);
                if (isExist) {
                    LoginModel lg1 = new LoginModel(uname, pwd);
                    boolean actStatus = LoginLogic.fetchAccountStatus(uname);
                    
                    if (actStatus) {
                        boolean status1 = LoginLogic.authenticateConsumer(lg1);
                        if (status1) {
                            String cname = LoginLogic.fetchConsumerName(uname);
                            long cid = LoginLogic.fetchConsumerId(uname);
                            String meterNo = LoginLogic.fetchMeterNumber(uname);
                            HttpSession session = request.getSession();
                            session.setAttribute("consumer_lgid", cid);
                            session.setAttribute("meter_number", meterNo);
                            session.setAttribute("consumer_lgname", cname);
                            
                            HashMap<String, String> mp = LoginLogic.fetchUserDetails(uname);
                            session.setAttribute("user-details", mp);
                            
                            response.sendRedirect("source/home.jsp");
                        } else {
                            // Invalid consumer credentials
                            request.setAttribute("en_username", uname);
                            request.setAttribute("user_type", ut);
                            request.setAttribute("en_password", pwd);
                            request.setAttribute("error_msg", "Invalid login credentials. Kindly check once.");
                            request.getRequestDispatcher("/login.jsp").forward(request, response);
                        }
                    } else {
                        // Account not active
                        HttpSession session = request.getSession();
                        session.setAttribute("reactivate_uname", uname);
                        response.sendRedirect("reactivate.jsp");
                    }
                } else {
                    // Consumer does not exist
                    request.setAttribute("en_username", uname);
                    request.setAttribute("user_type", ut);
                    request.setAttribute("en_password", pwd);
                    request.setAttribute("error_msg", "Consumer doesn't exist. Kindly check the credentials once.");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
                RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
}
