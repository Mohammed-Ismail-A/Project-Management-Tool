<%-- 
    Document   : prohis
    Created on : 2 Nov, 2020, 12:42:09 AM
    Author     : Subash
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                    td:nth-of-type(2):before { content: "TID"; }
                    td:nth-of-type(3):before { content: "Title"; }
                    td:nth-of-type(4):before { content: "Leader's Name"; }
                    td:nth-of-type(5):before { content: "TM1's Name"; }
                    td:nth-of-type(6):before { content: "TM2's Name"; }
                    td:nth-of-type(7):before { content: "TM3's Name"; }
                    td:nth-of-type(8):before { content: "TM4's Name"; }
                    td:nth-of-type(9):before { content: "Rating"; }
                    td:nth-of-type(10):before { content: "Action"; }
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
                background-color: whitesmoke;
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
    <body>
    <center><h2>Manager's Home</h2></center>
   <table border="1" align="center">
       <thead>
            <tr>
                <th>PID</th>
                <th>TID</th>
                <th>Title</th>
                <th>Leader</th>
                <th>t1</th>
                <th>t2</th>
                <th>t3</th>
                <th>t4</th>
                <th>Rating</th>
                <th>Action</th>
            </tr>            
       </thead>
                <%
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection conn=DriverManager.getConnection("jdbc:mysql://Localhost:3306/pmt","root","");
                        String Query="Select * from prohis";
                        Statement stm=conn.createStatement();
                        ResultSet rs=stm.executeQuery(Query);
                        while(rs.next())
                        {
                            %>
                            <tr>
                            <td><%=rs.getString("pid")%></td>                            
                            <td><%=rs.getString("tid")%></td>
                            <td><%=rs.getString("title")%></td>
                            <td><%=rs.getString("leader")%></td>
                            <td><%=rs.getString("t1")%></td>
                            <td><%=rs.getString("t2")%></td> 
                            <td><%=rs.getString("t3")%></td>                            
                            <td><%=rs.getString("t4")%></td>
                            <td><%=rs.getString("prating")%></td>
                            <td><a href="update.jsp?id=<%=rs.getString("pid")%>">update</a></td>
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
    </body>
</html>
