package model;

/**
 * Represents a complaint with details such as complaint ID, consumer number, landmark, service type, category, 
 * contact information, problem description, and address.
 */
public class ComplaintModel {
    private int complaintId;
    private long consumerNumber;
    private String landmark;
    private String serviceType;
    private String category;
    private long mobile;
    private String contactPerson;
    private String problem;  
    private String address;

    /**
     * Constructs a ComplaintModel object with the specified details.
     * 
     * @param complaintId the unique identifier for the complaint
     * @param consumerNumber the consumer number associated with the complaint
     * @param landmark the landmark related to the complaint
     * @param serviceType the type of service related to the complaint
     * @param category the category of the complaint
     * @param mobile the contact mobile number
     * @param contactPerson the name of the contact person
     * @param problem the problem description 
     * @param address the address where the complaint is made
     */
    public ComplaintModel(int complaintId, long consumerNumber, String landmark, String serviceType, String category,
                          long mobile, String contactPerson, String problem, String address) {
        this.complaintId = complaintId;
        this.consumerNumber = consumerNumber;
        this.landmark = landmark;
        this.serviceType = serviceType;
        this.category = category;
        this.mobile = mobile;
        this.contactPerson = contactPerson;
        this.problem = problem;  
        this.address = address;
    }

    /**
     * Gets the complaint ID.
     * 
     * @return the complaint ID
     */
    public int getComplaintId() {
        return complaintId;
    }

    /**
     * Sets the complaint ID.
     * 
     * @param complaintId the complaint ID to set
     */
    public void setComplaintId(int complaintId) {
        this.complaintId = complaintId;
    }

    /**
     * Gets the consumer number associated with the complaint.
     * 
     * @return the consumer number
     */
    public long getConsumerNumber() {
        return consumerNumber;
    }

    /**
     * Sets the consumer number associated with the complaint.
     * 
     * @param consumerNumber the consumer number to set
     */
    public void setConsumerNumber(long consumerNumber) {
        this.consumerNumber = consumerNumber;
    }

    /**
     * Gets the landmark related to the complaint.
     * 
     * @return the landmark
     */
    public String getLandmark() {
        return landmark;
    }

    /**
     * Sets the landmark related to the complaint.
     * 
     * @param landmark the landmark to set
     */
    public void setLandmark(String landmark) {
        this.landmark = landmark;
    }

    /**
     * Gets the type of service related to the complaint.
     * 
     * @return the service type
     */
    public String getServiceType() {
        return serviceType;
    }

    /**
     * Sets the type of service related to the complaint.
     * 
     * @param serviceType the service type to set
     */
    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    /**
     * Gets the category of the complaint.
     * 
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * Sets the category of the complaint.
     * 
     * @param category the category to set
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * Gets the contact mobile number.
     * 
     * @return the mobile number
     */
    public long getMobile() {
        return mobile;
    }

    /**
     * Sets the contact mobile number.
     * 
     * @param mobile the mobile number to set
     */
    public void setMobile(long mobile) {
        this.mobile = mobile;
    }

    /**
     * Gets the name of the contact person.
     * 
     * @return the contact person
     */
    public String getContactPerson() {
        return contactPerson;
    }

    /**
     * Sets the name of the contact person.
     * 
     * @param contactPerson the contact person to set
     */
    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    /**
     * Gets the problem description.
     * 
     * @return the problem description 
     */
    public String getProblem() {
        return problem;  
    }

    /**
     * Sets the problem description.
     * 
     * @param problem the problem description to set 
     */
    public void setProlem(String problem) {
        this.problem = problem;  
    }

    /**
     * Gets the address where the complaint is made.
     * 
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * Sets the address where the complaint is made.
     * 
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }
}
