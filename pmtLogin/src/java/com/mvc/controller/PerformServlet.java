package com.mvc.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.mvc.bean.PerformBean;
import com.mvc.dao.PerformDao;
 
public class PerformServlet extends HttpServlet {
 
     public PerformServlet() {
     }
 
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Copying all the input parameters in to local variables
         String pid = request.getParameter("pid");
         String tid = request.getParameter("tid");
         String toDate = request.getParameter("toDate");
         String title = request.getParameter("title");
         String m1Perf = request.getParameter("m1Perf");
         String m2Perf = request.getParameter("m2Perf");
         String m3Perf = request.getParameter("m3Perf");
         String m4Perf = request.getParameter("m4Perf");
         String dueDate = request.getParameter("dueDate");
         String query = request.getParameter("query");
         
         PerformBean performBean = new PerformBean();
        //Using Java Beans - An easiest way to play with group of related data
         performBean.setpid(pid);
         performBean.settid(tid);
         performBean.settoDate(toDate);
         performBean.settitle(title);
         performBean.setm1Perf(m1Perf); 
         performBean.setm2Perf(m2Perf);
         performBean.setm3Perf(m3Perf);
         performBean.setm4Perf(m4Perf);
         performBean.setdueDate(dueDate); 
         performBean.setquery(query);
         
         PerformDao loginDao = new PerformDao();
         
         String userRegistered = loginDao.registerUser(performBean);
         
         if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Manager page
         {
            request.getRequestDispatcher("Leader.jsp").forward(request, response);
         }
         else   //On Failure, display a meaningful message to the User.
         {
            request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("Perform.jsp").forward(request, response);
         }
     }
}