package com.prating.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.prating.bean.PratingBean;
import com.login.util.DBConnection;
 
public class PratingDao { 
     public String registerUser(PratingBean pratingBean)
     {
         String pid = pratingBean.getpid();
         String tid = pratingBean.gettid();
         String title = pratingBean.gettitle();
         String leader = pratingBean.getleader();
         String t1 = pratingBean.gett1();
         String t2 = pratingBean.gett2();
         String t3 = pratingBean.gett3();
         String t4 = pratingBean.gett4();
         String prating = pratingBean.getprating();
         
         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
             con = DBConnection.createConnection();
             String Query = "insert into prohis(pid,tid,title,leader,t1,t2,t3,t4,prating) values (?,?,?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(Query);
             preparedStatement.setString(1, pid);
             preparedStatement.setString(2, tid);
             preparedStatement.setString(3, title);
             preparedStatement.setString(4, leader);
             preparedStatement.setString(5, t1);
             preparedStatement.setString(6, t2);
             preparedStatement.setString(7, t3);
             preparedStatement.setString(8, t4);
             preparedStatement.setString(9, prating);
             
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