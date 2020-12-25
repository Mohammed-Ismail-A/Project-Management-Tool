<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "pmt";
String userid = "root";
String password = "";
String name = request.getParameter("tid");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Search</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
	td:nth-of-type(1):before { content: "Project ID"; }
	td:nth-of-type(2):before { content: "Team ID"; }
	td:nth-of-type(3):before { content: "Title"; }
	td:nth-of-type(4):before { content: "M1's Completion%"; }
	td:nth-of-type(5):before { content: "M2's Completion%"; }
	td:nth-of-type(6):before { content: "M3's Completion%"; }
	td:nth-of-type(7):before { content: "M4's Completion%"; }
	td:nth-of-type(8):before { content: "Rating"; }
}
.center {
  margin-left: auto;
  margin-right: auto;
  margin-top: 10%;
}

tr:hover{
    background-color: grey;
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
</style>

</head>
<center><h1 style="margin-top:10%;">Search Result for the selected team</h1></center>
<body  style="top: 50%;left: 50%;">
<table class="center" border="1">
<thead>    
<tr class="row100 body">

<th>Project ID</th>
<th>Team ID</th>
<th>Title</th>
<th>Leader</th>
<th>T1</th>
<th>T2</th>
<th>T3</th>
<th>T4</th>
<th>Rating</th>

</tr>
</thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from prohis where tid = '"+name+"' ";
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
<center><a href="Manager.jsp">Return to Home</a></center>
</body>
</html>
