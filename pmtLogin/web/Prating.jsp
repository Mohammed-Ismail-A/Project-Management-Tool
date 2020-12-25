<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<style>
form{
    border: 2px;
}    
th,td{
    padding: 10px;
    text-align: left;
}
tr:hover{
    background-color: grey;
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

input[type=submit][type=reset] {
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
    background-color: white;
}
</style>    
<script> 
function validate()
{ 
     var pid = document.form.pid.value;
     var tid = document.form.tid.value;     
     var title = document.form.title.value; 
     var m1Perf = document.form.leader.value;
     var m2Perf= document.form.t1.value;
     var m2Perf= document.form.t2.value;
     var m4Perf= document.form.t3.value;
     var dueDate= document.form.t4.value;
     var query= document.form.prating.value;
     
     if (pid==null && pid=="")
     { 
     alert("Project ID can't be blank"); 
     return false; 
     }
     else if (tid=="")
     { 
     alert("Team ID can't be blank"); 
     return false; 
     }    
     else if (title=="")
     { 
     alert("Title can't be blank"); 
     return false; 
     }
     else if (leader=="")
     { 
     alert("Leader's name can't be blank"); 
     return false; 
     }
     else if (t1=="")
     { 
     alert("TM -1's name can't be blank"); 
     return false; 
     }
     else if (t2=="")
     { 
     alert("TM -2's name can't be blank"); 
     return false; 
     }
     else if (t3=="")
     { 
     alert("TM -3's name can't be blank"); 
     return false; 
     }
     else if (t4=="")
     { 
     alert("TM -4's name can't be blank"); 
     return false; 
     }
     else if (prating=="")
     { 
     alert("Project's Rating can't be blank"); 
     return false; 
     }
 } 
</script> 
</head>
<body>
<center><h2>Project Performance Score</h2></center>
    <form name="form" action="PratingServlet" method="post" onsubmit="return validate()">
        <table align="center">
         <tr>
         <td>Project ID</td>
         <td><input type="text" name="pid" /></td>
         </tr>
         <tr>
         <td>Team ID</td>
         <td><input type="text" name="tid" /></td>
         </tr>
         <tr>
         <td>Title</td>
         <td><input type="text" name="title" /></td>
         </tr>
         <tr>
         <td>Leader's Name</td>
         <td><input type="text" name="leader" /></td>
         </tr>
         <tr>
         <td>TM-1's Name</td>
         <td><input type="text" name="t1" /></td>
         </tr>
         <tr>
         <td>TM-2's Name</td>
         <td><input type="text" name="t2" /></td>
         </tr>
         <tr>
         <td>TM-3's Name</td>
         <td><input type="text" name="t3" /></td>
         </tr>
         <tr>
         <td>TM-4's Name</td>
         <td><input type="text" name="t4" /></td>
         </tr>
         <tr>
         <td>Project's Rating</td>
         <td><input type="text" name="prating" /></td>
         </tr>
         <tr>
         <td><%=(request.getAttribute("errMessage") == null) ? ""
         : request.getAttribute("errMessage")%></td>
         </tr>
         <tr>
         <td></td>
         <td><input type="submit" value="Register"></input><input
         type="reset" value="Reset"></input></td>
         </tr>
        </table>
    </form>
</body>
</html>