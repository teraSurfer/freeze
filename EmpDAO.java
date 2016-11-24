
package Appraisal;
/**
 *
 * @author Lanka Achalaesh
 * edit:- 23/11/2016 08:46 PM
 */
public class EmpDAO {
    //for appraisals we need ID, BAND, 
    private int empID,empRating;
    private String empName,location;
    private double empSalary;
    private String empBand;

    /**
     * @return the empID
     */
    public int getEmpID() {
        return empID;
    }

    /**
     * @param empID the empID to set
     */
    public void setEmpID(int empID) {
        this.empID = empID;
    }

    /**
     * @return the empRating
     */
    public int getEmpRating() {
        return empRating;
    }

    /**
     * @param empRating the empRating to set
     */
    public void setEmpRating(int empRating) {
        this.empRating = empRating;
    }

    /**
     * @return the empName
     */
    public String getEmpName() {
        return empName;
    }

    /**
     * @param empName the empName to set
     */
    public void setEmpName(String empName) {
        this.empName = empName;
    }

    /**
     * @return the location
     */
    public String getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * @return the empSalary
     */
    public double getEmpSalary() {
        return empSalary;
    }

    /**
     * @param empSalary the empSalary to set
     */
    public void setEmpSalary(double empSalary) {
        this.empSalary = empSalary;
    }

    /**
     * @return the empBand
     */
    public String getEmpBand() {
        return empBand;
    }

    /**
     * @param empBand the empBand to set
     */
    public void setEmpBand(String empBand) {
        this.empBand = empBand;
    }
    
}
