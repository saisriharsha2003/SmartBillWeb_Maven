package model;

/**
 * Represents a payment model containing details of a payment transaction, including the transaction number,
 * bill number, paid amount, transaction mode, date, consumer ID, and meter number.
 */
public class PaymentModel {
    
    private int transactionNumber;
    private int billNumber;
    private double paidAmount;
    private String transactionMode;
    private String transactionDate;
    private long consumerId;
    private String meterNumber;

    /**
     * Constructs a PaymentModel object with the specified details of the payment transaction.
     * 
     * @param transactionNumber the unique identifier for the payment transaction
     * @param billNumber the unique identifier for the bill associated with the payment
     * @param paidAmount the amount paid in the transaction
     * @param transactionMode the mode of the transaction (e.g., cash, credit card)
     * @param transactionDate the date of the payment transaction
     * @param consumerId the unique identifier for the consumer making the payment
     * @param meterNumber the meter number associated with the payment
     */
    public PaymentModel(int transactionNumber, int billNumber, double paidAmount, String transactionMode,
            String transactionDate, long consumerId, String meterNumber) {
        super();
        this.transactionNumber = transactionNumber;
        this.billNumber = billNumber;
        this.paidAmount = paidAmount;
        this.transactionMode = transactionMode;
        this.transactionDate = transactionDate;
        this.consumerId = consumerId;
        this.meterNumber = meterNumber;
    }

    /**
     * Gets the meter number associated with the payment.
     * 
     * @return the meter number
     */
    public String getMeterNumber() {
        return meterNumber;
    }

    /**
     * Sets the meter number associated with the payment.
     * 
     * @param meterNumber the meter number to set
     */
    public void setMeterNumber(String meterNumber) {
        this.meterNumber = meterNumber;
    }

    /**
     * Gets the unique identifier for the payment transaction.
     * 
     * @return the transaction number
     */
    public int getTransactionNumber() {
        return transactionNumber;
    }

    /**
     * Sets the unique identifier for the payment transaction.
     * 
     * @param transactionNumber the transaction number to set
     */
    public void setTransactionNumber(int transactionNumber) {
        this.transactionNumber = transactionNumber;
    }

    /**
     * Gets the unique identifier for the bill associated with the payment.
     * 
     * @return the bill number
     */
    public int getBillNumber() {
        return billNumber;
    }

    /**
     * Sets the unique identifier for the bill associated with the payment.
     * 
     * @param billNumber the bill number to set
     */
    public void setBillNumber(int billNumber) {
        this.billNumber = billNumber;
    }

    /**
     * Gets the amount paid in the transaction.
     * 
     * @return the paid amount
     */
    public double getPaidAmount() {
        return paidAmount;
    }

    /**
     * Sets the amount paid in the transaction.
     * 
     * @param paidAmount the paid amount to set
     */
    public void setPaidAmount(double paidAmount) {
        this.paidAmount = paidAmount;
    }

    /**
     * Gets the mode of the transaction (e.g., cash, credit card).
     * 
     * @return the transaction mode
     */
    public String getTransactionMode() {
        return transactionMode;
    }

    /**
     * Sets the mode of the transaction (e.g., cash, credit card).
     * 
     * @param transactionMode the transaction mode to set
     */
    public void setTransactionMode(String transactionMode) {
        this.transactionMode = transactionMode;
    }

    /**
     * Gets the date of the payment transaction.
     * 
     * @return the transaction date
     */
    public String getTransactionDate() {
        return transactionDate;
    }

    /**
     * Sets the date of the payment transaction.
     * 
     * @param transactionDate the transaction date to set
     */
    public void setTransactionDate(String transactionDate) {
        this.transactionDate = transactionDate;
    }

    /**
     * Gets the unique identifier for the consumer making the payment.
     * 
     * @return the consumer ID
     */
    public long getConsumerId() {
        return consumerId;
    }

    /**
     * Sets the unique identifier for the consumer making the payment.
     * 
     * @param consumerId the consumer ID to set
     */
    public void setConsumerId(long consumerId) {
        this.consumerId = consumerId;
    }
}
