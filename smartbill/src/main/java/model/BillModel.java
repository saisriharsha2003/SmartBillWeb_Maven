package model;

/**
 * Represents a bill with details such as bill number, due amount, bill amount, due date, penalty, status, and meter number.
 */
public class BillModel {
    private int billNumber;
    private double dueAmount;
    private double billAmount;
    private String dueDate;
    private double penalty;
    private String status;
    private String meterNumber;

    /**
     * Gets the bill number.
     * 
     * @return the bill number
     */
    public int getBillNumber() {
        return billNumber;
    }

    /**
     * Sets the bill number.
     * 
     * @param billNumber the bill number to set
     */
    public void setBillNumber(int billNumber) {
        this.billNumber = billNumber;
    }

    /**
     * Gets the due amount of the bill.
     * 
     * @return the due amount
     */
    public double getDueAmount() {
        return dueAmount;
    }

    /**
     * Sets the due amount of the bill.
     * 
     * @param dueAmount the due amount to set
     */
    public void setDueAmount(double dueAmount) {
        this.dueAmount = dueAmount;
    }

    /**
     * Gets the total amount of the bill.
     * 
     * @return the bill amount
     */
    public double getBillAmount() {
        return billAmount;
    }

    /**
     * Sets the total amount of the bill.
     * 
     * @param billAmount the bill amount to set
     */
    public void setBillAmount(double billAmount) {
        this.billAmount = billAmount;
    }

    /**
     * Gets the due date of the bill.
     * 
     * @return the due date
     */
    public String getDueDate() {
        return dueDate;
    }

    /**
     * Sets the due date of the bill.
     * 
     * @param dueDate the due date to set
     */
    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    /**
     * Gets the status of the bill.
     * 
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * Sets the status of the bill.
     * 
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * Gets the meter number associated with the bill.
     * 
     * @return the meter number
     */
    public String getMeterNumber() {
        return meterNumber;
    }

    /**
     * Sets the meter number associated with the bill.
     * 
     * @param meterNumber the meter number to set
     */
    public void setMeterNumber(String meterNumber) {
        this.meterNumber = meterNumber;
    }

    /**
     * Gets the penalty amount for the bill.
     * 
     * @return the penalty amount
     */
    public double getPenalty() {
        return penalty;
    }

    /**
     * Sets the penalty amount for the bill.
     * 
     * @param penalty the penalty amount to set
     */
    public void setPenalty(double penalty) {
        this.penalty = penalty;
    }

    /**
     * Constructs a BillModel object with the specified details.
     * 
     * @param billNumber the bill number
     * @param dueAmount the due amount of the bill
     * @param billAmount the total amount of the bill
     * @param dueDate the due date of the bill
     * @param penalty the penalty amount
     * @param status the status of the bill
     * @param meterNumber the meter number associated with the bill
     */
    public BillModel(int billNumber, double dueAmount, double billAmount, String dueDate, double penalty, String status, 
                     String meterNumber) {
        this.billNumber = billNumber;
        this.dueAmount = dueAmount;
        this.billAmount = billAmount;
        this.dueDate = dueDate;
        this.penalty = penalty;
        this.status = status;
        this.meterNumber = meterNumber;
    }
}
