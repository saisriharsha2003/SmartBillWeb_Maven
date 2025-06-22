package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Utility class for managing database connections and statements.
 */
public class Utility {

    private static Statement st;
    private static PreparedStatement pst;

    // Fetching DB configuration from environment variables (in .env used by Docker)
    private static final String JDBC_URL = "jdbc:mysql://smartbill-mysql:3306/" + System.getenv("MYSQL_DATABASE");
    private static final String USERNAME = System.getenv("MYSQL_USER");
    private static final String PASSWORD = System.getenv("MYSQL_PASSWORD");

    /**
     * Gets a Statement object for executing SQL queries.
     * 
     * @return a Statement object
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static Statement getStatement() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
        st = con.createStatement();
        return st;
    }

    /**
     * Gets a PreparedStatement object for executing parameterized SQL queries.
     * 
     * @param sql the SQL query
     * @return a PreparedStatement object
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static PreparedStatement getPreparedStatement(String sql) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
        pst = con.prepareStatement(sql);
        return pst;
    }

    /**
     * Gets a Connection object for the database.
     * 
     * @return a Connection object
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static Connection getConnection1() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
    }
}
