package logic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import utility.Utility;

/**
 * Contains business logic related to bill management, including fetching and updating bill details.
 */
public class BillsLogic {

    /**
     * Fetches all bills for a given meter number.
     * 
     * @param meter_no the meter number to filter bills
     * @return a list of maps containing bill details
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     * @throws ParseException if date parsing fails
     */
    public static List<HashMap<String, String>> fetchAllBills(String meter_no) throws ClassNotFoundException, SQLException, ParseException {
        AdminLogic.updatePenalty();
        List<HashMap<String, String>> lm = new ArrayList<>();

        PreparedStatement p1 = Utility.getPreparedStatement("select * from bill where meter_number = ?");
        p1.setString(1, meter_no);
        ResultSet rs = p1.executeQuery();
        while (rs.next()) {
            HashMap<String, String> mp1 = new HashMap<>();
            mp1.put("bill_id", String.valueOf(rs.getString("bill_number")));
            mp1.put("due_amt", String.valueOf(rs.getDouble("due_amount")));
            mp1.put("pay_amt", String.valueOf(rs.getDouble("bill_amount")));
            mp1.put("date", rs.getString("due_date"));
            mp1.put("penalty", String.valueOf(rs.getString("penalty")));
            mp1.put("status", rs.getString("status"));
            lm.add(mp1);
        }
        return lm;
    }

    /**
     * Fetches all unpaid bills for a given meter number.
     * 
     * @param meter_number the meter number to filter bills
     * @return a list of maps containing bill details that need to be paid
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     * @throws ParseException if date parsing fails
     */
    public static List<HashMap<String, String>> fetchAllBillsPay(String meter_number) throws ClassNotFoundException, SQLException, ParseException {
        AdminLogic.updatePenalty();
        List<HashMap<String, String>> lm = new ArrayList<>();

        PreparedStatement p1 = Utility.getPreparedStatement("select * from bill where meter_number = ? and status != ?");
        p1.setString(1, meter_number);
        p1.setString(2, "Paid");
        ResultSet rs = p1.executeQuery();
        while (rs.next()) {
            HashMap<String, String> mp1 = new HashMap<>();
            mp1.put("bill_id", String.valueOf(rs.getString("bill_number")));
            mp1.put("due_amt", String.valueOf(rs.getDouble("due_amount")));
            mp1.put("pay_amt", String.valueOf(rs.getDouble("bill_amount")));
            mp1.put("date", rs.getString("due_date"));
            mp1.put("penalty", String.valueOf(rs.getString("penalty")));
            mp1.put("status", rs.getString("status"));
            lm.add(mp1);
        }
        return lm;
    }

    /**
     * Fetches details of a specific bill for payment by its ID.
     * 
     * @param bill_id the ID of the bill to be fetched
     * @return a map containing the bill details
     * @throws SQLException if a database access error occurs
     * @throws ClassNotFoundException if the JDBC driver class is not found
     */
    public static HashMap<String, String> fetchPaymentBillDetails(int bill_id) throws SQLException, ClassNotFoundException {
        HashMap<String, String> m1 = new HashMap<>();

        PreparedStatement p1 = Utility.getPreparedStatement("select * from bill where bill_number = ?");
        p1.setInt(1, bill_id);
        ResultSet rs = p1.executeQuery();
        while (rs.next()) {
            m1.put("bill_id", String.valueOf(rs.getInt("bill_number")));
            m1.put("due_amt", String.valueOf(rs.getDouble("due_amount")));
            m1.put("bill_amt", String.valueOf(rs.getDouble("bill_amount")));
            m1.put("penalty", String.valueOf(rs.getDouble("penalty")));
            m1.put("meter_number", String.valueOf(rs.getString("meter_number")));
        }
        return m1;
    }

    /**
     * Fetches details of a specific bill by its ID.
     * 
     * @param bill_id the ID of the bill to be fetched
     * @return a map containing the bill details
     * @throws SQLException if a database access error occurs
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws ParseException if date parsing fails
     */
    public static HashMap<String, String> fetchBillDetailsById(int bill_id) throws SQLException, ClassNotFoundException, ParseException {
        AdminLogic.updatePenalty();
        HashMap<String, String> m1 = new HashMap<>();

        PreparedStatement p1 = Utility.getPreparedStatement("select * from bill where bill_number = ?");
        p1.setInt(1, bill_id);
        ResultSet rs = p1.executeQuery();
        while (rs.next()) {
            m1.put("bill_id", String.valueOf(rs.getInt("bill_number")));
            m1.put("due_amt", String.valueOf(rs.getDouble("due_amount")));
            m1.put("bill_amt", String.valueOf(rs.getDouble("bill_amount")));
            m1.put("due_date", String.valueOf(rs.getString("due_date")));
            m1.put("penalty", String.valueOf(rs.getDouble("penalty")));
            m1.put("status", String.valueOf(rs.getString("status")));
        }
        return m1;
    }

    /**
     * Checks if a bill exists by its ID.
     * 
     * @param bill_id the ID of the bill to be checked
     * @return true if the bill exists, false otherwise
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static boolean isBillExist(int bill_id) throws ClassNotFoundException, SQLException {
        Statement s = Utility.getStatement();
        ResultSet rs = s.executeQuery("select * from bill");
        while (rs.next()) {
            if (rs.getInt("bill_number") == bill_id) {
                return true;
            }
        }
        return false;
    }
}
