
package Appraisal;

import java.util.Iterator;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Lanka Achalaesh
 * edit:- 23/11/2016 12:32 AM
 */
public class LoginDAO {
    private int empID,accessLevel;
    private String password,loginName;
    public int getEmpID(){
        return this.empID;
    }

    /**
     * @param empID the empID to set
     */
    public void setEmpID(int empID) {
        this.empID = empID;
    }

    /**
     * @return the accessLevel
     */
    public int getAccessLevel() {
        return accessLevel;
    }

    /**
     * @param accessLevel the accessLevel to set
     */
    public void setAccessLevel(int accessLevel) {
        this.accessLevel = accessLevel;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the loginName
     */
    public String getLoginName() {
        return loginName;
    }

    /**
     * @param loginName the loginName to set
     */
    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }
    public boolean authenticate(String loginName,String password){
        
        Session session = HibernateUtil.getSessionFactory();
        Transaction transaction = session.beginTransaction();
        Criteria c = session.createCriteria(LoginDAO.class);
        Iterator itr = c.list().iterator();
        while(itr.hasNext()){
            LoginDAO lo = (LoginDAO)itr.next();
            if(loginName.equals(lo.loginName)&&password.equals(lo.password)){
                this.accessLevel=lo.accessLevel;
                this.empID=lo.empID;
                this.loginName=lo.loginName;
                this.password=lo.password;
                return true;
            }
        }
        return false;
    }
}
