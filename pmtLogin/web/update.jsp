<%-- 
    Document   : update
    Created on : 2 Nov, 2020, 12:17:44 AM
    Author     : Subash
--%>
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "pmt";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from prohis where pid = '"+id+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<style>
body{
    font-family: calibri;
    background-attachment: fixed;
    background-color: #ffffff;
    background-image: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);
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
  background-color: whitesmoke;
  color: black;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bolder;
}

input[type=submit]:hover {
  background-color: grey;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<body>
<center><h1>Project History Updating</h1></center>
<form method="post" action="update-process.jsp">
<input type="hidden" name="pid" value="<%=resultSet.getString("pid") %>">
ProjectID:
<input type="text" name="pid" value="<%=resultSet.getString("pid") %>">
<br>
TeamID:<br>
<input type="text" name="tid" value="<%=resultSet.getString("tid") %>">
<br>
Title:<br>
<input type="text" name="title" value="<%=resultSet.getString("title") %>">
<br>
Leader Name:<br>
<input type="text" name="leader" value="<%=resultSet.getString("leader") %>">
<br>
Teammate 1:<br>
<input type="text" name="t1" value="<%=resultSet.getString("t1") %>">
<br>
Teammate 2:<br>
<input type="text" name="t2" value="<%=resultSet.getString("t2") %>">
<br>
Teammate 3:<br>
<input type="text" name="t3" value="<%=resultSet.getString("t3") %>">
<br>
Teammate 4:<br>
<input type="text" name="t4" value="<%=resultSet.getString("t4") %>">
<br>
Rating:<br>
<input type="text" name="prating" value="<%=resultSet.getString("prating") %>">
<br>
<input type="submit" value="Submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html> 