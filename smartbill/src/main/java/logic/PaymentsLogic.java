package logic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import model.PaymentModel;
import utility.Utility;

/**
 * Contains business logic related to payment processing and retrieval.
 */
public class PaymentsLogic {

    /**
     * Records a payment transaction and updates the bill status accordingly.
     * 
     * @param pm the payment model containing payment details
     * @param conid the consumer ID associated with the payment
     * @return the number of rows affected by the insert operation
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     * @throws ParseException if there is an error parsing the transaction date
     */
    public static int makePayment(PaymentModel pm, long conid) throws ClassNotFoundException, SQLException, ParseException {
        // Insert payment details
        PreparedStatement p1 = Utility.getPreparedStatement("insert into payment values(?,?,?,?,?,?,?)");
        p1.setInt(1, pm.getTransactionNumber());
        p1.setInt(2, pm.getBillNumber());
        p1.setDouble(3, pm.getPaidAmount());
        p1.setString(4, pm.getTransactionMode());
        p1.setString(5, pm.getTransactionDate());  
        p1.setLong(6, pm.getConsumerId());
        p1.setString(7, pm.getMeterNumber());
        int res = p1.executeUpdate();

        // Update bill details
        PreparedStatement p2 = Utility.getPreparedStatement("select * from bill where bill_number = ?");
        p2.setInt(1, pm.getBillNumber());
        ResultSet rs = p2.executeQuery();
        
        double bamt = 0;
        double edamt = 0;
        String dueDate = "";
        double pen = 0;
        String estatus = "";
        while (rs.next()) {
            bamt = rs.getDouble("bill_amount");
            edamt = rs.getDouble("due_amount");
            dueDate = rs.getString("due_date"); 
            pen = rs.getDouble("penalty");
            estatus = rs.getString("status");
        }

        String nstatus = "";
        double t1 = edamt - pm.getPaidAmount();
        if (t1 == 0 && pen == 0) {
            t1 = 0;
        } else if (t1 < 0 && pen > 0) {
            pen = pen + t1;
            t1 = 0;
        } else if (t1 < 0 && pen == 0) {
            t1 = 0;
        }

        if (t1 > 0) {
            if (pen > 0) {
                nstatus = "Overdue";
            } else {
                nstatus = "Partially Paid";
            }
        } else if (t1 == 0) {
            if (pen > 0) {
                nstatus = "Overdue";
            } else {
                nstatus = "Paid";
            }
        }
        
        PreparedStatement p3 = Utility.getPreparedStatement("update bill set status = ? , due_amount = ?, penalty = ? where bill_number = ?");
        p3.setString(1, nstatus);
        p3.setInt(4, pm.getBillNumber());
        p3.setDouble(2, t1);
        p3.setDouble(3, pen);
        p3.executeUpdate();
        
        return res;
    }

    /**
     * Retrieves the due amount for a specific bill.
     * 
     * @param billid the bill ID
     * @return the due amount for the specified bill
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static double fetchDueAmount(int billid) throws ClassNotFoundException, SQLException {
        PreparedStatement p1 = Utility.getPreparedStatement("select * from bill where bill_number = ?");
        p1.setInt(1, billid);
        ResultSet r1 = p1.executeQuery();
        double due_amt = 0;
        while (r1.next()) {
            due_amt = r1.getDouble("due_amount");
        }
        return due_amt;
    }

    /**
     * Retrieves all payment transactions for a specific consumer.
     * 
     * @param conid the consumer ID
     * @return a list of maps where each map represents a payment transaction
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static List<HashMap<String, String>> fetchAllPayments(long conid) throws ClassNotFoundException, SQLException {
        List<HashMap<String, String>> payments = new ArrayList<>();
        PreparedStatement p1 = Utility.getPreparedStatement("select * from payment where consumer_id = ?");
        p1.setLong(1, conid);
        ResultSet rs = p1.executeQuery();
        while (rs.next()) {
            HashMap<String, String> paymentDetails = new HashMap<>();
            paymentDetails.put("tran_no", String.valueOf(rs.getInt("transaction_number")));
            paymentDetails.put("bill_no", String.valueOf(rs.getString("bill_number")));
            paymentDetails.put("paid_amt", String.valueOf(rs.getDouble("paid_amount")));
            paymentDetails.put("tran_mode", rs.getString("transaction_mode"));
            paymentDetails.put("tran_date", rs.getString("transaction_date"));
            payments.add(paymentDetails);
        }
        return payments;
    }

    /**
     * Checks if a specific transaction exists in the payment table.
     * 
     * @param tran_id the transaction ID to be checked
     * @return true if the transaction exists, false otherwise
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static boolean isTransactionFound(int tran_id) throws ClassNotFoundException, SQLException {
        Statement st =  Utility.getStatement();
        ResultSet r1 = st.executeQuery("select * from payment");
        while (r1.next()) {
            if (tran_id == r1.getInt("transaction_number")) {
                return true;
            }
        }
        return false;
    }

    /**
     * Searches for a specific transaction based on its ID.
     * 
     * @param tran_id the transaction ID to be searched
     * @return a map containing details of the transaction
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static HashMap<String, String> searchTransaction(int tran_id) throws ClassNotFoundException, SQLException {
        HashMap<String, String> transactionDetails = new HashMap<>();
        PreparedStatement p1 = Utility.getPreparedStatement("select * from payment where transaction_number = ?");
        p1.setLong(1, tran_id);
        ResultSet rs = p1.executeQuery();
        while (rs.next()) {
            transactionDetails.put("tran_no", String.valueOf(rs.getInt("transaction_number")));
            transactionDetails.put("bill_no", String.valueOf(rs.getString("bill_number")));
            transactionDetails.put("paid_amt", String.valueOf(rs.getDouble("paid_amount")));
            transactionDetails.put("tran_mode", rs.getString("transaction_mode"));
            transactionDetails.put("tran_date", rs.getString("transaction_date"));
        }
        return transactionDetails;
    }
}
