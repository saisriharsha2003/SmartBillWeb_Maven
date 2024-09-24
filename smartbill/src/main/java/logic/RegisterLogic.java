package logic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.RegisterModel;
import utility.Utility;

/**
 * Contains business logic related to consumer registration and updates.
 */
public class RegisterLogic {

    /**
     * Registers a new consumer by inserting consumer and login details into the database.
     * 
     * @param reg the registration model containing consumer details
     * @return the number of rows affected by the consumer insert operation
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static int registerConsumer(RegisterModel reg) throws ClassNotFoundException, SQLException {
        // Insert consumer details
        String sql = "insert into consumer values(?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = Utility.getPreparedStatement(sql);
        pst.setLong(1, reg.getConsumerNumber());
        pst.setString(2, reg.getMeterNumber());
        pst.setString(3, reg.getTitle());
        pst.setString(4, reg.getName());
        pst.setString(5, reg.getEmail());
        pst.setLong(6, reg.getMobile());
        pst.setString(7, reg.getGender());
        pst.setString(8, reg.getUserName());
        pst.setString(9, reg.getPassword());
        int res = pst.executeUpdate();

        // Insert login details
        String sql1 = "insert into login values(?,?,?,?)";
        PreparedStatement pst1 = Utility.getPreparedStatement(sql1);
        pst1.setString(1, reg.getUserName());
        pst1.setString(2, reg.getPassword());
        pst1.setLong(3, reg.getConsumerNumber());
        pst1.setString(4, "Active");
        pst1.executeUpdate();
        
        return res;
    }

    /**
     * Updates the registration details of an existing consumer.
     * 
     * @param cid the consumer ID to be updated
     * @param name the new name of the consumer
     * @param email the new email of the consumer
     * @param mobile the new mobile number of the consumer
     * @param uname the new username of the consumer
     * @param pwd the new password of the consumer
     * @return the number of rows affected by the update operation
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static int updateRegisterDetails(long cid, String name, String email, long mobile, String uname, String pwd) throws ClassNotFoundException, SQLException {
        PreparedStatement p1 = Utility.getPreparedStatement("update consumer set consumer_name = ?, email = ?, mobile =?, user_name = ?, password = ? where consumer_id = ?");
        p1.setString(1, name);
        p1.setString(2, email);
        p1.setLong(3, mobile);
        p1.setString(4, uname);
        p1.setString(5, pwd);
        p1.setLong(6, cid);
        int res = p1.executeUpdate();
        return res;
    }

    /**
     * Checks if a consumer with the given username or email already exists in the database.
     * 
     * @param reg the registration model containing the username and email to be checked
     * @return true if a consumer with the given username or email exists, false otherwise
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static boolean isAlreadyExist(RegisterModel reg) throws ClassNotFoundException, SQLException {
        Statement p1 = Utility.getStatement();
        ResultSet r1 = p1.executeQuery("select * from consumer");
        while (r1.next()) {
            if (reg.getUserName().equalsIgnoreCase(r1.getString("user_name")) || reg.getEmail().equalsIgnoreCase(r1.getString("email"))) {
                return true;
            }
        }
        return false;
    }

    /**
     * Checks if a consumer number is found in the consumer details table.
     * 
     * @param reg the registration model containing the consumer number to be checked
     * @return true if the consumer number exists, false otherwise
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static boolean isConsumerNumberFound(RegisterModel reg) throws ClassNotFoundException, SQLException {
        Statement p1 = Utility.getStatement();
        ResultSet r1 = p1.executeQuery("select * from consumer_details");
        while (r1.next()) {
            if (reg.getConsumerNumber() == r1.getLong("consumer_number")) {
                return true;
            }
        }
        return false;
    }

    /**
     * Checks if a meter number is valid by comparing it with existing meter numbers in the consumer details table.
     * 
     * @param reg the registration model containing the meter number to be checked
     * @return true if the meter number exists, false otherwise
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static boolean isMeterNumberValid(RegisterModel reg) throws ClassNotFoundException, SQLException {
        Statement p1 = Utility.getStatement();
        ResultSet r1 = p1.executeQuery("select * from consumer_details");
        while (r1.next()) {
            if (r1.getString("meter_number").equalsIgnoreCase(reg.getMeterNumber())) {
                return true;
            }
        }
        return false;
    }
}
