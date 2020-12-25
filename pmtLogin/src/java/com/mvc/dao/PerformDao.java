package com.mvc.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mvc.bean.PerformBean;
import com.login.util.DBConnection;
 
public class PerformDao { 
     public String registerUser(PerformBean performBean)
     {
         String pid = performBean.getpid();
         String tid = performBean.gettid();
         String toDate = performBean.gettoDate();
         String title = performBean.gettitle();
         String m1Perf = performBean.getm1Perf();
         String m2Perf = performBean.getm2Perf();
         String m3Perf = performBean.getm3Perf();
         String m4Perf = performBean.getm4Perf();
         String dueDate = performBean.getdueDate();
         String query = performBean.getquery();
         
         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
             con = DBConnection.createConnection();
             String Query = "insert into l2m_query(pid,tid,toDate,title,m1perf,m2perf,m3perf,m4perf,dueDate,query) values (?,?,?,?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(Query);
             preparedStatement.setString(1, pid);
             preparedStatement.setString(2, tid);
             preparedStatement.setString(3, toDate);
             preparedStatement.setString(4, title);
             preparedStatement.setString(5, m1Perf);
             preparedStatement.setString(6, m2Perf);
             preparedStatement.setString(7, m3Perf);
             preparedStatement.setString(8, m4Perf);
             preparedStatement.setString(9, dueDate);
             preparedStatement.setString(10, query);
             
             int i= preparedStatement.executeUpdate();
             
             if (i!=0)  //Just to ensure data has been inserted into the database
             return "SUCCESS"; 
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }       
         return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
     }
}