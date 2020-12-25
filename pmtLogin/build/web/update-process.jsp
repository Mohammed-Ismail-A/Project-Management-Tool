<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/pmt";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String pid = request.getParameter("pid");
String tid = request.getParameter("tid");
String title=request.getParameter("title");
String leader=request.getParameter("leader");
String t1 = request.getParameter("t1");
String t2 = request.getParameter("t2");
String t3 = request.getParameter("t3");
String t4 = request.getParameter("t4");
String rating=request.getParameter("prating");
if(pid != null)
{
Connection con = null;
PreparedStatement ps = null;
//int personID = Integer.parseInt(pid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update prohis set pid=?,tid=?,title=?,leader=?,t1=?,t2=?,t3=?,t4=?,prating=? where pid = '"+pid+"' ";
ps = con.prepareStatement(sql);
ps.setString(1,pid);
ps.setString(2,tid);
ps.setString(3, title);
ps.setString(4, leader);
ps.setString(5,t1);
ps.setString(6,t2);
ps.setString(7,t3);
ps.setString(8,t4);
ps.setString(9,rating);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%> 
<html>
    <center><a style="background-color: white;
    border:2px solid black;
    color:black;
    padding: 5px 10px;
    text-align: center;
    display: inline-block;
    font-size: 20px;
    font-family: calibri;
    margin:20px 30px;
    cursor: pointer;
    text-decoration: none;
    background-attachment: fixed;
    background-color: #ffffff;
    background-image: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);" href="Manager.jsp">Return to Home</a></center>
</html>