package logic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import model.LoginModel;
import utility.Utility;

/**
 * Contains business logic related to user authentication and account management.
 */
public class LoginLogic {

    /**
     * Authenticates an admin based on provided login details.
     * 
     * @param lg the login model containing admin credentials
     * @return true if the admin credentials are correct, false otherwise
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static boolean authenticateAdmin(LoginModel lg) throws ClassNotFoundException, SQLException {
        String apwd = lg.getPassword();
        PreparedStatement p1 = Utility.getPreparedStatement("select * from admin_login where username = ?");
        p1.setString(1, "admin");
        ResultSet r1 = p1.executeQuery();
        String epwd = "";
        while (r1.next()) {
            epwd = r1.getString("password");
        }
        return apwd.equalsIgnoreCase(epwd);
    }

    /**
     * Authenticates a consumer based on provided login details.
     * 
     * @param lg the login model containing consumer credentials
     * @return true if the consumer credentials are correct and the account status is active, false otherwise
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static boolean authenticateConsumer(LoginModel lg) throws ClassNotFoundException, SQLException {
        String aun = lg.getUserName();
        String apwd = lg.getPassword();
        PreparedStatement p1 = Utility.getPreparedStatement("select * from login where username = ?");
        p1.setString(1, aun);
        ResultSet r1 = p1.executeQuery();
        String epwd = "";
        String ac_status = "";
        while (r1.next()) {
            epwd = r1.getString("password");
            ac_status = r1.getString("status");
        }
        return apwd.equals(epwd) && "Active".equalsIgnoreCase(ac_status);
    }

    /**
     * Fetches the consumer's name based on the username.
     * 
     * @param uname the username of the consumer
     * @return the name of the consumer
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static String fetchConsumerName(String uname) throws ClassNotFoundException, SQLException {
        PreparedStatement p2 = Utility.getPreparedStatement("select * from consumer where user_name = ?");
        p2.setString(1, uname);
        ResultSet rs = p2.executeQuery();
        String cname = "";
        while (rs.next()) {
            cname = rs.getString("consumer_name");
        }
        return cname;
    }

    /**
     * Fetches the consumer ID based on the username.
     * 
     * @param uname the username of the consumer
     * @return the ID of the consumer
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static long fetchConsumerId(String uname) throws ClassNotFoundException, SQLException {
        PreparedStatement p2 = Utility.getPreparedStatement("select * from consumer where user_name = ?");
        p2.setString(1, uname);
        ResultSet rs = p2.executeQuery();
        long cid = 0;
        while (rs.next()) {
            cid = rs.getLong("consumer_id");
        }
        return cid;
    }

    /**
     * Fetches the meter number based on the username.
     * 
     * @param uname the username of the consumer
     * @return the meter number associated with the username
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static String fetchMeterNumber(String uname) throws ClassNotFoundException, SQLException {
        PreparedStatement p2 = Utility.getPreparedStatement("select * from consumer where user_name = ?");
        p2.setString(1, uname);
        ResultSet rs = p2.executeQuery();
        String cid = "";
        while (rs.next()) {
            cid = rs.getString("meter_number");
        }
        return cid;
    }

    /**
     * Fetches user details based on the username.
     * 
     * @param uname the username of the consumer
     * @return a map containing user details
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static HashMap<String, String> fetchUserDetails(String uname) throws ClassNotFoundException, SQLException {
        HashMap<String, String> mp = new HashMap<>();
        String sql = "select * from consumer where user_name = ?";
        PreparedStatement p1 = Utility.getPreparedStatement(sql);
        p1.setString(1, uname);
        ResultSet rs = p1.executeQuery();
        if (rs.next()) {
            mp.put("name", rs.getString("consumer_name"));
            mp.put("email", rs.getString("email"));
            mp.put("mobile", rs.getString("mobile"));
            mp.put("username", rs.getString("user_name"));
            mp.put("password", rs.getString("password"));
            mp.put("consumer_id", String.valueOf(rs.getLong("consumer_id")));
            mp.put("meter_number", rs.getString("meter_number"));
        }
        return mp;
    }

    /**
     * Updates the login details for a consumer.
     * 
     * @param cid the consumer ID
     * @param uname the new username
     * @param pwd the new password
     * @return the number of rows affected by the update operation
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static int updateLoginDetails(long cid, String uname, String pwd) throws ClassNotFoundException, SQLException {
        PreparedStatement p1 = Utility.getPreparedStatement("update login set username = ?, password = ? where consumer_id = ?");
        p1.setString(1, uname);
        p1.setString(2, pwd);
        p1.setLong(3, cid);
        return p1.executeUpdate();
    }

    /**
     * Checks if a user exists in the login table.
     * 
     * @param username the username to be checked
     * @return true if the username exists, false otherwise
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static boolean isUserExist(String username) throws ClassNotFoundException, SQLException {
        Statement p1 = Utility.getStatement();
        ResultSet r1 = p1.executeQuery("select * from login");
        while (r1.next()) {
            if (username.equalsIgnoreCase(r1.getString("username"))) {
                return true;
            }
        }
        return false;
    }

    /**
     * Fetches the account status of a user based on the username.
     * 
     * @param uname the username of the consumer
     * @return true if the account status is active, false otherwise
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static boolean fetchAccountStatus(String uname) throws ClassNotFoundException, SQLException {
        PreparedStatement p1 = Utility.getPreparedStatement("select * from login where username = ?");
        p1.setString(1, uname);
        ResultSet r1 = p1.executeQuery();
        while (r1.next()) {
            if ("Active".equalsIgnoreCase(r1.getString("status"))) {
                return true;
            }
        }
        return false;
    }

    /**
     * Soft deletes a user account by setting its status to "Inactive".
     * 
     * @param conid the consumer ID of the account to be soft deleted
     * @return the number of rows affected by the update operation
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static int softDeleteAccount(long conid) throws ClassNotFoundException, SQLException {
        PreparedStatement p1 = Utility.getPreparedStatement("update login set status = ? where consumer_id = ?");
        p1.setString(1, "Inactive");
        p1.setLong(2, conid);
        return p1.executeUpdate();
    }

    /**
     * Reactivates a user account by setting its status to "Active".
     * 
     * @param uname the username of the account to be reactivated
     * @return the number of rows affected by the update operation
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static int reactivateAccount(String uname) throws ClassNotFoundException, SQLException {
        PreparedStatement p1 = Utility.getPreparedStatement("update login set status = ? where username = ?");
        p1.setString(1, "Active");
        p1.setString(2, uname);
        return p1.executeUpdate();
    }

    /**
     * Reauthenticates a consumer based on the username and password.
     * 
     * @param uname the username of the consumer
     * @param pwd the password of the consumer
     * @return true if the credentials are correct, false otherwise
     * @throws ClassNotFoundException if the JDBC driver class is not found
     * @throws SQLException if a database access error occurs
     */
    public static boolean reauthenticateConsumer(String uname, String pwd) throws ClassNotFoundException, SQLException {
        PreparedStatement p1 = Utility.getPreparedStatement("select * from login where username = ?");
        p1.setString(1, uname);
        ResultSet r1 = p1.executeQuery();
        String epwd = "";
        while (r1.next()) {
            epwd = r1.getString("password");
        }
        return epwd.equalsIgnoreCase(pwd);
    }
}
