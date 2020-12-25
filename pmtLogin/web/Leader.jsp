<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Leader Page</title>
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
<% //In case, if Editor session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Leader")== null) )
{
%>
<jsp:forward page="Login.jsp"></jsp:forward>
<%} %>
<body>
<center><h1>Leader's Home</h1></center>

<center><h2>Project Query Database</h2></center>

<table border="1" align='center'>
<thead>    
<tr style="font-weight: bold;">
<td>Project ID</td>
<td>Team ID</td>
<td>Today Date</td>
<td>Title</td>
<td>M1's Completion%</td>
<td>M2's Completion%</td>
<td>M3's Completion%</td>
<td>M4's Completion%</td>
<td>Due Date</td>
<td>Query</td>
</tr>
</thead>
<%
try{
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pmt","root","");
    statement=connection.createStatement();
    String sql ="select * from l2m_query where tid='TM001'";
    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
    %>
    <tr>
    <td><%=resultSet.getString("pid") %></td>
    <td><%=resultSet.getString("tid") %></td>
    <td><%=resultSet.getString("toDate") %></td>
    <td><%=resultSet.getString("title") %></td>
    <td><%=resultSet.getString("m1Perf") %></td>
    <td><%=resultSet.getString("m2Perf") %></td>
    <td><%=resultSet.getString("m3Perf") %></td>
    <td><%=resultSet.getString("m4Perf") %></td>
    <td><%=resultSet.getString("dueDate") %></td>
    <td><%=resultSet.getString("query") %></td>
    </tr>
    <%
    }
    connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<center><h2>Review From Manager</h2></center>

<table border="1" align='center'>
<thead>    
<tr style="font-weight: bold;">
<td>Project ID</td>
<td>Team ID</td>
<td>Title</td>
<td>Leader's Name</td>
<td>TM-1's Name</td>
<td>TM-2's Name</td>
<td>TM-3's Name</td>
<td>TM-4's Name</td>
<td>Rating(of 50)</td>
</tr>
</thead>
<%
try{
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pmt","root","");
    statement=connection.createStatement();
    String sql ="select * from prohis where tid='TM001'";
    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
    %>
    <tr>
    <td><%=resultSet.getString("pid") %></td>
    <td><%=resultSet.getString("tid") %></td>
    <td><%=resultSet.getString("title") %></td>
    <td><%=resultSet.getString("leader") %></td>
    <td><%=resultSet.getString("t1") %></td>
    <td><%=resultSet.getString("t2") %></td>
    <td><%=resultSet.getString("t3") %></td>
    <td><%=resultSet.getString("t4") %></td>
    <td><%=resultSet.getString("prating") %></td>
    </tr>
    <%
    }
    connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

<center><a href="Perform.jsp">Register your team's Completion</a></center>

<div style="text-align: center"><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></div>
 
</body>
</html>