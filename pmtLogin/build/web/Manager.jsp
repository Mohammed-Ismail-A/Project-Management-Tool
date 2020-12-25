<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Manager Page</title>
<style>
th,td{
padding: 10px;
background-color: white;
text-align: center;

}

@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

    /* Force table to not be like tables anymore */
    table, thead, tbody, th, td, tr { 
            display: block; 
    }

    /* Hide table headers (but not display: none;, for accessibility) */
    thead tr { 
            position: absolute;
            top: -9999px;
            left: -9999px;
    }

    tr { border: 1px solid #ccc; }

    td { 
            /* Behave  like a "row" */
            border: none;
            border-bottom: 1px solid #eee; 
            position: relative;
            padding-left: 50%; 
    }

    td:before { 
            /* Now like a table header */
            position: absolute;
            /* Top/left values mimic padding */
            top: 6px;
            left: 6px;
            width: 45%; 
            padding-right: 10px; 
            white-space: nowrap;
            font-weight: bold;
            border: 1px;                     
    }       

    /*
    Label the data
    */
    td:nth-of-type(1):before { content: "PID"; }
    td:nth-of-type(2):before { content: "Today's Date"; }
    td:nth-of-type(3):before { content: "Title"; }
    td:nth-of-type(4):before { content: "M1's Completion%"; }
    td:nth-of-type(5):before { content: "M2's Completion%"; }
    td:nth-of-type(6):before { content: "M3's Completion%"; }
    td:nth-of-type(7):before { content: "M4's Completion%"; }
    td:nth-of-type(8):before { content: "Due Date"; }
    td:nth-of-type(9):before { content: "Query"; }
}

tr:hover{
    background-color: grey;
}
h2{

}
input{
    margin-left: 40px;
    margin-top: 40px;
}
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

h2{
    display: inline;
    font-size: 20px;
    font-family: calibri;
}

body{
    font-family: calibri;
    background-attachment: fixed;
    background-color: #ffffff;
    background-image: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);
}
a{
    background-color: white;
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
}
a:hover{
    background-color: grey;
}
</style>

</head>
<% //In case, if Admin session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Manager")== null) )
{
%>
<jsp:forward page="Login.jsp"></jsp:forward>
<%} %>
<body>
    <center><h1>Manager's Home</h1></center><br><br>
   <table border="1" align="center">
       <thead>
            <tr>
                <th>PID</th>
                <th>todate</th>
                <th>Title</th>
                <th>p1</th>
                <th>p2</th>
                <th>p3</th>
                <th>p4</th>
                <th>duedate</th>
                <th>Remain</th>
                <th>query</th>
            </tr>   
       </thead>
                <%
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection conn=DriverManager.getConnection("jdbc:mysql://Localhost:3306/pmt","root","");
                        String Query="Select * from l2m_query";
                        Statement stm=conn.createStatement();
                        ResultSet rs=stm.executeQuery(Query);
                        while(rs.next())
                        {
                            %>
                            <tr>
                            <td><%=rs.getString("pid")%></td>                            
                            <td><%=rs.getDate("todate")%></td>
                            <td><%=rs.getString("title")%></td>
                            <td><%=rs.getString("m1perf")%></td>
                            <td><%=rs.getString("m2perf")%></td>
                            <td><%=rs.getString("m3perf")%></td> 
                            <td><%=rs.getString("m4perf")%></td>                            
                            <td><%=rs.getDate("duedate")%></td>
                            <td><%=rs.getDate("duedate")%></td>
                            <td><%=rs.getString("query")%></td>
                            </tr>
                <%
                        }
                    }
                    catch(Exception ex)
                    {
                        out.println("Exception:"+ex.getMessage());
                        ex.printStackTrace();
                    }
        
                %>
        </table>  
<center>
<a href="mantrack.html"><h2>Track a team</h2></a>
<a href="Prating.jsp"><h2>Provide Performance Score for a Team</h2></a>
<a href="prohis.jsp"><h2>Update the Team's Data</h2></a>
</center>
<div style="text-align: center"><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></div>

</body>
</html>