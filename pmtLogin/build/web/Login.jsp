<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
    <style>
        body  
        {  
            margin: 0;  
            padding: 0;  
            color: black;           
            background-color: #ffffff;
            background-image: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);
            background-attachment: fixed;
            font-family: 'Calibri';  
        }  
        .login{  
                width: 350px;  
                overflow: hidden;  
                margin: auto;  
                margin: 20 0 0 450px;  
                padding: 50px;  
                background-color: #b8c6db;
                background-image: linear-gradient(315deg, #b8c6db 0%, #f5f7fa 74%);
                border-radius: 15px ;
        }  
        h1{  
            text-align: center;
            font-size: 40px;
            background: -webkit-linear-gradient(black, blue);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            padding: 25px;  
        }  
        
        h3{  
            text-align: center;  
            color: black;  
            padding: 10px;  
        }  
        
        label{     
            font-family: Calibri;
            font-size: 25px;
            background: -webkit-linear-gradient(purple, black);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }  
        #Uname{  
            width: 330px;  
            height: 30px;  
            border: none;  
            border-radius: 3px;  
            padding-left: 8px;  
        }  
        #Pass{  
            width: 330px;  
            height: 30px;  
            border: none;  
            border-radius: 3px;  
            padding-left: 8px;
        }  
        #log{  
            width: 330px;  
            height: 30px;  
            background-color: white; 
            color: black; 
            border: 2px;
            border: none;  
            border-radius: 17px;  
            padding-left: 7px;              
        } 
        #log:hover{
            background-color: grey;
        }
        h4{  
            font-family: Calibri;
            text-align: center;  
            color: black;            
        }
    </style>
    </head>
    <body>    
    <h1>Manager - Team Leader Portal</h1>
    <div class="login">    
        <form id="login" name="form" method="post" action="LoginServlet">    
            <label><b>User Name     
            </b>    
            </label>    
            <input type="text" name="username" id="Uname" placeholder="Username">    
            <br><br><br>
            <label><b>Password     
            </b>    
            </label>    
            <input type="Password" name="password" id="Pass" placeholder="Password">    
            <br><br><br>   
            <input type="submit"  value="LOGIN" name="log" id="log" value="Log In Here">       
            <br><br>     
            <h4>Please contact admin/manager in case of login issues</h4>
            <h3>&#169 Project_Management_Tool</h3>
        </form>     
    </div>    
    </body>
</html>