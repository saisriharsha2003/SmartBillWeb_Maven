package model;

/**
 * Represents a registration model containing details for a consumer's registration,
 * including consumer number, meter number, title, name, email, mobile number, gender,
 * username, and password.
 */
public class RegisterModel {

    private long consumerNumber;
    private String meterNumber;
    private String title;
    private String name;
    private String email;
    private long mobile;
    private String gender;
    private String userName;
    private String password;

    /**
     * Constructs a RegisterModel object with the specified registration details.
     * 
     * @param consumerNumber the unique identifier for the consumer
     * @param meterNumber the meter number associated with the consumer
     * @param title the title of the consumer (e.g., Mr., Ms.)
     * @param name the name of the consumer
     * @param email the email address of the consumer
     * @param mobile the mobile number of the consumer
     * @param gender the gender of the consumer
     * @param userName the username for the consumer's account
     * @param password the password for the consumer's account
     */
    public RegisterModel(long consumerNumber, String meterNumber, String title, String name, String email, long mobile, String gender,
            String userName, String password) {
        this.consumerNumber = consumerNumber;
        this.meterNumber = meterNumber;
        this.title = title;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.gender = gender;
        this.userName = userName;
        this.password = password;
    }

    /**
     * Gets the title of the consumer.
     * 
     * @return the title of the consumer
     */
    public String getTitle() {
        return title;
    }

    /**
     * Sets the title of the consumer.
     * 
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * Gets the name of the consumer.
     * 
     * @return the name of the consumer
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of the consumer.
     * 
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the email address of the consumer.
     * 
     * @return the email address of the consumer
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets the email address of the consumer.
     * 
     * @param email the email address to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Gets the mobile number of the consumer.
     * 
     * @return the mobile number of the consumer
     */
    public long getMobile() {
        return mobile;
    }

    /**
     * Sets the mobile number of the consumer.
     * 
     * @param mobile the mobile number to set
     */
    public void setMobile(long mobile) {
        this.mobile = mobile;
    }

    /**
     * Gets the gender of the consumer.
     * 
     * @return the gender of the consumer
     */
    public String getGender() {
        return gender;
    }

    /**
     * Sets the gender of the consumer.
     * 
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * Gets the username for the consumer's account.
     * 
     * @return the username for the consumer's account
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Sets the username for the consumer's account.
     * 
     * @param userName the username to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Gets the password for the consumer's account.
     * 
     * @return the password for the consumer's account
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets the password for the consumer's account.
     * 
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Gets the unique identifier for the consumer.
     * 
     * @return the consumer number
     */
    public long getConsumerNumber() {
        return consumerNumber;
    }

    /**
     * Sets the unique identifier for the consumer.
     * 
     * @param consumerNumber the consumer number to set
     */
    public void setConsumerNumber(long consumerNumber) {
        this.consumerNumber = consumerNumber;
    }

    /**
     * Gets the meter number associated with the consumer.
     * 
     * @return the meter number
     */
    public String getMeterNumber() {
        return meterNumber;
    }

    /**
     * Sets the meter number associated with the consumer.
     * 
     * @param meterNumber the meter number to set
     */
    public void setMeterNumber(String meterNumber) {
        this.meterNumber = meterNumber;
    }
}
