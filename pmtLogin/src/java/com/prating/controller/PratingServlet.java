package com.prating.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.prating.bean.PratingBean;
import com.prating.dao.PratingDao;
 
public class PratingServlet extends HttpServlet {
 
     public PratingServlet() {
     }
 
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Copying all the input parameters in to local variables
         String pid = request.getParameter("pid");
         String tid = request.getParameter("tid");
         String title = request.getParameter("title");
         String leader = request.getParameter("leader");
         String t1 = request.getParameter("t1");
         String t2 = request.getParameter("t2");
         String t3 = request.getParameter("t3");
         String t4 = request.getParameter("t4");
         String prating = request.getParameter("prating");
         
         PratingBean pratingBean = new PratingBean();
        //Using Java Beans - An easiest way to play with group of related data
         pratingBean.setpid(pid);
         pratingBean.settid(tid);
         pratingBean.settitle(title);
         pratingBean.setleader(leader); 
         pratingBean.sett1(t1);
         pratingBean.sett2(t2);
         pratingBean.sett3(t3);
         pratingBean.sett4(t4); 
         pratingBean.setprating(prating);
         
         PratingDao pratingDao = new PratingDao();
         
         String userRegistered = pratingDao.registerUser(pratingBean);
         
         if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Manager page
         {
            request.getRequestDispatcher("Manager.jsp").forward(request, response);
         }
         else   //On Failure, display a meaningful message to the User.
         {
            request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("Prating.jsp").forward(request, response);
         }
     }
}