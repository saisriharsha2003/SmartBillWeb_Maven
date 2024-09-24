package model;

/**
 * Represents a login model containing the details required for user authentication, including consumer ID,
 * username, and password.
 */
public class LoginModel {
    
    private long consumerId;
    private String userName;
    private String password;

    /**
     * Constructs a LoginModel object with the specified username and password.
     * 
     * @param userName the username for login
     * @param password the password for login
     */
    public LoginModel(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    /**
     * Gets the consumer ID associated with the login.
     * 
     * @return the consumer ID
     */
    public long getConsumerId() {
        return consumerId;
    }

    /**
     * Sets the consumer ID associated with the login.
     * 
     * @param consumerId the consumer ID to set
     */
    public void setConsumerId(long consumerId) {
        this.consumerId = consumerId;
    }

    /**
     * Gets the username for login.
     * 
     * @return the username
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Sets the username for login.
     * 
     * @param userName the username to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Gets the password for login.
     * 
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets the password for login.
     * 
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
}
