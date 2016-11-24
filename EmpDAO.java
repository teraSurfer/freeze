/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Employee;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author MSLCELTP1800
 */
public class EmpDAO {
   private int empID;
   private String empName;
    private String empGender;
    private double empSalary;

    public EmpDAO(int empID, String empName, String empGender, double empSalary) {
        this.empID = empID;
        this.empName = empName;
        this.empGender = empGender;
        this.empSalary = empSalary;
    }
    public EmpDAO(){
        
    }

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
     * @return the empGender
     */
    public String getEmpGender() {
        return empGender;
    }

    /**
     * @param empGender the empGender to set
     */
    public void setEmpGender(String empGender) {
        this.empGender = empGender;
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
    public boolean insert(){
        Session session = HibernateUtil.getSessionFactory();
        Transaction transaction = session.beginTransaction();
        session.save(this);
        transaction.commit();
        return true;
    }
    public boolean update(int oid){
        Session session = HibernateUtil.getSessionFactory();
        Transaction transaction = session.beginTransaction();
        EmpDAO e = (EmpDAO) session.get(EmpDAO.class, oid);
        session.evict(e);
        e.setEmpGender(this.empGender);
        e.setEmpID(this.empID);
        e.setEmpName(this.empName);
        e.setEmpSalary(this.empSalary);
        session.update(e);
        transaction.commit();
        return true;
    }
    public static EmpDAO display(int id){
        Session session = HibernateUtil.getSessionFactory();
        Transaction transaction = session.beginTransaction();
        EmpDAO e = (EmpDAO) session.get(EmpDAO.class, id);
        System.out.println("Here!!!!!---------------->"+e.empName);
        transaction.commit();
        return e;
        
    }

    @Override
    public String toString() {
        return "EmpDAO{" + "empID=" + empID + ", empName=" + empName + ", empGender=" + empGender + ", empSalary=" + empSalary + '}';
    }
   
    
}
