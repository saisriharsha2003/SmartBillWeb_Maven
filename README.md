# SmartBill - Power Bill Management Application  

SmartBill is a powerful and efficient power bill management application. It streamlines the billing process and enhances communication between consumers and administrators.  

## Features  

### **Admin Role:**  
- Add bills to a specific meter number.  
- View and manage all registered customers.  
- Resolve complaints raised by consumers.  

### **Consumer Role:**  
- Pay electricity bills securely.  
- Register multiple users under the same meter number.  
- Raise complaints and track their resolution status.  
- View billing history and complaint records.  

SmartBill ensures transparency and ease of access, simplifying power bill management for both administrators and consumers.  

## **Project Structure**  

```bash
└── saisriharsha2003-smartbillweb_maven/  # Root directory for the Maven project
    ├── smartbill/  # Main module for the SmartBill web application
    │   ├── pom.xml  # Maven Project Object Model file defining dependencies and build configuration
    │   ├── lib/  # Directory for external libraries/jar files (if any)
    │   ├── src/  # Source code directory
    │   │   └── main/
    │   │       ├── java/  # Java source files
    │   │       │   ├── controller/  # Servlet controllers for handling HTTP requests
    │   │       │   │   ├── AdminAddBillServlet.java  # Servlet for admin to add bills
    │   │       │   │   ├── AdminEditProfileServlet.java  # Servlet for admin to edit their profile
    │   │       │   │   ├── AdminUpdateComplaintServlet.java  # Servlet for admin to update complaints
    │   │       │   │   ├── AdminViewBillsServlet.java  # Servlet for admin to view bills
    │   │       │   │   ├── AdminViewComplaintsServlet.java  # Servlet for admin to view complaints
    │   │       │   │   ├── AdminViewConsumersServlet.java  # Servlet for admin to view consumers
    │   │       │   │   ├── BillDetailsServlet.java  # Servlet to display bill details
    │   │       │   │   ├── ComplaintStatusServlet.java  # Servlet to check complaint status
    │   │       │   │   ├── DeleteAccountServlet.java  # Servlet to delete a user account
    │   │       │   │   ├── EditProfileServlet.java  # Servlet for users to edit their profile
    │   │       │   │   ├── LoginServlet.java  # Servlet for user login
    │   │       │   │   ├── LogoutServlet.java  # Servlet for user logout
    │   │       │   │   ├── PayBillServlet.java  # Servlet for paying bills
    │   │       │   │   ├── PaymentHistoryServlet.java  # Servlet to view payment history
    │   │       │   │   ├── PaymentScreenServlet.java  # Servlet for payment screen
    │   │       │   │   ├── PaymentSuccessServlet.java  # Servlet for successful payment confirmation
    │   │       │   │   ├── ReactivateAccountServlet.java  # Servlet to reactivate a deleted account
    │   │       │   │   ├── ReceiptServlet.java  # Servlet to generate payment receipts
    │   │       │   │   ├── RegisterComplaintServlet.java  # Servlet to register complaints
    │   │       │   │   ├── RegisterServlet.java  # Servlet for user registration
    │   │       │   │   ├── SearchBillServlet.java  # Servlet to search for bills
    │   │       │   │   ├── SearchComplaintServlet.java  # Servlet to search for complaints
    │   │       │   │   ├── SearchPaymentServlet.java  # Servlet to search for payments
    │   │       │   │   └── ViewBillsServlet.java  # Servlet to view bills
    │   │       │   ├── logic/  # Business logic layer for processing data
    │   │       │   │   ├── AdminLogic.java  # Logic for admin-related operations
    │   │       │   │   ├── BillsLogic.java  # Logic for bill-related operations
    │   │       │   │   ├── ComplaintsLogic.java  # Logic for complaint-related operations
    │   │       │   │   ├── LoginLogic.java  # Logic for login operations
    │   │       │   │   ├── PaymentsLogic.java  # Logic for payment-related operations
    │   │       │   │   └── RegisterLogic.java  # Logic for user registration
    │   │       │   ├── model/  # Data models representing entities in the application
    │   │       │   │   ├── BillModel.java  # Model for bill data
    │   │       │   │   ├── ComplaintModel.java  # Model for complaint data
    │   │       │   │   ├── LoginModel.java  # Model for login data
    │   │       │   │   ├── PaymentModel.java  # Model for payment data
    │   │       │   │   └── RegisterModel.java  # Model for registration data
    │   │       │   └── utility/  # Utility classes for common functionality
    │   │       │       └── Utility.java  # General utility methods
    │   │       └── webapp/  # Web application resources (JSP, CSS, JS, etc.)
    │   │           ├── about.jsp  # About page
    │   │           ├── contact.jsp  # Contact page
    │   │           ├── index.jsp  # Home page
    │   │           ├── login.jsp  # Login page
    │   │           ├── reactivate.jsp  # Reactivate account page
    │   │           ├── reactivate_login.jsp  # Reactivate account login page
    │   │           ├── reactivate_success.jsp  # Reactivate account success page
    │   │           ├── register.jsp  # User registration page
    │   │           ├── style.css  # CSS file for styling
    │   │           ├── success.jsp  # Generic success page
    │   │           ├── META-INF/  # Metadata for the web application
    │   │           │   └── MANIFEST.MF  # Manifest file for deployment
    │   │           ├── WEB-INF/  # Configuration files for the web application
    │   │           │   ├── web.xml  # Deployment descriptor for servlets and mappings
    │   │           │   └── lib/  # Directory for application-specific libraries
    │   │           ├── assets/  # Static assets like images
    │   │           ├── scripts/  # JavaScript files
    │   │           │   └── script.js  # Main JavaScript file for client-side functionality
    │   │           └── source/  # Additional JSP pages and resources
    │   │               ├── error.jsp  # Error page for displaying errors
    │   │               ├── Admin/  # Admin-specific pages
    │   │               │   ├── admin_home.jsp  # Admin home page
    │   │               │   ├── Bills/  # Admin bill management pages
    │   │               │   │   ├── admin_addbill.jsp  # Page to add bills
    │   │               │   │   ├── admin_addbill_success.jsp  # Success page after adding a bill
    │   │               │   │   └── admin_view_bills.jsp  # Page to view bills
    │   │               │   ├── Complaints/  # Admin complaint management pages
    │   │               │   │   ├── admin_complaint_update.jsp  # Page to update complaints
    │   │               │   │   └── admin_view_complaints.jsp  # Page to view complaints
    │   │               │   ├── Consumers/  # Admin consumer management pages
    │   │               │   │   └── admin_view_consumers.jsp  # Page to view consumers
    │   │               │   └── Profile/  # Admin profile management pages
    │   │               │       └── admin_edit_profile.jsp  # Page to edit admin profile
    │   │               └── Consumer/  # Consumer-specific pages
    │   │                   ├── home.jsp  # Consumer home page
    │   │                   ├── Bills/  # Consumer bill management pages
    │   │                   │   ├── bill_details.jsp  # Page to view bill details
    │   │                   │   ├── bill_details_id.jsp  # Page to view bill details by ID
    │   │                   │   ├── pay_bills.jsp  # Page to pay bills
    │   │                   │   ├── search_bill.jsp  # Page to search for bills
    │   │                   │   ├── view_bills.jsp  # Page to view bills
    │   │                   │   └── view_receipt.jsp  # Page to view payment receipts
    │   │                   ├── Complaints/  # Consumer complaint management pages
    │   │                   │   ├── complaint_details_id.jsp  # Page to view complaint details by ID
    │   │                   │   ├── complaint_success.jsp  # Success page after registering a complaint
    │   │                   │   ├── register_complaint.jsp  # Page to register a complaint
    │   │                   │   ├── search_complaint.jsp  # Page to search for complaints
    │   │                   │   └── view_all_complaints.jsp  # Page to view all complaints
    │   │                   ├── Payments/  # Consumer payment management pages
    │   │                   │   ├── payment_details_id.jsp  # Page to view payment details by ID
    │   │                   │   ├── payment_history.jsp  # Page to view payment history
    │   │                   │   ├── payment_screen.jsp  # Page for payment screen
    │   │                   │   ├── payment_success.jsp  # Success page after payment
    │   │                   │   └── search_payment.jsp  # Page to search for payments
    │   │                   └── Profile/  # Consumer profile management pages
    │   │                       ├── delete_profile.jsp  # Page to delete a profile
    │   │                       ├── delete_success.jsp  # Success page after deleting a profile
    │   │                       ├── edit_profile.jsp  # Page to edit a profile
    │   │                       └── update_success.jsp  # Success page after updating a profile
    │   └── .idea/  # IntelliJ IDEA project-specific files
    └── src/  # Additional source directory (likely unused or for future use)
        └── main/
            └── webapp/
                └── META-INF/
                    └── MANIFEST.MF  # Manifest file for deployment
```


## **Tech Stack**  
- **Backend:** Java, JSP, Servlets, JDBC  
- **Frontend:** HTML, CSS, JavaScript  
- **Database:** MySQL  
- **Build Tool:** Maven  
- **Version Control:** Git & GitHub  

## **Installation and Setup**  

### **Prerequisites**  
- Java (JDK 8 or higher)  
- Apache Maven  
- MySQL Database  

### **Steps to Run the Project**  
1. Clone the repository:
   
   ```bash
   git clone https://github.com/YOUR_GITHUB_USERNAME/SmartBill.git
   cd smartbill/
   ```
  
2. Configure the database in application.properties.
   
3. Build the project using Maven:
   ```bash
   mvn clean compile package
   ```
   
4. Deploy the application on a Tomcat server.
   
   ```bash
   mvn tomcat7:run
   ```
   
5. Access the application in your browser.
   
   ```bash
   http://localhost:8080/smartbill/
   ```
   
