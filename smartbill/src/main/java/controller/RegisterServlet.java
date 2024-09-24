package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logic.RegisterLogic;
import model.RegisterModel;

/**
 * Servlet implementation class RegisterServlet
 * Handles user registration by collecting registration details, validating input, and creating a new consumer record.
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     * Calls the parent class constructor.
     */
    public RegisterServlet() {
        super();
    }

    /**
     * Processes HTTP POST requests to register a new consumer.
     * Collects registration details, validates the meter number and checks for existing records.
     * On successful registration, stores consumer details in the session and redirects to the success page.
     * If validation fails, forwards back to the registration page with error messages.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param response HttpServletResponse object that contains the response the servlet returns to the client.
     * @throws ServletException if the request could not be handled
     * @throws IOException if an I/O error occurs during request handling
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Collect request parameters
        String title = request.getParameter("title");
        String meterNo = request.getParameter("mnumber");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        long mobile = Long.parseLong(request.getParameter("mobile"));
        String gender = request.getParameter("gender");
        String user = request.getParameter("uname");
        String pwd = request.getParameter("password");
        
        // Generate a random consumer number
        Random random = new Random();
        long min = 1000000000000L;
        long max = 9999999999999L;
        long cons_no = min + (long) (random.nextDouble() * (max - min + 1));
        
        // Create RegisterModel object
        RegisterModel reg = new RegisterModel(cons_no, meterNo, title, name, email, mobile, gender, user, pwd);

        try {
            // Validate meter number and check if consumer already exists
            boolean isMeterValid = RegisterLogic.isMeterNumberValid(reg);
            if (isMeterValid) {
                boolean isExist = RegisterLogic.isAlreadyExist(reg);
                if (!isExist) {
                    int result = RegisterLogic.registerConsumer(reg);
                    if (result == 1) {
                        HttpSession session = request.getSession();
                        session.setAttribute("consumer_number", reg.getConsumerNumber());
                        session.setAttribute("name", reg.getName());
                        session.setAttribute("username", reg.getUserName());
                        session.setAttribute("reg_meter_number", meterNo);
                        response.sendRedirect("success.jsp");
                        return;
                    }
                } else {
                    setErrorAttributes(request, meterNo, name, title, email, mobile, gender, user, pwd);
                    request.setAttribute("error_msg", "Consumer with the mentioned username or email already exists.");
                }
            } else {
                setErrorAttributes(request, meterNo, name, title, email, mobile, gender, user, pwd);
                request.setAttribute("error_msg", "Invalid Meter Number. Kindly check once.");
            }

            request.getRequestDispatcher("register.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("source/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    /**
     * Sets error attributes in the request for redisplaying the registration form with previous input values.
     * 
     * @param request  HttpServletRequest object that contains the request the client made to the servlet.
     * @param meterNo  Meter number input value
     * @param name     Name input value
     * @param title    Title input value
     * @param email    Email input value
     * @param mobile   Mobile number input value
     * @param gender   Gender input value
     * @param user     Username input value
     * @param pwd      Password input value
     */
    private void setErrorAttributes(HttpServletRequest request, String meterNo, String name, String title,
            String email, long mobile, String gender, String user, String pwd) {
        request.setAttribute("er_mnumber", meterNo);
        request.setAttribute("er_cname", name);
        request.setAttribute("er_title", title);
        request.setAttribute("er_email", email);
        request.setAttribute("er_mob", mobile);
        request.setAttribute("er_gen", gender);
        request.setAttribute("er_user", user);
        request.setAttribute("er_pwd", pwd);
    }
}
